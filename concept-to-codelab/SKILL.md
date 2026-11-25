---
name: concept-to-codelab
description: Create or adapt a self-paced interactive HTML codelab, guided lab, or step-by-step technical lesson from a concept, lecture notes, course materials, or an existing lesson. Use when learners need to remember a concept, not only understand it: a worked example, a quick reference, and practice that the page checks.
license: MIT
---

# Concept to Codelab

## Plan the lesson

- Read the available source material and project instructions. Reuse relevant notes with page or section references and consult the original where a claim or requirement needs checking. Identify what the learner should be able to explain, calculate, decide, or do by the end.
- Convert each PDF, slide deck, or document to a page-referenced Markdown extract once, and reuse it in later sessions and projects. Check the user's source cache before reading the original. Follow [references/source-cache.md](references/source-cache.md) for the location, format, and privacy rules.
- Teach the prerequisites needed to meet that outcome. Explain each new idea in plain language, name it, and show why it matters. Work through one concrete example with intermediate steps before asking learners to apply the idea to a fresh case.
- Set the learner level. When the request, project, or source material does not show it, ask once with the agent's structured question tool, or as a plain question when no such tool is available. Offer three levels:
  - **New:** knows the prerequisites but not the topic. Define every term, show more intermediate steps, and give more feedback.
  - **Familiar:** has used the topic and wants to go deeper. Recap briefly, then focus on the new idea and contrast it with what the learner already knows.
  - **Expert:** wants a refresher or edge cases. Skip the basics, cover trade-offs and failure cases, and make practice harder and more mixed.

  If no one can answer, assume New.
- Match the requested duration. When the request leaves it open, assume a roughly 20-minute route. Ask about anything else only when the source material leaves the learning outcome unclear, and put all questions in one round. If a shorter route would help, name the steps that still cover the objective and include a practice check. Reuse existing lesson structure and publishing tools where practical.
- When the project has no lesson structure, use this order: a header with time, goal, and prerequisites; the quick reference; one section per teaching step, titled by the task it teaches; practice; answers and feedback; review later.
- Deliver every lesson as one interactive HTML page. Markdown is not an output format: adapt a Markdown lesson to HTML. In a project without its own lesson styling or navigation, start from [assets/lesson-template.html](assets/lesson-template.html). Replace the sample lesson, keep its checked-answer patterns, and give each lesson its own storage key.

## Write for learners

Follow the project's style guide when it has one. Otherwise:

- Use one term for each concept throughout the lesson, including the quick reference and feedback. Do not switch between synonyms or abbreviations.
- Define each term and acronym at first use.
- Address the learner as "you". Use the present tense and active voice. Keep most sentences under 20 words.
- Give one action per numbered step, then state the result the learner should see.
- Do not call a step simple, easy, or obvious, and do not write "just" or "simply". A learner who is stuck reads these words as blame.

## Make it stick

Learners remember what they work to retrieve, not what they reread. Build effortful recall into every lesson. Read [references/learning-principles.md](references/learning-principles.md) for the reasoning, examples, and mistakes to avoid.

- **Generate first.** Open each teaching step with a short prediction or attempt before the explanation. Then explain why the right answer works and why a likely wrong one fails.
- **Retrieve before review.** From the second teaching step on, start with one recall question about the previous step. The learner answers from memory, then checks.
- **Interleave practice.** Mix problem types and do not follow the step order, so the learner must choose which rule applies.
- **Calibrate.** Ask the learner to commit to an answer before showing it. Feedback names the misconception behind each likely wrong answer.
- **Space and reflect.** End with two or three new review questions to answer later, such as the next day and the next week, and one reflection prompt for the learner to answer on paper.
- Do not tailor content to learning styles. Match the presentation to the content.

## Find and use teaching visuals

Read [references/visuals.md](references/visuals.md) for source preferences, presentation patterns, and the rendered-lesson checklist.

1. During a visual review, read every step and identify where seeing a shape, process, comparison, or output would help. For each distinct concept that needs a visual and lacks an adequate one, use web or image search to find a publicly accessible photo, figure, or demonstration before choosing how to present it. This applies to existing lessons as well as new ones. Reuse an already verified figure that teaches the same point or follow an explicit offline-only constraint. For concepts specific to a private codebase or product, create an original diagram instead of searching. Draw flows, sequences, states, and structures in Mermaid, as [references/visuals.md](references/visuals.md) describes. Never put private names, code, or unreleased details in a search query.
2. Inspect the actual figure before using it. Public access and permission to reproduce a figure are separate. Check allowed use before embedding or copying. When reuse is unclear, link to the specific figure and create an accurate illustration in the lesson.
3. Show the visual at the first explanation of the term. Credit and link the source, add alt text, and give a short caption that tells the learner what to look at.
4. Check the rendered lesson in a browser or preview at phone width (about 375 px). Reformatting a table does not complete a visual review when the learner still cannot see the concept. In the handoff, name the figures or diagrams added, where they appear, and what each helps the learner see.

## Make it useful for review

- End each teaching step with a **Worth writing down** note. Ask the learner to write the rule on paper in their own words first, then reveal the provided note to compare. In one to three lines, the note captures a rule, distinction, or formula and what it helps the learner do. Keep activity directions next to the activity.
- Put a compact **Quick reference** where learners can find it at the start and return to it after practice to check their answers. Maintain one copy and link to it from the other location if needed. Group entries by task and include the rule, a short reason, and a link or pointer to the teaching step. Add a tiny example where it clarifies the rule.
- Make steps directly reachable and preserve the project's navigation and progress behavior. For new navigation, include Back, Next, and a way to read the whole lesson when useful. Make the quick reference printable and check the print layout when possible.

## Design the practice

- Make every answer checkable by the page: a choice, a number, or an order with one correct answer. Do not add free-text answer boxes. Put open-ended prompts, such as own-words notes and reflection, on paper, with a model answer to reveal.
- Ask learners to apply the same reasoning to a new example and to answer from memory before any lookup. Give an answer and feedback that explains how to reach it. For multiple choice, use plausible mistakes as distractors and explain the misconception each represents. If an ordering exercise uses drag and drop, provide a keyboard and touch alternative.
- For a local coding exercise, give prerequisites, setup commands, a task, test inputs, expected outputs, and hints. Leave the implementation to the learner unless they ask for a solution. Verify expected results by running the exercise or checking the reasoning independently. State which checks were run.
- If adapting an assignment, link each task or reflection to the step that teaches the relevant reasoning. Use the assignment itself as the authority when available. Label optional practice and indicate when a requirement comes from secondary notes or when the original could not be checked.

## Deliver and verify

When delegation is authorized and model choice is available, a smaller, faster model is suitable for bounded tasks such as inventorying files and extracting slide text to page-referenced Markdown. Keep decisions about what to teach, checking calculations, interpreting requirements, and final validation with the main model.

In a repository, edit the maintained source and regenerate any required outputs using the project's workflow. Check worked results, practice answers and feedback, and links. For an adaptation, check representative steps, navigation, and existing saved progress where possible. Report any checks you could not run.
