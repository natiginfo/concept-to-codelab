# Lesson markup patterns

Use these snippets to fill a copy of `assets/lesson-template.html`. Read the template itself only to change its styling or script.

## Fill a copy of the template

1. Copy `assets/lesson-template.html` to the lesson path with a shell command.
2. Replace the text between `<!-- LESSON-NAV:START -->` and `<!-- LESSON-NAV:END -->` with one step link per section.
3. Replace the text between `<!-- LESSON-BODY:START -->` and `<!-- LESSON-BODY:END -->` with the step sections.
4. Replace the sample title `Convert between bytes and KiB`. It appears in `<title>` and in `.tb-title`.
5. Set `var KEY = "codelab:<lesson-slug>"` on the line marked `STORAGE_KEY`, so saved progress is per lesson.

The page computes the time left from each section's `data-min`. The Back and Next buttons, the step list, Read all and saved progress need no edits.

## Rules the script relies on

- Each step is `<section class="step" id="step-N" data-min="M">`, with a matching `<a href="#step-N" data-step="N">` link.
- Each radio group needs a `name` that is unique in the page.
- `data-answer` on the `.quiz` element holds the correct radio `value`, or the number for `data-kind="num"`.
- `data-fb` on each radio is the feedback for that choice. Name the misconception behind each wrong choice.
- `data-reveal="id"` shows the element with that id after the learner checks.
- A `.quiz.practice` element counts toward the practice summary in `#summary`.

## Step link

```html
<li><a href="#step-2" data-step="2"><span class="num"><span>2</span></span>Bytes to KiB</a></li>
```

## Step section

```html
<section class="step" id="step-2" data-min="3">
  <h1>2. Convert bytes to KiB</h1>
  <p class="dur">Duration: 3 min</p>
  <!-- try-first or recall quiz, explanation, worth-writing-down note -->
</section>
```

## Overview metadata and quick reference

```html
<dl class="meta">
  <div><dt>You will learn</dt><dd>…</dd></div>
  <div><dt>Before you start</dt><dd>…</dd></div>
  <div><dt>You need</dt><dd>Paper and a pen for notes.</dd></div>
</dl>
<h2 id="quick-reference">Quick reference</h2>
<p class="paper">Come back here after practice to check your answers.</p>
<div class="tablewrap"><table>
  <thead><tr><th>Task</th><th>Rule</th><th>Why</th></tr></thead>
  <tbody><tr><td><a href="#step-2">Bytes to KiB</a></td><td>Divide by 1,024</td><td>Each group of 1,024 bytes is 1 KiB.</td></tr></tbody>
</table></div>
```

## Try-first choice that reveals the explanation

Use the tag `Recall` and drop `data-reveal` for a recall question about the previous step.

```html
<div class="callout try quiz" data-answer="b" data-reveal="s2-work">
  <p class="tag">Try first</p>
  <p class="q">How many KiB is 3,072 bytes?</p>
  <fieldset class="choices"><legend class="sr">Choose one</legend>
    <label><input type="radio" name="q-s2" value="a" data-fb="3.072 divides by 1,000. A KiB is 1,024 bytes.">3.072 KiB</label>
    <label><input type="radio" name="q-s2" value="b" data-fb="Right. 3,072 bytes hold three groups of 1,024.">3 KiB</label>
  </fieldset>
  <button class="btn check">Lock in</button>
  <p class="fb" aria-live="polite"></p>
</div>
<div id="s2-work" class="stack" hidden>
  <ol class="work"><li>…</li></ol>
</div>
```

## Worth writing down

```html
<div class="callout note quiz" data-answer="b" data-reveal="s2-note">
  <p class="tag">Worth writing down</p>
  <p class="paper">On paper, write the rule in your own words. Then check the key part:</p>
  <p class="q">Divide bytes by ___ to get KiB.</p>
  <fieldset class="choices"><legend class="sr">Choose one</legend>
    <label><input type="radio" name="q-s2n" value="a" data-fb="1,000 gives kilobytes (kB), a different unit.">1,000</label>
    <label><input type="radio" name="q-s2n" value="b" data-fb="Right.">1,024</label>
  </fieldset>
  <button class="btn ghost check">Check</button>
  <p class="fb" aria-live="polite"></p>
  <p id="s2-note" hidden><strong>Compare with your note:</strong> Divide bytes by 1,024 to count KiB.</p>
</div>
```

## Practice item with confidence

For a choice item, replace `num-row` with a `fieldset class="choices"` as above, and drop `data-kind`.

```html
<div class="quiz practice" data-kind="num" data-answer="5">
  <p class="q">1. How many KiB are in 5,120 bytes?</p>
  <div class="num-row"><label class="sr" for="p1">Answer</label><input type="text" id="p1" inputmode="numeric" autocomplete="off"><span class="unit">KiB</span></div>
  <fieldset class="conf"><legend>I am</legend><label><input type="radio" name="c1" value="sure">sure</label><label><input type="radio" name="c1" value="unsure">unsure</label></fieldset>
  <button class="btn check">Check</button>
  <p class="fb" aria-live="polite"></p>
  <p class="explain" hidden><strong>5 KiB.</strong> Divide <code>5,120 ÷ 1,024</code>.</p>
</div>
```

End the practice section with `<p class="summary" id="summary" hidden></p>`.

## Diagram

The diagram renders when its step or reveal becomes visible. The `accTitle` and `accDescr` lines are its alt text.

```html
<figure class="diagram">
  <pre class="mermaid">
flowchart LR
  accTitle: Converting between bytes and KiB
  accDescr: Divide by 1,024 to go from bytes to KiB.
  B["bytes"] -- "divide by 1,024" --> K["KiB"]
  </pre>
  <figcaption>Tell the learner what to look at.</figcaption>
</figure>
```

## Review later

```html
<ul class="review-list">
  <li><b>Tomorrow</b> …</li>
  <li><b>Next week</b> …</li>
  <li><b>Reflect</b> …</li>
</ul>
<details><summary>Review answers</summary><p>…</p></details>
```
