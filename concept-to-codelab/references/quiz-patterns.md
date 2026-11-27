# Lesson markup patterns

Use these snippets to fill a copy of `assets/lesson-template.html`. Read the template itself only to change its styling or script.

## Fill a copy of the template

1. Copy `assets/lesson-template.html` to the lesson path with a shell command.
2. Replace the text between `<!-- LESSON-NAV:START -->` and `<!-- LESSON-NAV:END -->` with one step link per section.
3. Replace the text between `<!-- LESSON-BODY:START -->` and `<!-- LESSON-BODY:END -->` with the step sections.
4. Replace the sample title `Convert between bytes and KiB`. It appears in `<title>` and in `.tb-title`.
5. Set `var KEY = "codelab:<lesson-slug>"` on the line marked `STORAGE_KEY`, so saved progress is per lesson.

Keep the skill repository link directly below Quick reference in the lesson navigation. This navigation footer is outside the lesson replacement markers, so copying and filling the template preserves it automatically. On phones, both links appear in the Steps menu.

The page computes the time left from each section's `data-min`. The Back and Next buttons, the step list, Read all and saved progress need no edits.

Finish lesson shows a saved completion message and links back to the final review step and the practice section when present. It also works at the end of Read all. Finishing records the learner's choice to finish, not a passing score, and does not clear answers or prevent revisiting steps. Keep the completion section outside the lesson replacement markers.

The visual template uses a 640px reading column, 16px body text, 23–24px headings, forest-green selection and charcoal task buttons. Phone navigation moves the lesson outline, theme and Read all controls into Steps. Progress shows the current step, not mastery. Keep one dominant task action and use spacing and dividers instead of nested callout cards. Place a concept's diagram beside its first explanation; the sample's grouping diagram shows equal groups before the prediction. Mermaid diagrams use page colors in both themes.

## Rules the script relies on

- Each step is `<section class="step" id="step-N" data-min="M">`, with a matching `<a href="#step-N" data-step="N">` link.
- Each radio group needs a `name` that is unique in the page.
- `data-answer` on the `.quiz` element holds the correct radio `value`, or the number for `data-kind="num"`.
- `data-fb` on each radio is the feedback for that choice. Name the misconception behind each wrong choice.
- `data-review="#step-N"` on each quiz points to the step that teaches its reasoning. Wrong-answer feedback includes a named review link, both while a retry remains and after the last attempt. Multiple targets are space-separated, such as `data-review="#step-2 #step-3"`. Put `data-review` on an individual radio to override the target for that distractor. Without a target, the script links to the quiz's own step for compatibility; explicitly map practice and recall items to their teaching steps.
- Following a review link preserves the exercise's answers, hints and remaining tries, and exposes a worked explanation hidden behind the target step's prediction if needed. This does not mark the prediction answered.
- `data-reveal="id"` shows the element with that id after the learner checks.
- A `.quiz.practice` element counts toward the practice summary in `#summary`, which reports first-try answers.
- `<ol class="hints">` holds 2 or 3 `<li hidden>` hints, from a pointer to the idea to the setup of the last step. Never put the answer in a hint. The script adds a "Hint 1 of N" button, opens the next hint after a wrong answer, and counts answers right without hints in the summary.
- `data-hint` on the `.quiz` element is a one-hint shortcut, used for recall questions.
- `data-tries` sets the number of tries (default 2). A `.predict` quiz always gets 1 try and no hints.
- `data-kind` is `num`, `order` or `slots`. Leave it out for a choice.

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

## Predict choice that reveals the explanation

Put one or two setup sentences before it. For a recall question about the previous step, use the tag `Recall`, drop `predict` and `data-reveal`, and add `data-hint`.

```html
<div class="callout try predict quiz" data-review="#step-2" data-answer="b" data-reveal="s2-work">
  <p class="tag">Predict · a guess is fine</p>
  <p class="q">How many KiB is 3,072 bytes?</p>
  <fieldset class="choices"><legend class="sr">Choose one</legend>
    <label><input type="radio" name="q-s2" value="a" data-fb="3.072 divides by 1,000. A KiB is 1,024 bytes, not 1,000.">3.072 KiB</label>
    <label><input type="radio" name="q-s2" value="b" data-fb="Right. 3,072 bytes hold exactly three groups of 1,024.">3 KiB</label>
    <label><input type="radio" name="q-s2" value="c" data-fb="3,145,728 multiplies by 1,024. Going from bytes to KiB makes the number smaller.">3,145,728 KiB</label>
  </fieldset>
  <button class="btn check">Lock in my guess</button>
  <p class="fb" aria-live="polite"></p>
</div>
<div id="s2-work" class="stack" hidden>
  <ol class="work"><li>…</li></ol>
</div>
```

## Worth writing down

```html
<div class="callout note quiz" data-review="#step-2" data-answer="b" data-reveal="s2-note">
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
<div class="quiz practice" data-review="#step-2" data-kind="num" data-answer="5">
  <p class="q">1. How many KiB are in 5,120 bytes?</p>
  <ol class="hints">
    <li hidden>KiB counts in powers of two, not tens.</li>
    <li hidden>One KiB is 1,024 bytes, so divide.</li>
    <li hidden>5,120 ÷ 1,024 = ?</li>
  </ol>
  <div class="num-row"><label class="sr" for="p1">Answer</label><input type="text" id="p1" inputmode="numeric" autocomplete="off"><span class="unit">KiB</span></div>
  <fieldset class="conf"><legend>I am</legend><label><input type="radio" name="c1" value="sure">sure</label><label><input type="radio" name="c1" value="unsure">unsure</label></fieldset>
  <button class="btn check">Check</button>
  <p class="fb" aria-live="polite"></p>
  <p class="explain" hidden><strong>5 KiB.</strong> Divide <code>5,120 ÷ 1,024</code> to count the groups. Check by multiplying <code>5 × 1,024</code>.</p>
</div>
```

## Drag into slots

Each slot holds one chip. Learners drag a chip, or tap a chip then a slot. Add one or two distractor chips.

```html
<div class="quiz practice" data-review="#step-2" data-kind="slots">
  <p class="q">4. Drag a chip into each slot to convert 3,072 bytes to KiB.</p>
  <ol class="hints">
    <li hidden>Bytes to KiB makes the number smaller, so pick the operation that shrinks it.</li>
    <li hidden>Divide by 1,024, not 1,000.</li>
  </ol>
  <p class="slot-line"><code>3,072</code><span class="slot" role="button" tabindex="0" aria-label="Operation slot" data-answer="div"></span><code>1,024</code> =<span class="slot" role="button" tabindex="0" aria-label="Result slot" data-answer="3"></span>KiB</p>
  <div class="bank" aria-label="Chips. Pick a chip, then pick a slot.">
    <button type="button" class="chip" data-id="mul">×</button>
    <button type="button" class="chip" data-id="3">3</button>
    <button type="button" class="chip" data-id="div">÷</button>
    <button type="button" class="chip" data-id="3.072">3.072</button>
  </div>
  <fieldset class="conf"><legend>I am</legend><label><input type="radio" name="c4" value="sure">sure</label><label><input type="radio" name="c4" value="unsure">unsure</label></fieldset>
  <button class="btn check">Check</button>
  <p class="fb" aria-live="polite"></p>
  <p class="explain" hidden><strong>3,072 ÷ 1,024 = 3 KiB.</strong> 3.072 comes from dividing by 1,000, which gives kB.</p>
</div>
```

## Drag into order

`data-answer` lists the `data-id` values in the correct order. Start in a shuffled order. Learners drag, or use the arrow keys.

```html
<div class="quiz practice" data-review="#step-2 #step-3" data-kind="order" data-answer="kb,kib,1000kib,mib">
  <p class="q">5. Drag the sizes into order, smallest first. With a keyboard, focus a size and use the arrow keys.</p>
  <ol class="hints">
    <li hidden>Turn each size into bytes, then compare.</li>
    <li hidden>1 kB is 1,000 bytes. 1 KiB is 1,024 bytes.</li>
    <li hidden>1 MiB is 1,024 KiB.</li>
  </ol>
  <ol class="order">
    <li class="chip" tabindex="0" data-id="1000kib">1,000 KiB</li>
    <li class="chip" tabindex="0" data-id="kb">1 kB (1,000 bytes)</li>
    <li class="chip" tabindex="0" data-id="mib">1 MiB</li>
    <li class="chip" tabindex="0" data-id="kib">1 KiB</li>
  </ol>
  <fieldset class="conf"><legend>I am</legend><label><input type="radio" name="c5" value="sure">sure</label><label><input type="radio" name="c5" value="unsure">unsure</label></fieldset>
  <button class="btn check">Check</button>
  <p class="fb" aria-live="polite"></p>
  <p class="explain" hidden><strong>1 kB, 1 KiB, 1,000 KiB, 1 MiB.</strong> In bytes: 1,000, 1,024, 1,024,000 and 1,048,576. 1 MiB is 1,024 KiB, so it beats 1,000 KiB.</p>
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
