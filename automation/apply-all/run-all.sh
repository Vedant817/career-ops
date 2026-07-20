#!/bin/zsh
set -euo pipefail

# Single entry point for every "apply everything" one-shot launcher in this
# directory (Codex, Claude Code, OpenCode, Grok Build CLI, Cursor). Each CLI
# script handles its own preflight (deps, portals.yml, Playwright MCP
# registration, doctor) and then execs into its CLI with
# ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md as the initial prompt.
#
# Usage:
#   automation/apply-all/run-all.sh              interactive menu
#   automation/apply-all/run-all.sh <cli>         run one CLI directly
#   automation/apply-all/run-all.sh all           run every installed CLI,
#                                                  one at a time (not in
#                                                  parallel -- the workflow
#                                                  shares tracker/report files
#                                                  across runs and is designed
#                                                  to be resumed, not raced)

ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
SCRIPT_DIR="$ROOT/automation/apply-all"

typeset -a NAMES=(codex claude opencode grok cursor)
typeset -A CLI_BIN=(
  codex     codex
  claude    claude
  opencode  opencode
  grok      grok
  cursor    cursor-agent
)

installed_names() {
  local n
  for n in "${NAMES[@]}"; do
    command -v "${CLI_BIN[$n]}" >/dev/null 2>&1 && echo "$n"
  done
}

run_one() {
  local n="$1"
  echo
  echo "=== Career-Ops apply-all: $n ==="
  echo
  "$SCRIPT_DIR/$n.sh"
}

CHOICE="${1:-}"

if [[ -z "$CHOICE" ]]; then
  typeset -a AVAILABLE=("${(@f)$(installed_names)}")
  if [[ ${#AVAILABLE[@]} -eq 0 ]]; then
    echo "None of codex, claude, opencode, grok, cursor-agent are installed in PATH."
    exit 1
  fi
  echo "Career-Ops apply-all -- installed CLIs:"
  i=1
  for n in "${AVAILABLE[@]}"; do
    echo "  $i) $n"
    i=$((i + 1))
  done
  echo "  a) all of the above, one at a time"
  echo -n "Choose a CLI: "
  read -r REPLY
  if [[ "$REPLY" == "a" ]]; then
    CHOICE="all"
  elif [[ "$REPLY" =~ '^[0-9]+$' && "$REPLY" -ge 1 && "$REPLY" -le ${#AVAILABLE[@]} ]]; then
    CHOICE="${AVAILABLE[$REPLY]}"
  else
    echo "Unrecognized choice: $REPLY"
    exit 1
  fi
fi

if [[ "$CHOICE" == "all" ]]; then
  typeset -a AVAILABLE=("${(@f)$(installed_names)}")
  for n in "${AVAILABLE[@]}"; do
    run_one "$n"
  done
  exit 0
fi

if [[ ! " ${NAMES[*]} " == *" $CHOICE "* ]]; then
  echo "Unknown CLI '$CHOICE'. Expected one of: ${NAMES[*]}, or 'all'."
  exit 1
fi

exec "$SCRIPT_DIR/$CHOICE.sh"
