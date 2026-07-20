#!/bin/zsh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
source "$ROOT/automation/apply-all/_common.sh"

apply_all_require_repo_root "$ROOT"
apply_all_require_cli grok "Grok Build CLI"

# Grok Build CLI does not include a built-in Browser MCP. Register the
# Keychain-aware Playwright launcher at project scope (./.grok/config.toml,
# scoped to this checkout only) required for scoped Workday password autofill.
PLAYWRIGHT_LAUNCHER="$ROOT/playwright-mcp-keychain.sh"
apply_all_register_playwright_mcp_cli \
  "grok mcp list" \
  "grok mcp add --scope project playwright -- '$PLAYWRIGHT_LAUNCHER'" \
  "grok mcp remove playwright --scope project" \
  "$PLAYWRIGHT_LAUNCHER" \
  "Grok Build CLI"
apply_all_check_launcher "$PLAYWRIGHT_LAUNCHER"

apply_all_ensure_portals "$ROOT"
apply_all_ensure_prompt "$ROOT"
apply_all_bootstrap_deps "$ROOT"
apply_all_run_doctor "$ROOT"
apply_all_banner "Grok Build CLI"

echo "GitHub access (one-time, if not already done): register a GitHub MCP"
echo "server for account Vedant817, e.g. 'grok mcp add --scope project github"
echo "-- npx -y @modelcontextprotocol/server-github', or install a GitHub"
echo "plugin via 'grok plugin marketplace'/'grok plugin install'. The agent"
echo "verifies this itself at the start of the run and stops if the connected"
echo "account isn't Vedant817."
echo

exec grok \
  --permission-mode bypassPermissions \
  "$(cat "$ROOT/ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md")"
