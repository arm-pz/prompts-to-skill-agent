# prompts-to-skill-agent

An agent that turns a set of prompts into a tested, packaged, installable skill.

It bundles two skills (`prompts-to-skill` and `prompts-to-skill-release`) with a subagent definition, because the agent depends on both. Each skill can also be published on its own.

## Repo layout

    prompts-to-skill-agent/
    ├── README.md
    ├── CHANGELOG.md
    ├── agents/
    │   └── prompts-to-skill-agent.md     # subagent definition
    ├── skills/
    │   ├── prompts-to-skill/             # drafting and tuning workflow
    │   └── prompts-to-skill-release/     # testing, packaging, install
    ├── scripts/
    │   ├── install.sh                    # copy into ~/.claude or a project
    │   └── package.sh                    # build zips into dist/
    └── examples/
        └── sample-prompts.md

## Install

    git clone https://github.com/arm-pz/prompts-to-skill-agent
    cd prompts-to-skill-agent
    scripts/install.sh                      # user-wide
    scripts/install.sh --project ~/my-repo  # one project only

Then open `/agents` in Claude Code and confirm `prompts-to-skill-agent` is listed.

## Use

Give the agent a list of prompts, for example from `examples/sample-prompts.md`, and say "make a skill from these". It will confirm the intent, draft, write tests, tune, and package.

## Package

    scripts/package.sh

This writes one zip per skill into `dist/`.

## Requirements

- Claude Code with subagent support.
- `zip` on the command line for packaging.
- `findable` (optional) for the GitHub listing step: `npx skills add arm-pz/findable --skill findable`.

## Status

Version 0.1.0. Not yet tested end to end in a live session. See CHANGELOG.md.
