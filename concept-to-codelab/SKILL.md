---
name: concept-to-codelab
description: Create or adapt a self-paced codelab, guided lab, or step-by-step technical lesson from a concept, lecture notes, course materials, or an existing lesson. Use when learners need a worked example, a quick reference, and practice with feedback.
license: MIT
---

# Concept to Codelab

## Plan the lesson

- Read the available source material and project instructions. Reuse relevant notes with page or section references and consult the original where a claim or requirement needs checking. Identify what the learner should be able to explain, calculate, decide, or do by the end.
- Teach the prerequisites needed to meet that outcome. Explain each new idea in plain language, name it, and show why it matters. Work through one concrete example with intermediate steps before asking learners to apply the idea to a fresh case.
- Match the requested audience, duration, and format. When the request leaves them open, assume learners who are new to the topic but know its prerequisites, a roughly 20-minute route, and Markdown. Ask only when the source material leaves the learning outcome unclear. If a shorter route would help, name the steps that still cover the objective and include a practice check. Reuse existing lesson structure and publishing tools where practical.
- When the project has no lesson structure, use this order: a header with time, goal, and prerequisites; the quick reference; one section per teaching step, titled by the task it teaches; practice; answers and feedback.

## Find and use teaching visuals

1. During a visual review, read every step and identify where seeing a shape, process, comparison, or output would help. For each distinct concept that needs a visual and lacks an adequate one, use web or image search to find a publicly accessible photo, figure, or demonstration before choosing how to present it. This applies to existing lessons as well as new ones. Reuse an already verified figure that teaches the same point or follow an explicit offline-only constraint. For concepts specific to a private codebase or product, create an original diagram instead of searching. Never put private names, code, or unreleased details in a search query.
2. Open promising results and inspect the actual figure. Prefer original papers, official documentation, and openly licensed repositories. Public access and permission to reproduce a figure are separate. Check allowed use before embedding or copying. When reuse is unclear, link to the specific figure and create an accurate illustration in the lesson. If search is unavailable or no suitable source turns up, create an original visual and report the sourcing limit.
3. Show the visual at the first explanation of the term. Credit and link the source, add alt text, and give a short caption that tells the learner what to look at. For comparisons, keep the input fixed across panels. When a result comes from a part moving across the input, show the input, highlight one part and the output it produces, then show how moving that part builds the full result. Show visual outputs, such as masks, boxes, rendered UI, or terminal output, in their actual form.
4. Check the rendered lesson in a browser or preview. Confirm that new images load, links reach the cited figures, and labels are legible at phone width (about 375 px). A computation table can help with arithmetic. Reformatting a table does not complete a visual review when the learner still cannot see the concept. In the handoff, name the figures or diagrams added, where they appear, and what each helps the learner see.

## Make it useful for review

- End each teaching step with a **Worth writing down** note. In one to three lines, capture a rule, distinction, or formula and what it helps the learner do. Keep activity directions next to the activity.
- Put a compact **Quick reference** where learners can find it at the start and return to it before practice. Maintain one copy and link to it from the other location if needed. Group entries by task and include the rule, a short reason, and a link or pointer to the teaching step. Add a tiny example where it clarifies the rule.
- In interactive lessons, make steps directly reachable and preserve the project's navigation and progress behavior. For new navigation, include Back, Next, and a way to read the whole lesson when useful. Make the quick reference printable when the web format supports it and check the print layout when possible.

## Design the practice

- Ask learners to apply the same reasoning to a new example. Give an answer and feedback that explains how to reach it. For multiple choice, use plausible mistakes as distractors and explain the misconception each represents. If an interactive ordering exercise uses drag and drop, provide a keyboard and touch alternative.
- For a local coding exercise, give prerequisites, setup commands, a task, test inputs, expected outputs, and hints. Leave the implementation to the learner unless they ask for a solution. Verify expected results by running the exercise or checking the reasoning independently. State which checks were run.
- If adapting an assignment, link each task or reflection to the step that teaches the relevant reasoning. Use the assignment itself as the authority when available. Label optional practice and indicate when a requirement comes from secondary notes or when the original could not be checked.

## Deliver and verify

When delegation is authorized and model choice is available, a smaller, faster model is suitable for bounded tasks such as inventorying files and extracting slide text to page-referenced Markdown. Keep decisions about what to teach, checking calculations, interpreting requirements, and final validation with the main model.

Use the requested format. In a repository, edit the maintained source and regenerate any required outputs using the project's workflow. Check worked results, practice answers and feedback, and links. For an interactive adaptation, check representative steps, navigation, and existing saved progress where possible. Report any checks you could not run.
