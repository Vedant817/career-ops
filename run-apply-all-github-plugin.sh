#!/bin/zsh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

if [[ ! -f "package.json" || ! -f "AGENTS.md" ]]; then
  echo "Run this script from the Career-Ops repository root."
  exit 1
fi

if ! command -v codex >/dev/null 2>&1; then
  echo "Codex CLI is not installed or is unavailable in PATH."
  exit 1
fi

# Codex CLI does not include the desktop app's built-in Browser. Ensure its
# Playwright MCP registration uses the Keychain-aware launcher required for
# scoped Workday password autofill.
PLAYWRIGHT_LAUNCHER="$ROOT/playwright-mcp-keychain.sh"
if ! codex mcp get playwright 2>/dev/null | grep -Fq "command: $PLAYWRIGHT_LAUNCHER"; then
  echo "Configuring the Keychain-aware Playwright MCP server for Codex CLI..."
  codex mcp remove playwright >/dev/null 2>&1 || true
  codex mcp add playwright -- "$PLAYWRIGHT_LAUNCHER"
fi

if ! "$PLAYWRIGHT_LAUNCHER" --version >/dev/null 2>&1; then
  echo "Playwright MCP could not start. Browser autofill is unavailable."
  exit 1
fi

if [[ ! -f "portals.yml" ]]; then
  cp templates/portals.example.yml portals.yml
  echo "Created portals.yml. Codex will customize and validate the user-layer copy."
fi

if [[ ! -f "ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md" ]]; then
  echo "ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md is missing."
  exit 1
fi

# A fresh checkout has no node_modules directory. Bootstrap the exact locked
# dependencies before running doctor so imports such as js-yaml are available.
if ! node -e "import('js-yaml')" >/dev/null 2>&1; then
  echo "Career-Ops dependencies are missing. Installing from package-lock.json..."
  npm ci
fi

npm run doctor || {
  echo "Career-Ops doctor reported a blocking local setup issue."
  exit 1
}

echo
echo "GitHub access must come from the installed Codex GitHub plugin."
echo "The workflow will not use gh, curl, raw GitHub APIs, or git clone."
echo "Application browsing and autofill will use the Playwright MCP server."
echo

exec codex \
  --search \
  --sandbox danger-full-access \
  --ask-for-approval never \
  "$(cat ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md)"
