# One-Shot Career-Ops — GitHub Plugin Project Discovery + Apply-All Queue

Operate Career-Ops for Vedant Mahajan as one continuous, sequential workflow.

## Mandatory browser preflight

This prompt runs in your coding CLI's agent session. Use the configured `playwright` MCP browser tools
for job-posting verification, application navigation, field entry, and uploads.
Do not treat web search, WebFetch, shell HTTP clients, or the presence of a local
Playwright package as interactive browser control.

Before repository discovery or job scanning, call a Playwright MCP browser tool,
open `about:blank`, and confirm that a browser snapshot succeeds. If the
Playwright MCP tools are absent or the preflight fails, stop immediately and
report the exact MCP error. Never continue through package generation and then
report zero autofilled forms because browser tooling was unavailable.

If `data/application-review-queue.md` and complete packages under
`output/applications/` already exist from an earlier interrupted run, validate
and reuse them. Resume the browser/apply stage for live entries marked ready to
fill instead of repeating GitHub discovery, job discovery, evaluation, or CV
generation. Regenerate an artifact only when it is missing, invalid, or stale.

## Mandatory integration rule

Use the **installed GitHub plugin/app/MCP tools available inside this CLI** for every GitHub operation.

Do NOT use:

- `gh` or GitHub CLI;
- `curl`, `wget`, or raw requests to `api.github.com`;
- local GitHub credentials;
- `git clone` for repository discovery or analysis;
- unauthenticated web scraping of GitHub;
- shell scripts that call GitHub APIs.

The GitHub plugin is the sole GitHub data source.

At the beginning, call the GitHub plugin to:

1. read the authenticated GitHub profile;
2. confirm that the authenticated account is `Vedant817`;
3. list repositories owned by `Vedant817`;
4. confirm whether private repositories are accessible.

If the GitHub plugin is not installed, disabled, unauthenticated, unavailable, or connected to another account:

- do not fall back to `gh` or public scraping;
- stop before scanning jobs;
- report the exact missing setup;
- instruct Vedant to install/connect this CLI's GitHub integration (plugin, connected app, or MCP server), confirm the connected account is `Vedant817`, start a new session, and rerun this prompt.

## Objective

Do NOT show Vedant a shortlist and wait for him to select jobs.

The objective is to:

1. audit Vedant's GitHub repositories through the GitHub plugin;
2. build a verified project evidence bank;
3. scan every configured job source;
4. evaluate every new role that passes hard qualification gates;
5. independently select the best verified projects for every role;
6. generate a tailored application package for every qualifying role;
7. open and autofill every supported application sequentially;
8. stop before final submission and create a review/submit queue.

Do not ask Vedant to choose among qualifying roles or projects.

## 0. Read Career-Ops instructions and validate local setup

Read completely:

- `AGENTS.md`
- this CLI's own entry file (`CODEX.md`, `CLAUDE.md`, `OPENCODE.md`, or the equivalent for whichever CLI is running this session)
- `cv.md`
- `config/profile.yml`
- `modes/_profile.md`
- `modes/_custom.md`
- `portals.yml`
- `DATA_CONTRACT.md`
- `docs/APPLY_AUTOFILL.md`

Run only these local Career-Ops checks:

```bash
node doctor.mjs --json
npm run validate:portals
npm run verify:portals
npm run sync-check
npm run verify
```

`cv:verify-facts` requires a generated CV path; it is not a repository-level
preflight. Run it separately for every generated resume, for example:

```bash
npm run cv:verify-facts -- output/applications/<company>-<role>/tailored-resume.md
```

If `portals.yml` is missing, copy `templates/portals.example.yml` to `portals.yml`, customize only that user-layer copy for Vedant's targets, validate it, and continue.

Never edit system-layer files for personalization.

## 1. GitHub plugin repository discovery

GitHub owner: `Vedant817`.

Use GitHub plugin tools to enumerate **all pages** of repositories owned by Vedant. Do not stop at the first result page.

When the plugin supports it, collect:

- repository name and canonical URL;
- visibility;
- fork, template, and archive status;
- description and topics;
- primary languages;
- creation, update, and latest-push dates;
- size;
- stars and forks;
- default branch;
- README and documentation;
- repository tree or important files;
- commits attributable to Vedant;
- pull requests and merged contributions;
- releases;
- CI workflows;
- deployment, Docker, infrastructure, testing, observability, and security indicators.

Create or refresh these Career-Ops user-layer files:

- `article-digest.md`
- `data/github-project-catalog.json`
- `data/github-project-audit.md`

These files may contain summaries and links, but must never contain secrets, confidential source code, or copied private file contents.

## 2. Repository safety and ownership rules

Never inspect or expose repositories containing:

- payslips;
- employment or HR documents;
- identity documents;
- credentials or secrets;
- client-confidential material;
- production data;
- private business documents;
- unrelated personal records.

Explicitly exclude repositories named or resembling:

- `Deloitte-PaySlips`;
- `Deloitte-Documents`;
- generic private `docs` repositories;
- any repository whose purpose is personal or employment-document storage.

For private repositories:

- inspect only repositories that are clearly Vedant's personal software projects;
- do not reproduce source code in Career-Ops output;
- do not expose private repository contents;
- use only high-level verified engineering evidence.

Do not treat repository ownership as proof of original authorship.

Detect and exclude:

- forks and mirrors where Vedant did not create the upstream project;
- copied tutorials;
- course follow-alongs;
- starter templates;
- generated demo repositories;
- practice repositories;
- repositories where authorship or contribution cannot be verified.

For a fork or open-source copy, only use Vedant's exact commits or merged pull requests as evidence. Never claim that he built the upstream repository.

## 3. Metadata pass and fast exclusions

Perform a lightweight metadata pass across every safe repository.

Exclude from resume-project consideration:

- forks without substantial attributable work;
- tutorials and course projects;
- mini-project collections;
- DSA, interview-prep, and language-practice repositories;
- empty or near-empty repositories;
- basic CRUD clones without meaningful architecture;
- abandoned prototypes without a working core;
- copied templates;
- projects whose technical claims cannot be verified;
- sensitive repositories;
- risky projects that weaken professional positioning;
- projects materially weaker than available alternatives.

Do not exclude a strong project only because it has few stars. Engineering quality and evidence matter more than popularity.

Record every exclusion and reason in `data/github-project-audit.md`.

## 4. Deep project inspection through GitHub plugin

Choose the strongest candidates across:

- backend and APIs;
- Java/Spring or Node/Python systems;
- distributed systems;
- cloud, platform, reliability, and DevOps;
- FDE, implementation, and integrations;
- agentic AI;
- RAG and LLM applications;
- developer tooling;
- full-stack product engineering.

Use GitHub plugin file-reading, repository-search, commit, pull-request, and workflow tools to inspect only the strongest candidates deeply.

Inspect, when available:

- README;
- package/build manifests;
- representative source files;
- architecture and configuration;
- API routes and schemas;
- database schemas and migrations;
- tests;
- CI workflows;
- Docker and deployment files;
- infrastructure configuration;
- validation;
- security controls;
- observability;
- commit history;
- pull requests;
- releases.

For every candidate verify:

- actual problem solved;
- current implementation status;
- Vedant's attributable contribution;
- architecture and data flow;
- actual languages and frameworks;
- implemented APIs, databases, queues, caches, agents, tools, integrations, or infrastructure;
- implemented reliability, security, validation, testing, observability, and deployment;
- public demo or deployment;
- weaknesses and incomplete areas.

Do not infer:

- production usage;
- customers;
- user counts;
- revenue;
- latency improvement;
- uptime;
- scale;
- cost savings;
- business impact

unless supported by `cv.md`, approved evidence, benchmark artifacts, test output, or repository documentation that clearly belongs to Vedant.

## 5. Project scoring

Score every verified candidate from 0–100:

- role-relevant engineering depth: 25;
- architecture and system-design substance: 20;
- implementation completeness: 15;
- reliability, security, validation, or observability: 15;
- tests, CI, deployment, and documentation: 10;
- clear attributable ownership: 10;
- public demo or repository accessibility: 5.

Apply strong penalties for:

- tutorial/copy indicators;
- weak ownership;
- missing core implementation;
- hardcoded demo logic;
- fabricated or synthetic claims;
- broken setup;
- serious security issues;
- misleading README content.

## 6. Build `article-digest.md`

Write only verified, defensible facts.

For every approved project include:

- project name;
- canonical GitHub URL;
- visibility;
- one-sentence problem statement;
- verified architecture;
- verified stack;
- 3–6 engineering proof points;
- reliability, security, testing, CI, deployment, or observability proof;
- exact evidence references such as repository paths, commits, PRs, workflows, or releases;
- role tags;
- confidence level;
- claims that must not be made.

Use tags such as:

- `SDE`
- `Backend`
- `Java`
- `Distributed Systems`
- `Platform`
- `Cloud`
- `Reliability`
- `FDE`
- `Integration`
- `Agentic AI`
- `RAG`
- `Developer Tools`
- `Full Stack`

GitHub-derived resume claims become usable only after they are written into `article-digest.md`.

## 7. Per-role project selection

Never use one static project list.

For each JD, rank all approved projects independently:

- mandatory-skill match: 30%;
- responsibility and problem-domain match: 20%;
- architecture match: 15%;
- production, reliability, and security relevance: 15%;
- evidence quality and defensibility: 10%;
- recency and completeness: 5%;
- public demo or accessible repository: 5%.

Choose only the strongest 2–3 projects for that particular one-page resume.

Role adaptation:

- SDE/backend: APIs, Java/Spring, Node/Python, databases, queues, caching, distributed systems, cloud, CI/CD, system design.
- FDE/solutions/integration: end-to-end delivery, integrations, debugging, rapid prototyping, deployment, workflow automation, reliability.
- Agentic/applied AI: agent orchestration, tool calling, RAG, structured output, deterministic validation, guardrails, evaluation, memory, observability, security.
- Platform/cloud/SRE: disaster recovery, incident response, health checks, Docker, Kubernetes, networking, CI/CD, failover, queues, distributed reliability.
- Full stack: substantial backend ownership plus real product UI and deployment.

Never manufacture a keyword match.

## 8. Scan every configured job source

Run Career-Ops scanner modes and supported full/reverse-ATS scans.

Search for:

- Software Engineer;
- Software Development Engineer;
- SDE I;
- Software Engineer I;
- Backend Engineer;
- Java Backend Engineer;
- Spring Boot Engineer;
- Platform Engineer;
- Cloud Software Engineer;
- strong Full-Stack Engineer roles;
- Forward Deployed Engineer;
- Forward Deployed Software Engineer;
- Technical Solutions Engineer;
- Implementation Engineer;
- Integration Engineer;
- Deployment Engineer;
- coding-heavy Customer Engineer;
- Agentic AI Engineer;
- AI Agent Engineer;
- Applied AI Engineer;
- LLM Engineer;
- GenAI Engineer;
- AI Platform Engineer;
- AI Product Engineer;
- AI Automation Engineer.

### Hard qualification gates

Include:

- new grad;
- graduate;
- fresher;
- entry level;
- junior;
- associate;
- SDE I;
- Software Engineer I;
- 0–1 years;
- 0–2 years;
- intern-to-full-time roles.

A 3-year requirement may pass only when visibly flexible and exceptionally aligned.

Exclude:

- mandatory 4+ years;
- Senior, Staff, Principal, Lead, Manager, Director, Head, or people-management roles;
- unpaid roles or roles demanding fees;
- suspicious or illegitimate postings;
- support-only, presales-only, sales-demo-only, or account-management-heavy FDE roles;
- prompt-writing-only, annotation, content-generation, or non-engineering AI roles;
- remote roles without evidence that candidates in India can be hired or contracted;
- duplicate applications;
- expired postings.

Prioritize:

1. remote within India;
2. Delhi NCR;
3. Bengaluru;
4. Hyderabad;
5. Pune;
6. Chennai or Mumbai only when unusually strong;
7. global remote only when India hiring or contracting is explicit.

Verify liveness and legitimacy before evaluation.

## 9. Evaluate all qualifying roles

Do not stop after presenting a shortlist.

Evaluate every new role passing the hard gates, sequentially.

- Score `>= 4.0/5`: enter the application workflow automatically.
- Score `3.5–3.9`: enter only with a concrete exceptional reason and no hard-gate violation.
- Score `< 3.5`: reject and record one concise reason.
- Hard-gate failures override scores.

For every passing role:

1. create an evaluation report;
2. select role-specific projects from `article-digest.md`;
3. generate an ATS-first one-page resume PDF;
4. run fact verification;
5. create a cover note when required or genuinely valuable;
6. draft recruiter/referral outreach without sending — follow `modes/refer.md`: find a real contact (a named person's public email, a general recruiting mailbox, or a LinkedIn contact, in that order — never a fabricated/guessed email address), draft the appropriate message, and save it as that role's `outreach.md`;
7. create skill-gap and interview-prep files;
8. recheck posting liveness;
9. check duplicate status;
10. enter apply mode automatically.

Do not ask Vedant which passing roles to process.

## 10. Apply-all browser workflow

Process qualifying applications one at a time.

For each application:

- use the Playwright MCP browser tools (not WebFetch) for the live form;
- open the official application URL;
- run the knockout-question scan;
- autofill all supported fields from approved source files;
- upload the correct tailored resume;
- attach the cover letter only when required or valuable;
- preserve every proposed answer;
- update the tracker.

### Workday account creation

For a live Workday application that requires an account:

1. choose Create Account rather than abandoning the application;
2. enter `vedantmahajan271@gmail.com` in the email and confirmation-email fields;
3. continue until a password, OTP, terms, privacy consent, or other
   user-controlled decision is required;
4. allow the Keychain-aware Playwright MCP launcher to fill password and
   confirmation-password fields automatically on the allowlisted tenant;
5. after Vedant confirms completion, resume autofill and stop before the final
   application Submit button.

### OTP and verification-code pause/resume

When an application or account flow requests an OTP, email code, or SMS code:

1. keep the current Playwright page and browser context open;
2. immediately ask Vedant for the current code in the interactive session;
3. wait for his reply instead of marking the application blocked or moving on;
4. enter the supplied code only into the visible verification-code field;
5. trigger the non-final Verify/Continue action when it only verifies the code;
6. confirm that the code was accepted, then resume account creation and form
   autofill automatically;
7. if the code is rejected or expires, request one fresh code and retry once.

Treat every code as ephemeral. Never echo it back, write it to any file, include
it in a report or tracker note, retain it for another site, or expose it in the
final summary. If the run is non-interactive and cannot receive a code, mark the
role `Blocked — User Input` with only `OTP required` as the reason.

Never retrieve or print the Keychain password through an agent shell/tool call, and
never place a password in a Career-Ops file, prompt, report, or log.
Never accept terms, privacy consent, or legal attestations on Vedant's behalf.

### Final agent QA before handoff

Before marking any application `Ready to Submit`, inspect the live form and:

1. verify company, role, location, and canonical application URL;
2. compare every entered identity, contact, employment, education, project, and
   narrative value against the approved source files;
3. confirm the intended tailored resume is attached and fact verification passed;
4. reconfirm liveness, duplicate status, and blacklist status;
5. inspect all visible required fields, validation errors, hidden/expanded
   sections, attachments, and unanswered questions;
6. confirm no legal, demographic, consent, work-authorization, visa,
   compensation, notice-period, or relocation answer was inferred;
7. write a compact QA result to `data/application-review-queue.md`, including
   fields reviewed, attachment reviewed, unresolved items, and `QA: PASS` or
   `QA: BLOCKED`.

Only `QA: PASS` may receive `Ready to Submit`. Even after a pass, leave the
final Submit button untouched for Vedant.

Never click or trigger:

- final Apply;
- final Submit;
- Send;
- a final Continue that submits;
- electronic signature;
- consent or legal attestation;
- CAPTCHA or anti-bot bypass.

Vedant performs final submission.

When one application is blocked by a non-OTP user decision, do not stop the
entire batch. Mark it `Blocked — User Input`, save the package and question, and
continue. In an interactive session, OTP alone is a pause/resume event rather
than a terminal blocker.

Human-only blockers include:

- CAPTCHA;
- login requiring unknown credentials;
- compensation;
- notice period;
- exact joining date;
- work authorization;
- visa or sponsorship;
- unrecorded relocation commitment;
- legal declaration;
- demographic answer;
- electronic signature;
- unknown factual answer.

Prefer “Decline to self-identify” only when that exact optional choice exists. Never infer demographic information.

## 11. Preserve application work

For each passing role create:

```text
output/applications/<company>-<role>/
  tailored-resume.pdf
  tailored-resume.md
  cover-note.md
  outreach.md
  form-answers.md
  skill-gaps.md
  interview-prep.md
  evidence-map.md
```

Use tracker statuses:

- `Ready to Submit`
- `Ready to Fill/Submit`
- `Blocked — User Input`
- `Applied`
- `Rejected by Filter`
- `Duplicate`
- `Expired`
- `Failed — Technical`

Use `Applied` only after Vedant confirms that final submission occurred.

Create `data/application-review-queue.md` with:

- company and role;
- score;
- application URL;
- tailored resume path;
- selected projects and reasons;
- form/browser status;
- blocker;
- exact action required from Vedant.

## 12. Resilience

- Use the GitHub plugin, never `gh`.
- Work sequentially.
- Save after every role.
- One failed site must not terminate the batch.
- Retry transient navigation failure once.
- If browser control becomes unavailable mid-run, mark only the affected role
  `Failed — Technical`, record the exact MCP failure, and continue only after a
  fresh Playwright browser call succeeds.
- Never retry CAPTCHA.
- Continue until every qualifying role has a terminal status.
- Never send emails or recruiter messages.
- Never alter GitHub repositories.
- Never commit Career-Ops changes unless Vedant explicitly requests it.

## 13. Final report

Report:

1. authenticated GitHub account;
2. repositories enumerated through the GitHub plugin;
3. private-repository access status;
4. repositories deeply inspected;
5. approved resume projects;
6. exclusions and major reasons;
7. jobs discovered;
8. hard-filter rejections;
9. jobs evaluated;
10. below-threshold jobs;
11. application packages generated;
12. forms autofilled;
13. applications ready for final Submit;
14. applications ready to fill/submit;
15. applications blocked;
16. technical failures;
17. path to `data/application-review-queue.md`.

Lead with forms requiring only Vedant's final Submit click.

Begin now. Do not ask Vedant to select roles or projects.
