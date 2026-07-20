#!/bin/zsh
set -euo pipefail

# Launch Playwright MCP with narrowly scoped Workday password autofill. Passwords
# remain in macOS Keychain and a mode-0600 temporary init script that is removed
# when the MCP process exits; they are never passed through an agent prompt.
umask 077

ROOT="$(cd "$(dirname "$0")" && pwd)"
ACCOUNT="vedantmahajan271@gmail.com"
INIT_SCRIPT="$(mktemp -t career-ops-workday.XXXXXX.js)"

cleanup() {
  rm -f "$INIT_SCRIPT"
}
trap cleanup EXIT INT TERM HUP

LBG_PASSWORD="$(security find-generic-password -w -a "$ACCOUNT" -s "career-ops-workday-lbg" 2>/dev/null || true)"
LOWES_PASSWORD="$(security find-generic-password -w -a "$ACCOUNT" -s "career-ops-workday-lowes" 2>/dev/null || true)"

if [[ -n "$LBG_PASSWORD" || -n "$LOWES_PASSWORD" ]]; then
  LBG_JSON="$(node -e 'process.stdout.write(JSON.stringify(process.argv[1]))' "$LBG_PASSWORD")"
  LOWES_JSON="$(node -e 'process.stdout.write(JSON.stringify(process.argv[1]))' "$LOWES_PASSWORD")"

  sed \
    -e "s|__LBG_PASSWORD__|$LBG_JSON|" \
    -e "s|__LOWES_PASSWORD__|$LOWES_JSON|" \
    "$ROOT/workday-password-init.template.js" > "$INIT_SCRIPT"

  unset LBG_PASSWORD LOWES_PASSWORD LBG_JSON LOWES_JSON
fi

ARGS=(-y @playwright/mcp@latest --isolated)
if [[ -s "$INIT_SCRIPT" ]]; then
  ARGS+=(--init-script "$INIT_SCRIPT")
fi

npx "${ARGS[@]}" "$@" &
MCP_PID=$!
trap 'kill "$MCP_PID" 2>/dev/null || true; cleanup' EXIT INT TERM HUP
wait "$MCP_PID"
