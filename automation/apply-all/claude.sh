#!/bin/zsh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
source "$ROOT/automation/apply-all/_common.sh"

apply_all_require_repo_root "$ROOT"
apply_all_require_cli claude "Claude Code"

# Claude Code does not include a built-in Browser MCP. Register the
# Keychain-aware Playwright launcher (project-local scope, private to this
# checkout) required for scoped Workday password autofill.
PLAYWRIGHT_LAUNCHER="$ROOT/playwright-mcp-keychain.sh"
apply_all_register_playwright_mcp_cli \
  "claude mcp get playwright" \
  "claude mcp add playwright -- '$PLAYWRIGHT_LAUNCHER'" \
  "claude mcp remove playwright" \
  "$PLAYWRIGHT_LAUNCHER" \
  "Claude Code"
apply_all_check_launcher "$PLAYWRIGHT_LAUNCHER"

apply_all_ensure_portals "$ROOT"
apply_all_ensure_prompt "$ROOT"
apply_all_bootstrap_deps "$ROOT"
apply_all_run_doctor "$ROOT"
apply_all_banner "Claude Code"

echo "GitHub access (one-time, if not already done): register a GitHub MCP"
echo "server or connector for account Vedant817 -- 'claude mcp add --transport"
echo "http github <url>' plus 'claude mcp login github' for an OAuth-enabled"
echo "server, or connect GitHub from Claude Code's plugin/connector settings."
echo "The agent verifies this itself at the start of the run and stops if the"
echo "connected account isn't Vedant817."
echo

exec claude --dangerously-skip-permissions "$(cat "$ROOT/ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md")"
