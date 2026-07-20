# Mode: refer — Referral & HR Contact Outreach

> Apply `voice-dna.md` (if present) to the drafted message — full guardrail, conversational voice included (Tier 1 + Tier 2). See `_shared.md` → Voice DNA.

Finds a real, contactable person or mailbox at the target company and drafts
one outreach message asking them to consider the application or refer the
candidate. This is the "along with the application" companion to `apply` and
the apply-all batch workflow (`ONE_SHOT_APPLY_ALL_GITHUB_PLUGIN.md`): whenever
a job is applied to, this mode runs too and produces a draft the candidate
sends from their own inbox or LinkedIn.

It is NOT `contacto` (LinkedIn-only, standalone) or `email` (drafts from an
already-known contact). `refer` does contact **discovery** first, then hands
the actual drafting to whichever of those two fits what it found.

**Never send. Never submit a form. Draft only — the candidate sends it
manually**, same as every other career-ops outreach mode.

---

## When this runs automatically

- `apply` mode, Step 9 (Post-apply), right after the tracker/follow-up update.
- The apply-all batch workflow, once per application-ready role, saved as
  that role's `outreach.md`.

Read `outreach.referral.auto` in `config/profile.yml` first. **Default `true`
when absent.** If explicitly `false`, skip this mode when triggered
automatically — the candidate can still invoke `/career-ops refer` on demand
regardless of the setting.

---

## Step 1 — Load context

Read `cv.md`, `config/profile.yml`, `modes/_profile.md`, `article-digest.md`
(if it exists), `voice-dna.md` (if it exists), and the matched report if one
exists (score, archetype, and any company research already gathered in
Block C/G — reuse it instead of re-searching).

---

## Step 2 — Find a contact (bounded, inline research)

Same research-budget rule as `oferta` Blocks C/D (see `_shared.md` → Subagent
delegation): bounded, inline WebSearch, no recursive subagents, no open-ended
research skill. Stop at the first hit below — do not keep searching past it.

1. **Already known.** If the report or an earlier `contacto` run already
   identified a hiring manager, recruiter, or peer, reuse that contact
   instead of searching again.
2. **A named person's publicly self-disclosed email** — listed on the
   company's own team/about page, the person's personal site or blog byline,
   a conference-speaker bio, or a public GitHub profile's email field. The
   address must be something the person chose to publish themselves.
3. **A general recruiting mailbox on the company's own site** — `careers@`,
   `talent@`, `jobs@`, `hr@`, `recruiting@`. Never a special-purpose mailbox
   (accessibility, benefits, ethics/whistleblower, alumni, press) — see
   `modes/email.md` → Contact triage for the full forbidden list.
4. **A LinkedIn contact** — hiring manager, recruiter, or a team peer with a
   similar role — using the "Identify targets" search from `modes/contacto.md`.

**Hard rule: never fabricate an email address.** Do not guess a pattern like
`firstname.lastname@company.com` and do not invent one because it looks
plausible — an unverifiable guess is exactly the kind of manufactured detail
the source-of-truth rule forbids, applied to a person's contact info instead
of a candidate fact. If sources 1-3 yield nothing, fall through to LinkedIn
(source 4). If nothing from any source is found, say so plainly and skip
drafting — do not force a message to a fabricated or low-confidence target.

**Never** use a data-broker, people-search, or email-enrichment site/service
to find or infer a contact. Public, self-disclosed sources only.

---

## Step 3 — Draft

- **If an email address was found** (source 1-3 in Step 2): draft using
  `modes/email.md`'s `referral_request` structure for a named person, or a
  short, direct `hr_application`-style note for a general mailbox ("please
  consider my application for {role}, resume attached").
- **If only a LinkedIn contact was found** (source 4): draft using
  `modes/contacto.md`'s persona engine (peer/hiring manager/recruiter framing,
  ≤300 characters).

Apply the same source-of-truth and no-fabrication rules as every other mode:
reformulate real experience from `cv.md`/`article-digest.md`, never invent a
skill, metric, or claim. Never share a phone number (Global Rules,
`_shared.md`).

---

## Step 4 — Save and present

Show the candidate:
- Who was found (name/role if a person, or the mailbox name) and how (which
  source from Step 2)
- The channel (email or LinkedIn)
- The drafted message

Persist it:
- If invoked from `apply` or on a report-linked role: append a
  `## I) Referral Outreach` section to the matched report (contact, channel,
  drafted message) — additive, do not reorder or edit blocks A-H.
- If invoked from the apply-all batch workflow: save as
  `output/applications/{company}-{role}/outreach.md` alongside the rest of
  that role's package.
- If no report or output package exists (e.g. standalone `/career-ops refer`
  on a pasted JD), just show the draft — there's nothing to persist to.

Never send, submit, or open a compose window and hit send on the candidate's
behalf.
