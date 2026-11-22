---
name: concept-to-codelab
description: Turn course material, technical concepts, or existing lessons into self-paced Codelabs-style lessons with sourced teaching visuals, worked examples, useful paper notes, a quick reference, and practice. Use for building or adapting a structured learning experience.
---

# Concept to Codelab

## Plan the lesson

- Read the user's source material and any existing lesson or project instructions first. Identify what the learner needs to explain, calculate, decide, or do by the end. Match the technical depth to that outcome.
- Make the lesson usable by someone who missed earlier lessons. Teach only the prerequisites needed here. Start with a plain explanation, then name the term and explain why it matters. Work through one concrete example with intermediate steps before asking the learner to apply it to a different example.
- For a short course unit, offer a roughly 20-minute route and a shorter route for a busy day. Use freely accessible steps with clear titles. In an interactive lesson, provide direct links, Back and Next, and Read all. Reuse the project's existing layout and generators when practical.

## Find and use teaching visuals

1. During a visual review, read every step and identify where seeing a shape, process, comparison, or output would help. For each distinct concept that needs a visual and lacks an adequate one, use web or image search to find a publicly accessible photo, figure, or demonstration before choosing how to present it. This applies to existing lessons as well as new ones. Reuse an already verified figure that teaches the same point or follow an explicit offline-only constraint.
2. Open promising results and inspect the actual figure. Prefer original papers, official documentation, and openly licensed repositories. Public access and permission to reproduce a figure are separate. Check allowed use before embedding or copying. When reuse is unclear, link to the specific figure and create an accurate illustration in the lesson. If search is unavailable or no suitable source turns up, create an original visual and report the sourcing limit.
3. Show the visual at the first explanation of the term. Credit and link the source, add alt text, and give a short caption that tells the learner what to look at. For comparisons, keep the input fixed across panels. For a feature map, show the input, highlight a patch and its matching map cell, then show how moving the patch forms the map. Show visual outputs such as masks and boxes in their actual form.
4. Check the rendered lesson. Confirm that new images load, links reach the cited figures, and labels are legible on narrow screens. A computation table can help with arithmetic. Reformatting a table does not complete a visual review when the learner still cannot see the concept. In the handoff, name the figures or diagrams added, where they appear, and what each helps the learner see.

## Make it useful for review

Add a short **Worth writing down** box to each teaching step. Use one to three lines that still make sense on paper later. Include a rule, distinction, or formula and what it helps the learner calculate, decide, or interpret. Keep activity directions beside the activity.

Example: “One filter position gives one output. Count where the whole filter fits to find the output size. A 2 × 2 filter moving one cell at a time on a 4 × 4 image fits in three starting rows and three starting columns, so the result is 3 × 3.”

Add a compact **Quick reference** near the top of the lesson and just before the practice quiz in the reading order. Group entries by what the learner needs to do. For each entry, include the rule, a short reason, a tiny example where helpful, and a direct link to its teaching step. For web output, make the reference printable and check the print layout when the environment supports it.

## Design the practice

- Use choices and explanatory feedback. Use reorderable cards when the order matters and support touch and keyboard input. For every check, include the idea, a separate worked example, the correct answer, and feedback that explains the reasoning. Preserve existing saved quiz progress when adapting an application.
- If the learner wants to write code locally, provide dependencies, setup commands, the task, test inputs, and expected outputs. Offer hints and a small challenge. Leave the implementation to the learner unless they request a solution. Verify expected outputs independently and distinguish file or runtime checks from calculations checked by hand.
- When there is an assignment guide, link each task or reflection directly to the lesson step that teaches its reasoning. Say what to look for there. Distinguish official requirements from optional practice. Use the assignment itself as evidence where accessible, and label saved instructions as such.

## Work from evidence and deliver

Reuse page-referenced notes before rereading source PDFs. When delegation is authorized and model choice is available, GPT-6 Luna is suitable for bounded tasks such as inventorying files and extracting slide text to page-referenced Markdown. Keep decisions about what to teach, checking calculations, interpreting requirements, and final validation with the main model.

Deliver in the format the user asked for. In a repository, edit the maintained sources and regenerate outputs. Check links, worked results, quiz feedback, and representative pages. Report any limits on verification. Follow the project's publishing workflow when publication is in scope.
