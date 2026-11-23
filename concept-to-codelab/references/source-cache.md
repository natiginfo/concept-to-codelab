# Source cache

Convert each PDF, slide deck, or document to Markdown once. Reuse the extract in later sessions and other projects while the file content stays the same.

## Location

Use one cache per user, outside any repository:

```
${XDG_CACHE_HOME:-$HOME/.cache}/concept-to-codelab/sources/<sha256>/
  extract.md        faithful page-referenced text
  notes.md          optional page-referenced notes and summaries
  figures/          figures extracted on demand, such as p12-fig1.png
```

`<sha256>` is the full SHA-256 hash of the source file. Compute it with `shasum -a 256 <file>` on macOS or `sha256sum <file>` on Linux.

If the environment cannot write outside the workspace, use `.codelab/sources/<sha256>/` in the project instead. Ask before adding `.codelab/` to `.gitignore`. Report the fallback in the handoff.

## Before reading a source

1. Compute the hash of the source file.
2. If `sources/<sha256>/extract.md` exists, read it instead of the original. Read only the pages the lesson needs.
3. If it does not exist, create the extract, then continue from it.
4. Open the original only to check a figure, a layout-dependent table, or a claim the extract leaves unclear.

A changed file has a new hash, so it gets a new entry. Never edit an extract to match a changed source.

## Extract format

Start `extract.md` with a header:

```markdown
---
source_name: lecture-05.pdf
source_paths_seen:
  - /path/where/the/file/was/found.pdf
sha256: <full hash>
pages: 42
extracted_with: pdftotext -layout
extracted_at: 2026-11-23
text_layer: yes
---
```

Then add one section per page or slide:

```markdown
## Page 12

<text of page 12, as extracted>

**Figures** · Fig. 3: "Pooling reduces a 4 × 4 map to 2 × 2" (bottom half)
```

- Keep the text faithful. Do not summarize, reorder, or correct it in `extract.md`.
- Put summaries, interpretations, and cross-page notes in `notes.md`, each with a page reference.
- Convert tables to Markdown tables when the structure survives. Otherwise keep the layout text and note "see original" with the page number.
- For slides, use `## Slide N` and include speaker notes under a `**Notes**` line.
- When you reuse the cache from a new location, add that path to `source_paths_seen`.

## Tools

Use whatever the environment provides. Examples:

- PDF: `pdftotext -layout <file> -` (pages are separated by form feeds), a native PDF reader, or a PDF library.
- Slides and documents: `pandoc`, a format-specific library, or export to PDF first.
- Figures: extract or screenshot a figure only when the lesson uses it. Save it as `figures/p<page>-fig<n>.png`.

When delegation is available, extraction is a good bounded task for a smaller model. Check a sample of pages against the original before you rely on the extract.

## Scanned files

If a page has no text layer, set `text_layer: partial` or `no`. Use OCR when a tool is available, and mark OCR pages with `(OCR)` after the page heading. Otherwise, report which pages could not be read.

## Privacy and cleanup

- The cache can hold private or copyrighted material. Keep it local. Never commit it, upload it, or quote it in a search query.
- Never delete cache entries on your own. The user can remove the cache directory at any time.
- Cite sources in the lesson by file name and page, such as "lecture-05.pdf, p. 12". Never cite the cache path.
