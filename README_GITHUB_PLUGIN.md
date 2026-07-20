# Career-Ops One-Shot with Codex GitHub Plugin

This version does not use GitHub CLI (`gh`).

## Install the GitHub plugin in Codex

From the Career-Ops repository:

```bash
codex
```

Inside Codex:

```text
/plugins
```

Search for **GitHub**, install or enable it, and connect the GitHub account `Vedant817`.

After installation, exit Codex and start a new session. Plugins and their tools become available to new sessions.

Verify in the new session:

```text
Use the GitHub plugin to show my authenticated GitHub username and list five repositories I own. Do not use shell commands or gh.
```

The username must be `Vedant817`.

## Add these files to Career-Ops

Extract the ZIP into the repository root:

```bash
unzip -o ~/Downloads/career-ops-github-plugin-one-shot.zip -d .
chmod +x run-apply-all-github-plugin.sh
```

## Run the entire workflow

```bash
./run-apply-all-github-plugin.sh
```

The prompt requires the installed GitHub plugin and refuses to fall back to `gh`, curl, raw GitHub REST requests, or cloning repositories.

## Other CLIs

This same one-shot workflow also runs on Claude Code, OpenCode, Grok Build CLI,
and Cursor. Each has its own launcher script (Playwright MCP registration +
that CLI's own full-autonomy flags) alongside this one in
`automation/apply-all/`, plus a single `run-all.sh` entry point that launches
any of them. See `automation/apply-all/README.md` for details. This script
(`./run-apply-all-github-plugin.sh`) is kept at the repository root only for
backward compatibility -- it now just delegates to
`automation/apply-all/codex.sh`.
