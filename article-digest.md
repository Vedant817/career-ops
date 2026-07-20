# Verified Project Evidence Bank — Vedant Mahajan

Generated from the installed GitHub Codex plugin on 2026-07-16. Only defensible claims below may be reused. Source code from private repositories is not reproduced.

## TrustRoute Agentic Payments

- **GitHub:** https://github.com/Vedant817/Speedrun-Agentic-Payment
- **Visibility:** public
- **Problem:** Demonstrates a lead agent discovering provider agents, applying identity/reputation/spend policies, making an x402-style local signed payment, validating outputs, recording receipts/evidence, and rerouting failures.
- **Verified architecture/stack:** Node.js 20 HTTP service; React client; SSE event stream; JSON persistence; provider registry; DeFiLlama Avalanche stable-yield adapter; deterministic validation and ReceiptRank logic.
- **Engineering proof:** API-key authentication, timing-safe comparison, CORS allowlist, security headers, POST/webhook rate limits, payment nonce replay protection, HMAC webhook handling, sanitized errors, signed tokens, tests using Node’s test runner, and a non-root Docker image.
- **Evidence:** `README.md`; `package.json`; `server.js`; `src/trust-route.js`; `tests/trust-route.test.js`; `Dockerfile`; commit [0157cb2](https://github.com/Vedant817/Speedrun-Agentic-Payment/commit/0157cb2d5e7d6e431449ced1919968b4ef0e8806).
- **Role tags:** `Backend`, `Distributed Systems`, `Reliability`, `Agentic AI`, `Integration`, `Full Stack`
- **Confidence:** high
- **Must not claim:** real Fuji/on-chain settlement, production customers, transaction volume, revenue, yield performance, or production scale. The README explicitly describes the default as a local-signed demo.

## RecallGuard Proxy

- **GitHub:** https://github.com/Vedant817/Recall-Guard-Proxy
- **Visibility:** private; clearly a personal software project, inspected only at a high level
- **Problem:** Adds a local trust boundary in front of persistent agent memory to redact secrets, classify trust/risk, quarantine poisoned context, filter retrieval, and export safe context/evidence packs.
- **Verified architecture/stack:** TypeScript pnpm monorepo; Fastify proxy; CLI; Next.js dashboard; local audit/state packages; Supermemory-compatible client; Zod validation.
- **Engineering proof:** deterministic secret redaction and quarantine policy; source-trust rules; dry-run scanning; command allowlists; delete/forget propagation; proxy and CLI tests with Vitest; Playwright dashboard test script; explicit security model and honest failure behavior when the upstream service is unavailable.
- **Evidence:** `README.md`; `package.json`; `apps/proxy/src/server.ts`; `apps/proxy/src/server.test.ts`; `docs/security-model.md`; commit [a41ceec](https://github.com/Vedant817/Recall-Guard-Proxy/commit/a41ceec77c5842ae911badd3d17c7427944691a4).
- **Role tags:** `Developer Tools`, `Platform`, `Reliability`, `Agentic AI`, `Backend`, `Security`
- **Confidence:** high
- **Must not claim:** complete prevention of prompt injection, public repository availability, production adoption, users, or scale.

## OpsVerse

- **GitHub:** https://github.com/Vedant817/OpsVerse
- **Visibility:** public
- **Problem:** Converts multimodal incident evidence into structured root-cause hypotheses, reproduction steps, regression-test suggestions, release-risk output, and incident artifacts through a staged agent swarm.
- **Verified architecture/stack:** Next.js/TypeScript; Cerebras OpenAI-compatible client configured for Gemma; Zod contracts; parallel evidence agents followed by RCA/test/release/narrator stages; SSE progress; optional Supabase persistence.
- **Engineering proof:** fail-closed provider/model readiness, explicit failed-agent states, dependency gating, structured schemas, persisted incident/agent/audit/benchmark tables, secret scanning, typecheck/lint/test/build/local verification scripts.
- **Evidence:** `README.md`; `package.json`; `src/lib/agents/orchestrator.ts`; `src/lib/cerebras/schemas.ts`; `supabase/schema.sql`; commit [053747a](https://github.com/Vedant817/OpsVerse/commit/053747aa6cd9d53074b182fb488b29daa4cab0c6).
- **Role tags:** `Agentic AI`, `Reliability`, `Platform`, `Full Stack`, `Developer Tools`
- **Confidence:** high
- **Must not claim:** production incident outcomes, always-available Gemma/Cerebras access, customer deployment, or measured business impact.

## SightBridge

- **GitHub:** https://github.com/Vedant817/SightBridge
- **Visibility:** public
- **Problem:** Provides self-hosted real-time video support with agent/customer sessions, server-routed media, chat, attachments, recording metadata, and persistent session history.
- **Verified architecture/stack:** pnpm/Turborepo; Next.js web app; Express/Socket.IO API; mediasoup SFU; PostgreSQL/Prisma; Redis and MinIO/S3-compatible services; Docker Compose.
- **Engineering proof:** JWT role enforcement, single-use HMAC-hashed invite tokens, Zod input validation, MIME/size checks, sanitized object keys, login/session rate limits, health and Prometheus metrics, persistent session/event/chat/recording schema, and explicit deployment/limitation documentation.
- **Evidence:** `README.md`; `package.json`; `docker-compose.yml`; `apps/api/prisma/schema.prisma`; PRs [#1](https://github.com/Vedant817/SightBridge/pull/1), [#2](https://github.com/Vedant817/SightBridge/pull/2), [#3](https://github.com/Vedant817/SightBridge/pull/3), [#4](https://github.com/Vedant817/SightBridge/pull/4); commit [1bbd0ac](https://github.com/Vedant817/SightBridge/commit/1bbd0ac898c3fc93ab98b76a2a9f091959d0b46c).
- **Role tags:** `Backend`, `Distributed Systems`, `Full Stack`, `Reliability`, `Cloud`, `Integration`
- **Confidence:** medium-high
- **Must not claim:** production-scale deployment, TURN support, SFU-side mixed recording, Redis-backed reconnect timers, customers, uptime, or scale. The repository documents browser recording fallback and in-process reconnect timers.

## Nexus Forge

- **GitHub:** https://github.com/Vedant817/Nexus-Forge
- **Visibility:** public
- **Problem:** Turns learning sources, GitHub repository/PR context, and agent logs into structured knowledge, workflow tasks, release-readiness output, architecture views, and proof packs.
- **Verified architecture/stack:** Next.js 16/TypeScript; Vercel AI SDK with Groq; Prisma/PostgreSQL; Zod; React Flow; Kanban workflow and `.cursorrules` export.
- **Engineering proof on default branch:** HTTPS/GitHub-only URL validation with private-address blocking; secret-redaction patterns; API rate limiting and CORS handling; repo-context fetcher; Prisma data model; attributable compatibility and UI-fix commits.
- **Evidence:** `README.md`; `package.json`; `prisma/schema.prisma`; `src/lib/security/url-safety.ts`; `src/lib/security/secret-redaction.ts`; `src/proxy.ts`; `src/app/api/projects/[id]/export/cursorrules/route.ts`; commit [2ae05da](https://github.com/Vedant817/Nexus-Forge/commit/2ae05dacb84bf560340291ea832105d284a51bf2).
- **Role tags:** `Agentic AI`, `Developer Tools`, `Full Stack`, `Backend`, `Integration`
- **Confidence:** medium-high
- **Must not claim:** signed webhook verification, recursive repository-tree inspection, JSON-column migration, or webhook prompt-injection sanitization as default-branch features; those changes are in open, unmerged PR [#1](https://github.com/Vedant817/Nexus-Forge/pull/1). Also do not claim production users or scheduled automation.

## Multi-Modal Evidence Review

- **GitHub:** https://github.com/Vedant817/Multi-Modal-Evidence-Review
- **Visibility:** public
- **Problem:** Reviews damage-claim images and structured claim context, then emits schema-constrained support/contradiction/insufficient-evidence decisions.
- **Verified architecture/stack:** Python; single per-claim pipeline shared by evaluation and final run; OpenRouter vision path with optional Anthropic client; Pillow/OpenCV preprocessing; YAML configuration.
- **Engineering proof:** deterministic image/path validation, requirement matching, history-risk computation, enum snapping, evidence-ID grounding, consistency repair, response caching, retry/fallback behavior, conservative failure rows, and an evaluation report that clearly distinguishes fallback/schema checks from limited live-image accuracy.
- **Evidence:** `README.md`; `code/src/pipeline.py`; `code/src/postprocess.py`; `code/evaluation/evaluation_report.md`; commits [188bc98](https://github.com/Vedant817/Multi-Modal-Evidence-Review/commit/188bc980595334031bb6cd832adfdd247eb5a304) and [7e27ca6](https://github.com/Vedant817/Multi-Modal-Evidence-Review/commit/7e27ca6fb986adc0d726f52bd47f0c4676ac1c13).
- **Role tags:** `Applied AI`, `Agentic AI`, `Backend`, `Reliability`, `Integration`
- **Confidence:** medium-high
- **Must not claim:** full 20-row live accuracy, production deployment, insurance customers, or broad model-quality metrics. The documented live check is a small three-claim subset and notes severity-calibration errors.

## PraVaah / NHAI Face Attendance

- **GitHub:** https://github.com/Vedant817/PraVaah
- **Visibility:** public
- **Problem:** Demonstrates offline-first face-attendance capture, local queueing, idempotent synchronization, and an administrative dashboard for field operations.
- **Verified architecture/stack:** React Native/TypeScript mobile app; Next.js API/admin; SQLite; Python/NumPy/ONNX training/export utilities.
- **Engineering proof:** Zod-validated bulk sync; UUID idempotency; score thresholds; local queue draining and atomic purge of accepted/duplicate records; HMAC-style record signature path; backend smoke and mobile E2E scripts; JWT/bcrypt admin flow.
- **Evidence:** `README.md`; `web/src/app/api/attendance/sync/route.ts`; `mobile/src/services/sync.ts`; `web/scripts/smoke.mjs`; `mobile/scripts/e2e.mjs`; commit [6d0fa23](https://github.com/Vedant817/PraVaah/commit/6d0fa23209caa23c4458b05c903de8bfd96e2935).
- **Role tags:** `Full Stack`, `Backend`, `Applied AI`, `Reliability`, `Integration`
- **Confidence:** medium
- **Must not claim:** the benchmark document’s device latency/accuracy figures, production NHAI deployment, real enrolled personnel, or tamper-proof security. The README calls this an end-to-end prototype and the sync/auth/security model still has production caveats.

## Verified Open-Source Contributions (not upstream authorship)

- Super Productivity [#5245](https://github.com/super-productivity/super-productivity/pull/5245) — merged side-navigation bug fix.
- Super Productivity [#5257](https://github.com/super-productivity/super-productivity/pull/5257) — merged reminder completion control plus translation updates.
- Super Productivity [#5283](https://github.com/super-productivity/super-productivity/pull/5283) — merged magic side-navigation refactor.
- fpdf2 [#1621](https://github.com/py-pdf/fpdf2/pull/1621) — merged color-font palette parameter with documentation and tests.
- HMPL [#231](https://github.com/hmpl-language/hmpl/pull/231) — merged blog code-block copy-button visibility fix.

Use only these exact contribution scopes. Do not claim that Vedant built or owns Super Productivity, fpdf2, HMPL, mem0, Intlayer, or any other upstream project. Closed-unmerged PRs are not merged contributions.

