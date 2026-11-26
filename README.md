# Concept to Codelab

Turn lecture notes, workshop material, or a technical concept into a self-paced codelab. Give learners a worked example, a quick reference, short notes worth writing down, and a fresh exercise with explanatory feedback. Lessons build in retrieval practice, interleaving, and spaced review, based on research summarized in *Make It Stick*.

[See a sample lesson](https://natigbabayev.com/concept-to-codelab/examples/bytes-and-kib.html) · [See the HTML template](concept-to-codelab/assets/lesson-template.html) · [Read the skill](concept-to-codelab/SKILL.md)

## Install

### Skills CLI

With Node.js 22.20 or later, run this from your project directory. The [Skills CLI](https://github.com/vercel-labs/skills) prompts you to choose the agents to install to.

```sh
npx skills add natiginfo/concept-to-codelab --skill concept-to-codelab
```

### Claude Code marketplace

Add this repository as a marketplace and install the plugin from your terminal. [Claude Code marketplace docs](https://code.claude.com/docs/en/plugins/publish)

```sh
claude plugin marketplace add natiginfo/concept-to-codelab
claude plugin install concept-to-codelab@natiginfo-codelabs
```

Start a Claude Code session and use `/concept-to-codelab:concept-to-codelab` followed by your lesson request.

<details>
<summary>Manual installation in Codex</summary>

Clone or download this repository. From the root of that checkout, set `target_repo` to the path of the project where you want the skill. If the destination already has a copy, compare it before updating.

```sh
target_repo='/path/to/your/project'
destination="$target_repo/.agents/skills/concept-to-codelab"
if mkdir -p "$(dirname "$destination")" && mkdir "$destination"; then
  cp -R concept-to-codelab/SKILL.md concept-to-codelab/LICENSE concept-to-codelab/references concept-to-codelab/assets concept-to-codelab/scripts "$destination/"
fi
```

For personal use across projects, copy the skill folder into `~/.agents/skills/`. [Codex skill documentation](https://learn.chatgpt.com/docs/build-skills)

</details>

The skill needs no connectors or specific model. Each lesson is one HTML page that opens in any browser. When Chrome is installed, `scripts/render-check.sh` checks the lesson at phone width. Diagrams load Mermaid from jsDelivr, pinned to an exact version with Subresource Integrity. [Agent Skills specification](https://agentskills.io/specification)

## Try it

In Codex, select `$concept-to-codelab` from your prompt.

> Use $concept-to-codelab to write a 10-minute lesson for beginners on converting between bytes and KiB. Assume learners can divide whole numbers. Teach that 1 KiB equals 1,024 bytes, work through converting 3,072 bytes to KiB, and give a fresh practice problem with feedback.

When adapting course materials, include the relevant pages, your audience, and what learners should be able to do by the end. The skill converts each PDF, slide deck, or document to page-referenced Markdown once and caches it in `~/.cache/concept-to-codelab/sources/`, keyed by file hash, so later lessons reuse the extract instead of rereading the file. The cache stays on your machine; delete the folder at any time. You can use the same skill to turn an existing Markdown lesson into an interactive lab or draft a coding exercise with setup steps, test inputs, and expected outputs.

## Check a change

In a fresh session with the skill installed, try these prompts without naming the skill. Check which skill was selected and inspect the resulting lesson. Use the prompt above to test explicit invocation separately.

| Prompt | What to check |
| --- | --- |
| Create a 10-minute codelab on converting bytes to KiB using 1 KiB = 1,024 bytes. | The skill applies. The page starts from the lesson template, shows one step at a time with Back and Next, and checks every answer without free-text boxes. The conversion and feedback are correct, and the practice uses fresh numbers. Practice asks for answers from memory before lookup, mixes conversion directions, and ends with review questions for later. |
| Write a guided local Python lab where beginners implement a Celsius-to-Fahrenheit converter. Include sample inputs and expected outputs. | The skill applies. The instructions are runnable, expected outputs are correct, and the learner writes the implementation. |
| Create a codelab on how HTTP caching with ETags works. | The skill applies. A Mermaid diagram shows the request path with a verb on every arrow. The diagram renders in its own step and in Read all mode. |
| Create a codelab on cancelling Kotlin coroutines. | The skill asks for the learner level once, with New, Familiar, and Expert options, then matches the depth to the answer. |
| Convert 3,072 bytes to KiB and give me one sentence. | The prompt calls for a direct answer and no skill activation. |

For a bug or improvement, include the prompt you tried, what you expected, and a sample output you can share publicly.

## License

Released under the [MIT License](LICENSE).
