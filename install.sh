#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.claude"

log() { printf "[claude] %s\n" "$1"; }

mkdir -p "$TARGET_DIR"

log "Copying CLAUDE.md to $TARGET_DIR (overwrites existing file)"
cp -v "$SCRIPT_DIR/CLAUDE.md" "$TARGET_DIR/"

log "Done."
