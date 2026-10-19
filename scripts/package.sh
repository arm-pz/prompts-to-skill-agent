#!/usr/bin/env bash
# Zip each skill in skills/ with the skill folder as the archive root.
# Usage: scripts/package.sh [output-dir]
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="${1:-$ROOT/dist}"
mkdir -p "$OUT"
for dir in "$ROOT"/skills/*/; do
  name="$(basename "$dir")"
  (cd "$ROOT/skills" && zip -qr "$OUT/$name.zip" "$name" \
    -x "*/.DS_Store" "*/__pycache__/*" "*.pyc")
  echo "packaged $OUT/$name.zip"
done
