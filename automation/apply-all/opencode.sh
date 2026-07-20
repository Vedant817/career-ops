#!/bin/zsh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
source "$ROOT/automation/apply-all/_common.sh"

apply_all_require_repo_root "$ROOT"
apply_all_require_cli opencode "OpenCode"

# `opencode mcp add` has no flag for a local/stdio command (only --url for
# remote servers), so register the Keychain-aware Playwright launcher
# directly in the project config (opencode.json at the repo root). Project
# config overrides same-named global config only inside this checkout, so any
# unrelated global "playwright" MCP server the user has elsewhere is left
# untouched. Merge idempotently so reruns don't clobber other project config.
PLAYWRIGHT_LAUNCHER="$ROOT/playwright-mcp-keychain.sh"
OPENCODE_JSON="$ROOT/opencode.json"
if ! grep -Fq "$PLAYWRIGHT_LAUNCHER" "$OPENCODE_JSON" 2>/dev/null; then
  echo "Configuring the Keychain-aware Playwright MCP server for OpenCode..."
  node -e '
    const fs = require("fs");
    const path = process.argv[1];
    const launcher = process.argv[2];
    let config = {};
    try { config = JSON.parse(fs.readFileSync(path, "utf8")); } catch {}
    config.mcp = config.mcp || {};
    config.mcp.playwright = { type: "local", command: [launcher] };
    fs.writeFileSync(path, JSON.stringify(config, null, 2) + "\n");
  ' "$OPENCODE_JSON" "$PLAYWRIGHT_LAUNCHER"
fi
apply_all_check_launcher "$PLAYWRIGHT_LAUNCHER"

apply_all_ensure_portals "$ROOT"
apply_all_ensure_prompt "$ROOT"
apply_all_bootstrap_deps "$ROOT"
apply_all_run_doctor "$ROOT"
apply_all_banner "OpenCode"

echo "GitHub access (one-time, if not already done): install the built-in"
echo "GitHub agent ('opencode github install') or register a GitHub MCP"
echo "server for account Vedant817 in opencode.json ('opencode mcp add' /"
echo "'opencode mcp auth' for OAuth-enabled servers). The agent verifies this"
echo "itself at the start of the run and stops if the connected account isn't"
echo "Vedant817."
echo

exec opencode --auto --prompt "$(cat "$ROOT/ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md")"
