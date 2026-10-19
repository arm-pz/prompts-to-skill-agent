#!/usr/bin/env bash
# Copy the agent and skills into Claude Code user directories.
# Usage: scripts/install.sh [--project /path/to/project]
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$HOME/.claude"
if [[ "${1:-}" == "--project" ]]; then
  TARGET="${2:?path required after --project}/.claude"
fi
mkdir -p "$TARGET/agents" "$TARGET/skills"
cp "$ROOT/agents/prompts-to-skill-agent.md" "$TARGET/agents/"
cp -r "$ROOT/skills/prompts-to-skill" "$ROOT/skills/prompts-to-skill-release" "$TARGET/skills/"
echo "installed agent and skills into $TARGET"
echo "check: open /agents and confirm prompts-to-skill-agent is listed"
