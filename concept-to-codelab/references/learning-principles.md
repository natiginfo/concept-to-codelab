# Learning principles

These principles come from research on durable learning, summarized in *Make It Stick: The Science of Successful Learning* by Peter C. Brown, Henry L. Roediger III, and Mark A. McDaniel (Harvard University Press, 2014). The guidance below paraphrases the book and applies it to codelabs.

The core idea: learners remember what they work to retrieve, not what they reread. Effort that the learner can overcome makes learning last. Fluent rereading feels like mastery but fades fast.

## Generate before you explain

**What.** Ask the learner to attempt an answer before the lesson shows it.

**Why.** An attempt, even a wrong one, primes the learner to notice the explanation that follows and to remember it.

**Apply.** Open each teaching step with one or two setup sentences that give the learner enough to reason, then one short prediction. Label it "a guess is fine" and allow one try. A reasoned guess helps more than a blind one. Then explain the right answer and why a likely wrong answer fails.

**Example.** "Before reading on: how many KiB is 3,072 bytes?" Offer choices such as 3, 3.072, and 3,145,728, and record the pick before the explanation. Then work through the division.

**Avoid.** Long problems before any teaching. The attempt should take under a minute.

## Retrieval practice

**What.** Recall from memory, without looking, then check.

**Why.** Each successful recall strengthens the memory and shows what the learner does not know yet. Rereading does neither.

**Apply.**
- From the second teaching step on, start with one recall question about the previous step.
- In practice, ask for an answer from memory first. Use the quick reference only to check.
- Prefer recall over recognition: ask for a number, an order, or a term the learner must produce. Use multiple choice when the distractors teach a misconception.
- The page must be able to check every answer. Use choices, exact numbers, or orderings. Do not add free-text boxes.

**Avoid.** Telling learners to keep the quick reference open while they practice.

## Elaboration

**What.** Explain the idea in your own words and connect it to what you already know.

**Why.** Connections give the memory more cues to retrieve it later.

**Apply.** Before the learner reads the provided **Worth writing down** note, ask them to write the rule in their own words on paper. Then let them reveal the note and compare. A fill-in-the-blank choice, such as "Divide bytes by ___", can check the key part of the rule. In feedback, connect the rule to an idea the learner already knows.

## Interleaving

**What.** Mix problem types in one practice set instead of doing all of one type in a block.

**Why.** Blocked practice lets the learner reuse the last method without thinking. Mixed practice forces the learner to choose which rule applies, which is the skill they need later.

**Apply.** Order practice items so that consecutive items need different rules. Do not follow the order of the teaching steps.

**Avoid.** Section-by-section practice where each item repeats the previous method.

## Spacing

**What.** Return to the material after time has passed and some forgetting has started.

**Why.** Recall that takes effort after a gap makes learning last longer than repeated practice in one sitting.

**Apply.** End the lesson with two or three new review questions that the learner answers later, for example the next day and the next week. Use new numbers or cases so the learner cannot answer from memory of the earlier item. In a course, start later lessons with a short recall question from earlier ones.

## Calibration

**What.** Compare what you think you know with what you actually know.

**Why.** Fluency creates illusions of knowing. A learner who commits to an answer and then checks it finds out where their confidence is wrong.

**Apply.** Ask the learner to commit to an answer, and optionally a confidence level (sure or unsure), before showing the answer. In feedback, name the misconception behind each likely wrong answer.

## Reflection

**What.** Look back on what happened and plan what to do differently.

**Why.** Reflection combines retrieval and elaboration.

**Apply.** End with one reflection prompt for the learner to answer on paper, for example: "Which item tripped you up, and what will you check first next time?" Do not add a text box for it.

## Desirable difficulty

**What.** Difficulty helps only when the learner can overcome it with effort.

**Apply.** Teach the prerequisites the step needs. Keep generate-first attempts short. Give feedback after every committed answer. On recall and practice, give a hint after the first wrong answer and one more try before revealing the answer, so the learner retrieves rather than reads. If learners lack the background to attempt a step, teach first and ask afterward.

## Avoid

- **Learning styles.** Do not tailor content to a learner's preferred style, such as visual or auditory. The evidence does not support it. Match the presentation to the content instead: show shapes, read code, run commands.
- **Rereading and highlighting as review.** Replace them with recall questions.
- **Massed repetition.** Ten identical problems in a row feel productive but transfer poorly.
