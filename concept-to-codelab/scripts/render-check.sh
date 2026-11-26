#!/usr/bin/env bash
# Check a lesson page at phone width in headless Chrome.
#
# Usage:
#   render-check.sh LESSON.html              list elements wider than the phone screen
#   render-check.sh LESSON.html --shot N     also save a screenshot of step N
#
# Exit codes: 0 no overflow, 1 overflow found, 2 setup error.
# Env: WIDTH (default 375), CHROME (path to Chrome or Chromium), OUT (output dir).
#
# Headless Chrome enforces a minimum window width of about 500 px, so a
# 375 px window is not a phone layout. This script loads the lesson in a
# 375 px iframe inside a wider window instead.
set -euo pipefail

lesson="${1:?usage: render-check.sh LESSON.html [--shot N]}"
shot=""
if [[ "${2:-}" == "--shot" ]]; then shot="${3:?--shot needs a step number}"; fi
width="${WIDTH:-375}"
lesson="$(cd "$(dirname "$lesson")" && pwd)/$(basename "$lesson")"
[[ -f "$lesson" ]] || { echo "no such file: $lesson" >&2; exit 2; }

chrome="${CHROME:-}"
if [[ -z "$chrome" ]]; then
  for c in "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
           "/Applications/Chromium.app/Contents/MacOS/Chromium" \
           "$(command -v google-chrome || true)" "$(command -v chromium || true)"; do
    if [[ -n "$c" && -x "$c" ]]; then chrome="$c"; break; fi
  done
fi
[[ -n "$chrome" ]] || { echo "Chrome not found; set CHROME" >&2; exit 2; }

out="${OUT:-$(mktemp -d)}"
mkdir -p "$out"
probe_page="$out/render-check-probe.html"
harness="$out/render-check-harness.html"

# The probe shows every step and reveal, waits for layout, then reports each
# element that ends past the right edge and is not inside a scrolling or
# clipping box. Only the deepest such elements are listed: they are the causes.
probe='<script>
addEventListener("load", function () { setTimeout(function () {
  document.querySelectorAll("[hidden]").forEach(function (e) { e.hidden = false; });
  setTimeout(function () {
    var W = document.documentElement.clientWidth;
    function over(e) { var r = e.getBoundingClientRect(); return r.width > 0 && r.right > W + 1; }
    function contained(e) {
      for (var p = e.parentElement; p && p !== document.body; p = p.parentElement) {
        if (getComputedStyle(p).overflowX !== "visible") return true;
      }
      return false;
    }
    var all = Array.prototype.filter.call(document.querySelectorAll("body *"), function (e) { return over(e) && !contained(e); });
    var leaves = all.filter(function (e) { return !all.some(function (o) { return o !== e && e.contains(o); }); });
    var bad = leaves.slice(0, 15).map(function (e) {
      var step = e.closest(".step");
      return { step: step ? step.id : "", tag: e.tagName.toLowerCase() + (e.className && typeof e.className === "string" ? "." + e.className.trim().split(/\s+/).join(".") : ""),
               right: Math.round(e.getBoundingClientRect().right), text: (e.textContent || "").trim().slice(0, 60) };
    });
    parent.document.body.setAttribute("data-probe", JSON.stringify({ viewport: W, pageWidth: document.documentElement.scrollWidth, overflow: bad }));
  }, 800);
}, 1500); });
</script>'

python3 - "$lesson" "$probe_page" "$probe" <<'PY'
import sys
src, dst, probe = sys.argv[1], sys.argv[2], sys.argv[3]
html = open(src, encoding="utf-8").read()
html = html.replace("</body>", probe + "</body>", 1) if "</body>" in html else html + probe
open(dst, "w", encoding="utf-8").write(html)
PY

printf '<html><body style="margin:0"><iframe src="file://%s" style="width:%spx;height:3000px;border:0"></iframe></body></html>' \
  "$probe_page" "$width" > "$harness"

dom="$("$chrome" --headless=new --disable-gpu --allow-file-access-from-files \
  --window-size=$((width + 300)),3000 --virtual-time-budget=6000 --dump-dom "file://$harness" 2>/dev/null)"
result="$(printf '%s' "$dom" | python3 -c 'import sys,re,html
m = re.search(r"data-probe=\"([^\"]*)\"", sys.stdin.read())
print(html.unescape(m.group(1)) if m else "")')"
[[ -n "$result" ]] || { echo "probe did not report; check the page loads in Chrome" >&2; exit 2; }
echo "$result"

if [[ -n "$shot" ]]; then
  # Show reveals too, so figures behind a "Try first" or "Check" appear.
  shot_page="$out/render-check-shot-page.html"
  python3 - "$lesson" "$shot_page" <<'PY'
import re, sys
html = open(sys.argv[1], encoding="utf-8").read()
open(sys.argv[2], "w", encoding="utf-8").write(re.sub(r"\s+hidden(?=[\s>])", "", html))
PY
  shot_harness="$out/render-check-shot.html"
  printf '<html><body style="margin:0;background:#888"><iframe src="file://%s#step-%s" style="width:%spx;height:2400px;border:0;background:#fff"></iframe></body></html>' \
    "$shot_page" "$shot" "$width" > "$shot_harness"
  "$chrome" --headless=new --disable-gpu --allow-file-access-from-files --hide-scrollbars \
    --window-size=$((width + 300)),2400 --virtual-time-budget=6000 \
    --screenshot="$out/step-$shot.png" "file://$shot_harness" >/dev/null 2>&1
  echo "screenshot: $out/step-$shot.png (lesson is the left $width px)"
fi

printf '%s' "$result" | python3 -c 'import sys,json; sys.exit(1 if json.load(sys.stdin)["overflow"] else 0)'
