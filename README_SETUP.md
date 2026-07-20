# Vedant Career-Ops Setup

This bundle contains only Career-Ops user-layer files. It does not modify the repository's system files.

## 1. Extract into the cloned repository

From outside the repository:

```bash
unzip -o vedant-career-ops-setup.zip -d /absolute/path/to/career-ops
cd /absolute/path/to/career-ops
```

Or manually copy:

- `cv.md`
- `config/profile.yml`
- `modes/_profile.md`
- `modes/_custom.md`
- `VEDANT_CODEX_PROMPT.md`

## 2. Install and verify

```bash
node --version
npm install
npx playwright install chromium
npm run doctor
```

Career-Ops requires Node.js 18+.

## 3. Start Codex safely

```bash
codex --search --sandbox workspace-write
```

In Codex, inspect `/status` and `/permissions`. Approve only the network and browser actions required for job-page scanning. Do not use `--yolo` or `--dangerously-bypass-approvals-and-sandbox`.

## 4. Run the setup prompt

Paste the complete contents of `VEDANT_CODEX_PROMPT.md` into the Codex session.

## 5. First scan prompt

After Codex reports that the audit passed:

```text
Run the career-ops scan mode for Vedant's configured SDE, FDE, and agentic engineering targets. Verify liveness and deduplicate. Evaluate at most 10 of the strongest new roles, generate application-ready packages only for scores >= 4.0/5, and do not open or fill application forms yet.
```

## 6. Prepare one selected application

```text
Run career-ops apply mode for report <REPORT_NUMBER>. Refresh the posting, show me the tailored resume and all proposed form answers, then autofill supported fields. Stop before any final Apply, Submit, Send, consent, signature, CAPTCHA, or legal declaration.
```
