#!/bin/bash
set -euo pipefail

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

git clone --depth 1 "https://github.com/KingOfKalk/claude.git" "$TMP"
mkdir -p ~/.claude
cp "$TMP/CLAUDE.md" ~/.claude/CLAUDE.md
