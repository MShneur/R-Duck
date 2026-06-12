# R&Duck Wiki — Build Notes, Architecture Decisions, and Contributor Guide

**Version:** 1.0.3 | [Changelog](CHANGELOG.md) | [Claim Boundary](CLAIM_BOUNDARY.md)

---

## For New Contributors

R&Duck has build memory. Before proposing any change, run `DUCK_BUILD` — it loads the
evolution ledger and surfaces what was already tried, what failed, and why. This prevents
the most common failure mode: re-proposing ideas that were rejected for good reasons.

If you think a rejected idea should be revived, that's fine — but state what changed
since the rejection. The ledger tracks revival conditions for exactly this purpose.

---

## Architecture Summary

R&Duck is ONE system with two modes:
- **Producer mode:** you describe a project; Prime Agent runs it
- **Framework mode (CTRL-AI):** you steer domains and invoke commands directly

Same files underneath. Different surface.

### Layer Separation (the keystone decision)
```
INVARIANTS (core/rules.md): axioms, Golden Rules, locks. Never change per project.
PARAMETERS (core/boot.md session profile): host, cutoff, tier, autonomy, domains, cadence.
  Derived at activation. Never hardcoded. This is what makes R&Duck cross-AI portable.
```
This split exists because hardcoding parameters (like a knowledge cutoff date) makes the
system lie about itself the moment you swap models. The date bug was the first crack that
revealed this — see ledger entries 25–27.

### File Consolidation Principle
A file earns separateness if it's loaded independently of its neighbors.
Files that always load together are one load-unit — merge them.
Domains and capabilities are correctly separate (load one at a time).
Core was 11 files for 5 concerns — merged to 6. See ledger entry 32.

### Governance Self-Application (v1.0.3)
R&Duck's own governance rules now apply to the repo itself. `conform.sh` mechanically
enforces the same principles R&Duck enforces at runtime:
- Version consistency (AU-01) across all surfaces
- Single policy source (AG-03)
- G25 front-matter on every component
- Rule-ID resolution (no orphaned references)
- Instruction-ceiling awareness (AD-04)
- No dead links or stale artifacts

The gate runs in CI before every deploy. If it fails, the deploy is blocked.

---

## Key Research Findings (with sources)

### What Works
- **AGENTS.md standard:** 60K+ repos; auto-discovered by Claude Code, Cursor, Codex, Copilot.
  R&Duck ships AGENTS.md as the entry file for zero-touch IDE activation.
- **Progressive loading:** load only what the task needs. Validated by ETH Zurich 2026 study
  showing over-instruction hurts: +22% reasoning tokens, no improvement in outcomes.
- **Heterogeneous multi-agent review:** diverse specialized reviewers beat identical agents
  with majority voting (NeurIPS 2025, multiple replications).
- **Judge > vote:** a reasoned synthesis verdict beats majority-voting aggregation even when
  individual agents are correct (adaptive stability detection, NeurIPS 2025).
- **Mechanical enforcement > manual checklists:** v1.0.3 Fable-5 review found 7 undiscovered
  G25 violations (trigger field mismatch) that a manual pass missed. The conformance gate
  caught them on first run. VERIFIED[conform.sh output, 2026-06-11]

### What Failed (and is encoded in the system)
- **Degeneration-of-Thought:** once confident, models fail to self-correct → BENCH uses
  independence phase (each lens forms view before seeing others).
- **Conformity-driven failures:** agents converge → SPAR/BENCH mandatory Outlier lens.
- **Fixed-round committees:** waste compute after convergence → BENCH uses adaptive stopping.
- **Over-instruction:** context files can make agents worse → AD-04 ceiling (≤150-200 instructions).
- **Hardcoded parameters:** rot on model swap → layer separation (invariants vs parameters).
- **Same-model audit theater:** labels self-review as independent → LOCK-5 mandatory labeling.
- **Manual conformance:** checklists drift silently → conform.sh replaces all manual checks.

---

## What Was Tried and Rejected (with revival conditions)

| Proposal | Rejected Because | Revival Condition |
|----------|-----------------|-------------------|
| Multiple "master" agents | Authority ambiguity; coordination failure | N/A — structural |
| Separate GPTs per domain | Reversed in same session — one coordinator is correct | N/A |
| Lyra personality/identity claims | "Zero drift" exceeds transformer capability | Mechanistic interpretability proving behavioral guarantees |
| Domain-per-file explosion (early V8) | Replaced by domain-type with internal lenses | N/A |
| Generic "helpful researcher" persona | No lexicon, no anti-goal, no schema — fails G25 | Passes G25 gate |
| "Two builds" (source vs chat) | User correctly identified as unnecessary duplication | Never — one set of files |
| 11-file core/ directory | Drift from IDE-agent architecture; 5 concerns wearing 11 filenames | Never — merged to 6 |
| Manual SUP_CONFORM checklist | Caught 0/7 G25 trigger-field defects in v1.0.2 → replaced by conform.sh | Never — mechanical only |

---

## How to Add a New Component

```
1. Run DUCK_BUILD (loads ledger, checks for prior attempts)
2. Draft the component with all 6 G25 fields (id, type, activation, trigger, purpose, anti-goal, output-schema)
3. Run governance-gate.md validation checklist
4. Run conform.sh — it will lint G25 front-matter and check rule-ID resolution
5. If it passes: add to component registry, log decision
6. If rejected: log with reject_reason + revival_condition
7. Run SPAR on the new component before merging
```

## How to Improve an Existing File

```
1. Run DUCK_BUILD
2. State what's wrong and what the fix is
3. BENCH review the proposed change
4. Check: does this change violate any invariant in rules.md?
5. Check: does this introduce a new hardcoded parameter? (should go to session profile)
6. Update evolution-ledger.md with the decision
7. Update VERSION and CHANGELOG.md
8. Run conform.sh — must pass before committing
9. DUCK_BUILD_HANDOFF before ending the session
```

---

## Governance Self-Check: `conform.sh`

Run locally anytime: `bash conform.sh`

| Check | What it enforces | Rule |
|-------|-----------------|------|
| C1 | VERSION file present and valid semver | AU-01 |
| C2 | Version consistent across README, boot.md, llms.txt, AGENTS.md | AU-01 |
| C3 | CHANGELOG covers current version | AU-02 |
| C4 | LICENSE file present and MIT | — |
| C5 | No dead repo-slug references | AG-03 |
| C6 | Committed llms-full.txt matches fresh regeneration | AU-02 |
| C7 | All llms.txt paths resolve to real files | AU-01 |
| C8 | All 14 capabilities + domains pass G25 front-matter lint | G25 |
| C9 | Every referenced rule ID resolves to core/rules.md | AG-03 |
| C10 | Instruction-ceiling estimate emitted (WARN only) | AD-04 |

Exit 0 = SHIP. Exit 1 = blocked. CI runs this before every deploy.

---

## Session Handoff for Builders

Every build session should end with `DUCK_BUILD_HANDOFF` which produces:
- What was built (file list + summary)
- What was decided (accept/reject + rationale)
- What is pending
- What was tried and failed (with reasons — prevents circles)
- Recommended next steps

This is institutional memory. Without it, the next session re-proposes rejected ideas,
re-discovers failure modes, and repeats the same corrections.

---

## Research Pipeline Status

R&Duck v2.0 research pipeline (7 components) is specified but not yet built:
watch-list agent, ingest gateway, corpus store, decision ledger, analysis engine,
diff-testing gate, self-audit module. PTPF v1.0 scores: Σ28% Δ−62% — acknowledged
as insufficient for governance-grade research. Target: Σ≥75%.

**Next major project (P2 — Proving Ground):** an eval harness to measure actual vs
claimed drift reduction. Probes: sycophancy bait, stale-fact bait, specificity-drift,
fabricated-citation, trifecta/injection, verification-theater. Pass/fail rubrics against
baseline (no R&Duck) and activated. Publishes a scorecard. Ledger gap acknowledged
at entry ~Cognee/Mem0.

---

## Cross-AI Testing Status

| Platform | Tested | Status |
|----------|--------|--------|
| Claude (Projects) | Yes | Primary development platform |
| Claude Code | Partial | AGENTS.md auto-load confirmed |
| ChatGPT (Custom GPT) | Planned | BEHAVIOR_CHATGPT.md fits limit |
| Gemini (Gem) | Planned | BEHAVIOR_GEMINI.md ready |
| Cursor / Codex | Planned | AGENTS.md compatible |
| DeepSeek | Used for research | Not tested as host |
| Grok | Used for research | Not tested as host |

---

## Prompt Injection vs. Jailbreaking (Important Distinction)

These are different threats with different defenses:

**Prompt Injection** (coined by Simon Willison, 2022): malicious instructions arrive through
content the model legitimately processes — emails, documents, web pages, MCP tool outputs.
The model follows attacker instructions because it can't reliably distinguish instruction
sources. Defense is **architectural**: isolation, Dual LLM pattern, trifecta check, safe-ingest workers.

**Jailbreaking**: directly tricking the model into bypassing its own safety guidelines.
Defense is **model-level**: training, RLHF, system prompt hardening.

R&Duck primarily addresses prompt injection risk through architectural controls:
- LOCK-6 / Rule of Two (prevent the lethal trifecta combination)
- Safe-ingest workers (isolated, read-only processing of external content)
- Trifecta check (explicit gate before ingesting untrusted content)
- MCP trifecta warning (tool combination audit at T2/T3)

Confusing these two threats leads to ignoring prompt injection as "not our problem" —
which is exactly how most production exploits succeed.

---

## Open Proposals (not yet built)

| ID | Proposal | Status | Ledger ref |
|----|----------|--------|-----------|
| P3 | INTEROP.md — CTRL-AI ↔ R&Duck coexistence contract (load order, function ownership, command deduplication) | Pending | — |
| P2 | Proving Ground — eval harness, sycophancy/drift probes, published scorecard | Pending | entry ~Cognee benchmark gap |
| P4 | Supply-chain honesty — SHA-256 of llms-full.txt in release notes; boot version+hash check | Pending | — |
| P5 | Field-report loop — GitHub issue template → ledger ingest | Pending | — |

---

## Version History

See [CHANGELOG.md](CHANGELOG.md) for full release notes.

| Version | Theme |
|---------|-------|
| **1.0.3** | The Integrity Release — governance self-applied to the repo |
| **1.0.2** | Security — Willison trifecta, DRIFT_WATCH, PROVEN gate |
| **1.0.1** | CI/CD — auto-deploy on every push |
| **1.0.0** | The Grounded Producer Release — first full system |
