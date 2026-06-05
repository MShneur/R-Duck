# R&Duck Changelog

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
