#!/bin/zsh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
source "$ROOT/automation/apply-all/_common.sh"

apply_all_require_repo_root "$ROOT"
apply_all_require_cli codex "Codex"

# Codex CLI does not include the desktop app's built-in Browser. Ensure its
# Playwright MCP registration uses the Keychain-aware launcher required for
# scoped Workday password autofill.
PLAYWRIGHT_LAUNCHER="$ROOT/playwright-mcp-keychain.sh"
apply_all_register_playwright_mcp_cli \
  "codex mcp get playwright" \
  "codex mcp add playwright -- '$PLAYWRIGHT_LAUNCHER'" \
  "codex mcp remove playwright" \
  "$PLAYWRIGHT_LAUNCHER" \
  "Codex CLI"
apply_all_check_launcher "$PLAYWRIGHT_LAUNCHER"

apply_all_ensure_portals "$ROOT"
apply_all_ensure_prompt "$ROOT"
apply_all_bootstrap_deps "$ROOT"
apply_all_run_doctor "$ROOT"
apply_all_banner "Codex"

echo "GitHub plugin install (one-time, if not already done): run 'codex', then"
echo "'/plugins', search for GitHub, install/enable it, and connect account Vedant817."
echo

exec codex \
  --search \
  --sandbox danger-full-access \
  --ask-for-approval never \
  "$(cat "$ROOT/ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md")"
