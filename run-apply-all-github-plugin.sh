#!/bin/zsh
set -euo pipefail

# Backward-compatible entry point. The real implementation, and its siblings
# for Claude Code, OpenCode, Grok CLI, and Cursor, now live in
# automation/apply-all/ -- see automation/apply-all/README.md.
ROOT="$(cd "$(dirname "$0")" && pwd)"
exec "$ROOT/automation/apply-all/codex.sh" "$@"
