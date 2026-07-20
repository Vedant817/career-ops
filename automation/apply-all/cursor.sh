#!/bin/zsh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
source "$ROOT/automation/apply-all/_common.sh"

apply_all_require_repo_root "$ROOT"
apply_all_require_cli cursor-agent "Cursor CLI"

# cursor-agent has no `mcp add` subcommand -- MCP servers are declared
# directly in .cursor/mcp.json (project-scoped, private to this checkout) and
# then approved with `mcp enable`. Merge our entry in idempotently so reruns
# don't clobber any other MCP servers already configured for this project.
PLAYWRIGHT_LAUNCHER="$ROOT/playwright-mcp-keychain.sh"
MCP_JSON="$ROOT/.cursor/mcp.json"
mkdir -p "$ROOT/.cursor"
if ! grep -Fq "$PLAYWRIGHT_LAUNCHER" "$MCP_JSON" 2>/dev/null; then
  echo "Configuring the Keychain-aware Playwright MCP server for Cursor CLI..."
  node -e '
    const fs = require("fs");
    const path = process.argv[1];
    const launcher = process.argv[2];
    let config = {};
    try { config = JSON.parse(fs.readFileSync(path, "utf8")); } catch {}
    config.mcpServers = config.mcpServers || {};
    config.mcpServers.playwright = { command: launcher };
    fs.writeFileSync(path, JSON.stringify(config, null, 2) + "\n");
  ' "$MCP_JSON" "$PLAYWRIGHT_LAUNCHER"
fi
cursor-agent mcp enable playwright >/dev/null 2>&1 || true
apply_all_check_launcher "$PLAYWRIGHT_LAUNCHER"

apply_all_ensure_portals "$ROOT"
apply_all_ensure_prompt "$ROOT"
apply_all_bootstrap_deps "$ROOT"
apply_all_run_doctor "$ROOT"
apply_all_banner "Cursor CLI"

echo "GitHub access (one-time, if not already done): add a GitHub MCP server"
echo "to .cursor/mcp.json for account Vedant817 (project- or user-scoped),"
echo "approve it with 'cursor-agent mcp enable <name>', or connect GitHub from"
echo "Cursor's own integrations settings. The agent verifies this itself at"
echo "the start of the run and stops if the connected account isn't Vedant817."
echo

exec cursor-agent \
  --force \
  --approve-mcps \
  --sandbox disabled \
  "$(cat "$ROOT/ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md")"
