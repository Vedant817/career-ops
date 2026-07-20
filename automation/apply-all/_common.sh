#!/bin/zsh
# Shared preflight helpers for the Career-Ops "apply everything" one-shot
# launchers in this directory. Sourced by codex.sh / claude.sh / opencode.sh /
# grok.sh / cursor.sh -- not meant to be run directly.
#
# Every function takes the repo root as its first argument so callers stay
# explicit about which checkout they're operating on.

apply_all_require_repo_root() {
  local root="$1"
  if [[ ! -f "$root/package.json" || ! -f "$root/AGENTS.md" ]]; then
    echo "Run this script from within the Career-Ops repository (via automation/apply-all/)."
    exit 1
  fi
}

apply_all_require_cli() {
  local cli="$1" label="$2"
  if ! command -v "$cli" >/dev/null 2>&1; then
    echo "$label CLI is not installed or is unavailable in PATH."
    exit 1
  fi
}

apply_all_bootstrap_deps() {
  local root="$1"
  # A fresh checkout has no node_modules directory. Bootstrap the exact locked
  # dependencies before running doctor so imports such as js-yaml are available.
  if ! node -e "import('js-yaml')" >/dev/null 2>&1; then
    echo "Career-Ops dependencies are missing. Installing from package-lock.json..."
    (cd "$root" && npm ci)
  fi
}

apply_all_ensure_portals() {
  local root="$1"
  if [[ ! -f "$root/portals.yml" ]]; then
    cp "$root/templates/portals.example.yml" "$root/portals.yml"
    echo "Created portals.yml. The agent will customize and validate the user-layer copy."
  fi
}

apply_all_ensure_prompt() {
  local root="$1"
  if [[ ! -f "$root/ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md" ]]; then
    echo "ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md is missing."
    exit 1
  fi
}

apply_all_run_doctor() {
  local root="$1"
  (cd "$root" && npm run doctor) || {
    echo "Career-Ops doctor reported a blocking local setup issue."
    exit 1
  }
}

apply_all_banner() {
  local cli_label="$1"
  echo
  echo "GitHub access must come from $cli_label's own GitHub integration"
  echo "(installed plugin, connected app, or authenticated MCP server)."
  echo "The workflow will not use gh, curl, raw GitHub APIs, or git clone."
  echo "Application browsing and autofill will use the Playwright MCP server."
  echo
}

# Idempotently register the Keychain-aware Playwright MCP launcher via a CLI's
# native `mcp add`/`mcp get` commands (stdio transport, name "playwright").
# Mirrors the original Codex registration idiom: only remove+add when the
# existing registration doesn't already point at our launcher script.
apply_all_register_playwright_mcp_cli() {
  local get_cmd="$1" add_cmd="$2" remove_cmd="$3" launcher="$4" label="$5"
  if ! eval "$get_cmd" 2>/dev/null | grep -Fq "$launcher"; then
    echo "Configuring the Keychain-aware Playwright MCP server for $label..."
    eval "$remove_cmd" >/dev/null 2>&1 || true
    eval "$add_cmd"
  fi
}

apply_all_check_launcher() {
  local launcher="$1"
  if ! "$launcher" --version >/dev/null 2>&1; then
    echo "Playwright MCP could not start. Browser autofill is unavailable."
    exit 1
  fi
}
