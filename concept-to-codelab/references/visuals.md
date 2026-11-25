# Teaching visuals

Use this guide with the "Find and use teaching visuals" section of the skill.

## Choose sources

- Prefer original papers, official documentation, and openly licensed repositories. Use secondary sources only when they show the concept more clearly.
- Open each promising result and inspect the actual figure. A search result thumbnail or page title is not enough.
- Public access and permission to reproduce are separate. Check the license or terms before embedding or copying a figure.
- When reuse is unclear, link to the specific figure and create an accurate illustration in the lesson.
- If search is unavailable or no suitable source turns up, create an original visual and report the sourcing limit in the handoff.

## Draw original diagrams

- Use Mermaid for flows, sequences, state machines, class or module structure, and timelines. The template renders it. Wrap each diagram in `<figure class="diagram"><pre class="mermaid">…</pre><figcaption>…</figcaption></figure>`.
- Draw the mechanism, not the name. Show the path that a request or value takes, not one box labeled with the concept.
- Give every arrow a verb, such as `publishes`, `hashes`, or `blocks`.
- Add `accTitle` and `accDescr` lines to each diagram. They are its alt text.
- Keep one idea per diagram and about 12 nodes or fewer, so labels stay legible at phone width. Split a larger diagram.
- Use inline SVG for spatial or geometric ideas that Mermaid cannot draw, such as a kernel that moves across a grid.
- Mermaid loads from a CDN, pinned to an exact version with Subresource Integrity. To upgrade, change the version and the hash in the template together. Without a network connection, the page shows the diagram source instead.

## Present the visual

- Show the visual at the first explanation of the term, not in an appendix.
- Credit and link the source. Add alt text that states what the visual shows.
- Write a short caption that tells the learner what to look at.
- For comparisons, keep the input fixed across panels so the only difference is the thing being compared.
- When a result comes from a part moving across the input, show the input, highlight one part and the output it produces, then show how moving that part builds the full result.
- Show visual outputs, such as masks, boxes, rendered UI, or terminal output, in their actual form.
- A computation table can help with arithmetic. Reformatting a table does not complete a visual review when the learner still cannot see the concept.

## Check the rendered lesson

- Open the lesson in a browser or preview.
- Confirm that every new image loads.
- Confirm that every Mermaid diagram renders as a diagram, not as source text or a syntax error. Check it in its own step and in Read all mode.
- Confirm that each source link reaches the cited figure, not only the page.
- Check that labels are legible at phone width (about 375 px).
- Check the print layout of the quick reference when the environment supports it.

## Report in the handoff

Name each figure or diagram added, where it appears, and what it helps the learner see. List any figure that you linked instead of embedding, and why.
