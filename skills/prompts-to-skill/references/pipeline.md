# Pipeline detail

## Intent confirmation (before Step 1)

Collect or infer, then confirm with the user:

- What the skill enables Claude to do, in one sentence.
- When it should trigger: the user's own phrasings, plus contexts.
- Expected output format, such as a report template, a file type, or a code block.
- Whether the output is objectively checkable (file transforms, extraction, fixed steps) or subjective (writing style, art). Objective skills get more test cases.
- Any dependencies, such as MCP servers or tools.

Use the conversation first. If the user's prompts already show the output format and steps, extract them and ask the user only for gaps.

## Step 1: Draft with skill-creator

Read `/mnt/skills/examples/skill-creator/SKILL.md`. Follow its Write the SKILL.md and Skill Writing Guide sections:

- Frontmatter has `name` and `description`. The description says what the skill does and lists specific contexts, including phrasings the user did not use.
- The body is imperative, explains why each rule matters, and uses examples where the output format matters.
- SKILL.md stays under about 500 lines. Put detail in `references/` with a pointer that says when to read each file.
- Scripts go in `scripts/` only for deterministic work.

Save to a folder named after the confirmed skill name, with the same `name` in frontmatter and as the H1 heading.

## Step 2: Test cases

Write two outputs.

1. `evals/evals.json` in the skill-creator format: `skill_name` and an `evals` list of prompts. Assertions can come later.
2. A test-case table following tune-skill's `references/test-cases.md`. At least eight cases:
   - 3 clear triggers in the user's own words, without the skill name.
   - 2 implicit triggers that describe the outcome differently.
   - 3 near-misses: the sibling skill's job, an out-of-scope task, and a message sharing keywords with the description.

Mark each case as "written" until it has been run. Only mark it pass or fail after running it.

## Step 3: Tune with tune-skill

Read `/mnt/skills/plugins/tune-skill/SKILL.md` and follow its workflow: collect, map, audit against `references/audit-checklist.md`, edit minimally, validate, write test cases, report.

Run:

    python scripts/check_skill.py <path-to-skill-folder>

The script is in tune-skill's `scripts/` folder. It checks the name against the folder, the description length and trigger wording, the H1, referenced files, and body length. A missing-reference WARN is expected only when reviewing pasted text.

## Step 4: findable (optional)

Only if the user intends to publish. Run `findable` on the repo name and the purpose. Expected output: a keep-or-rename decision with the cost of each, About text, topics, README opening, and a re-check date. If the repo is not live, record the audit as pending.

If the user renames the skill at this step, rename the folder and the `name` field, then re-run `check_skill.py`.
