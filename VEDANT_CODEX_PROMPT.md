Set up and operate this Career-Ops repository for Vedant Mahajan.

First, read `AGENTS.md`, `CODEX.md`, `cv.md`, `config/profile.yml`, `modes/_profile.md`, `modes/_custom.md`, and `templates/portals.example.yml`.

Run:

```bash
node doctor.mjs --json
npm run validate:portals
npm run sync-check
npm run cv:verify-facts
npm run verify
```

If `portals.yml` is missing, copy `templates/portals.example.yml` to `portals.yml` and customize only the user-layer file.

Configure the portal scanner for:

- SDE, Software Engineer, Backend Engineer, Java Developer, Spring Boot Engineer, Platform Engineer, Cloud Engineer, and strong Full-Stack Engineer roles.
- Forward Deployed Engineer, Forward Deployed Software Engineer, Solutions Engineer, Implementation Engineer, Integration Engineer, Customer Engineer, and Deployment Engineer roles only when they contain substantial coding.
- Agentic AI Engineer, Applied AI Engineer, AI Engineer, LLM Engineer, GenAI Engineer, AI Platform Engineer, Agent Engineer, and AI Product Engineer roles focused on agents, orchestration, tool calling, validation, guardrails, and production delivery.

Seniority:
- Include new grad, graduate, entry-level, junior, associate, fresher, 0–1 years, 0–2 years, and intern-to-full-time roles.
- Consider a 3-year requirement only if it appears flexible and the evidence is unusually strong.
- Exclude 4+ years, Senior, Staff, Principal, Lead, Manager, Director, and people-management roles.

Locations:
- Prioritize remote within India, Delhi NCR, Bengaluru, Hyderabad, and Pune.
- Consider Chennai or Mumbai only for unusually strong roles.
- Consider global remote only when the employer can legally hire or contract in India.
- Do not assume a generic remote role is India-compatible.

Truth and safety:
- Never fabricate or inflate skills, years, ownership, leadership, customers, metrics, compensation, notice period, work authorization, or relocation status.
- Tailor by selecting, reordering, and accurately reframing evidence from `cv.md`.
- Every generated claim must be defensible in an interview.
- Keep generated resumes to one page and choose the strongest 2–3 projects.
- Never send email, message recruiters, submit an application, accept terms, or click a final Apply/Submit/Send action.
- Apply mode may autofill with Playwright but must stop before final submission.
- Never bypass CAPTCHA or anti-bot controls.
- Ask Vedant before entering compensation, notice period, work authorization, sponsorship, legal declarations, protected-demographic answers, relocation commitments, or electronic signatures.

Workflow:
- Verify liveness and deduplicate before evaluation.
- Generate application-ready materials only for scores >= 4.0/5.
- Put 3.5–3.9 roles in manual review only when exceptional.
- Limit a daily batch to 10 evaluated roles and 5 application-ready roles.
- For each application-ready role generate: tailored one-page resume, concise cover note when useful, recruiter/referral draft, role-specific gap checklist, and likely interview topics.

After setup, summarize:
1. Setup health and remaining TODOs.
2. Active title, seniority, and location filters.
3. Which projects are emphasized for SDE, FDE, and agentic roles.
4. Whether local Playwright/Chromium and browser access are working.
5. The exact prompt to run the first scan.

Do not begin scanning until the audit is complete.
