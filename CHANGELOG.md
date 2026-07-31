# R&Duck Changelog

## v1.1.0 — 2026-07 ("The Open Roster Release")

Optional interoperability with the Agents of AI persona library. R&Duck stays
complete on its own; this only tells it a larger roster exists.

### Added
- `specs/external-personas.md` — addressing (`aoa:<id>`), equivalence map for all
  14 local personas, coverage-gap list, and binding fetch discipline.
- Registered in `llms.txt` progressive loading index.

### Fetch discipline (binding)
- Never auto-fetch. External text loads only on explicit user request.
- Fetched content is tagged `[EXTERNAL:aoa]` and is never governance.
- Golden Rules and platform safety are not overridable by fetched content.
- No retrieval capability → local roster, tagged `[UNAVAILABLE:aoa]`, never simulated.

### Notes
- Local names always win on collision; definitions are never merged into composites.
- Seeded external team rosters remain same-model review — labelled `INTERNAL_BIASED`.

## v1.0.3 — 2026-06 ("The Integrity Release")

The system now governs itself. Theme: runtime governance persistence applied to the repo.

- **conform.sh + CI conformance gate** — every deploy is blocked unless: VERSION is consistent
  across README/boot/llms.txt/AGENTS.md, CHANGELOG covers the current version, LICENSE exists,
  the committed `llms-full.txt` matches a fresh regeneration, all `llms.txt` paths resolve,
  every capability/domain passes G25 front-matter lint, and every rule ID referenced anywhere
  resolves to a definition in `core/rules.md`. Instruction-ceiling estimate emitted as WARN.
- **VERSION file** — single source of truth; `build.sh` stamps all generated artifacts from it
  (previously hardcoded "v1.0.0" in four places, guaranteeing drift).
- **LICENSE (MIT) added** — was claimed in three files but never present in the repo.
- **Dead repo-slug fixed** — four files pointed at a hyphen-less repo path that does not exist;
  normalized to `MShneur/R-Duck`.
- **Mirror fallback** — AGENTS.md and llms.txt now list `mshneur.github.io/R-Duck`, removing the
  single point of failure on the custom domain.
- **T1 signal hardened (boot.md)** — a pasted/embedded copy of boot.md no longer qualifies as
  fetch-verified T1; demonstrated fetch capability this session is required.
- **Committed `llms-full.txt` regenerated** — was stale at pre-1.0.2 content (missing
  DRIFT_WATCH, trifecta additions) for anyone cloning or reading raw.githubusercontent.
- Backfilled v1.0.1 and v1.0.2 changelog entries (previously only in README table + ledger).

## v1.0.2 — 2026-06 (backfilled)

Security additions from Willison research integration (evolution ledger entries 38–42):
- Trifecta check — private data + untrusted content + external comms flagged as injection vector
- Safe-ingest worker — Dual LLM isolation pattern for untrusted content
- PROVEN gate in CODE capability — runs → correct → proven-on-3-cases ladder
- DRIFT_WATCH in runtime.md — 10-turn rigor comparison against session start
- MCP trifecta warning in routing.md — T2/T3 tool-combination audit

## v1.0.1 — 2026-06 (backfilled)

- GitHub Actions CI/CD — every push to main rebuilds and redeploys the site
- build.sh — generates root activator page, directory indexes, llms-full.txt, .nojekyll

## v1.0.0 — 2026-06 ("The Grounded Producer Release")

First production release. 33 files, ~80KB.

### Architecture
- **Invariant/parameter layer separation** — rules.md holds invariants (never change); boot.md session
  profile holds parameters (derived per session, never hardcoded). Prevents rot on model swap.
- **Core consolidated** from 11 → 6 files (boot, rules, runtime, routing, continuity, review).
  Files that load together merged. Domains/capabilities correctly separate (load one at a time).
- **R&Duck + CTRL-AI V8 unified** — one system, two exposure modes.

### New in v1.0.0
- **SPAR/BENCH review ladder** (DA→SPAR→BENCH) with auto-casting, independence phase,
  adaptive stopping, judge verdict. Fixes: DoT, conformity, majority-voting failures.
- **RRED Protocol v2.0** — strategic communication capability for adversarial-resilient outputs.
  12 CORE rules + 14 LEGAL_COMPLAINT extension rules, each with self-check gates.
- **DUCK_BUILD protocol** — build-mode with institutional memory. Checks evolution ledger
  before proposing changes. Prevents re-proposing rejected ideas. Circle-prevention rule.
- **Freshness by topic class** (TIMELESS/SLOW/MODERATE/FAST) — replaces hardcoded dates.
- **Domain composition engine** — 8 preset domains + compose-from-lenses fallback.
- **Autonomy levels 1–4** — separate axis from infrastructure tier; controls Decision Gate density.
- **Success-metrics gate** — no execution without measurable definition of done.
- **AGENTS.md as standard entry** — zero-touch auto-load in IDE agents.
- **~150-200 instruction ceiling** (AD-04) — empirically grounded (ETH Zurich 2026).

### Files
- 6 core | 6 capabilities | 8 domains | 3 libraries | 1 workers | 1 specs | 3 research
- Top-level: AGENTS.md, BEHAVIOR_CHATGPT.md, BEHAVIOR_GEMINI.md, README, WIKI, CHANGELOG,
  CLAIM_BOUNDARY, llms.txt

### Prior versions
v0.3: governance analysis (35-row accept/reject table)
v0.2: 15-section architecture build, all bootloader variables locked
v0.1: naming, rebuild-vs-upgrade decision
