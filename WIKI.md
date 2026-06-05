# R&Duck Wiki — Build Notes, Architecture Decisions, and Contributor Guide

## For New Contributors

R&Duck has build memory. Before proposing any change, run `DUCK_BUILD` — it loads the
evolution ledger and surfaces what was already tried, what failed, and why. This prevents
the most common failure mode: re-proposing ideas that were rejected for good reasons.

If you think a rejected idea should be revived, that's fine — but state what changed
since the rejection. The ledger tracks revival conditions for exactly this purpose.

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
revealed this — see ledger entries 25-27.

### File Consolidation Principle
A file earns separateness if it's loaded independently of its neighbors.
Files that always load together are one load-unit — merge them.
Domains and capabilities are correctly separate (load one at a time).
Core was 11 files for 5 concerns — merged to 6. See ledger entry 32.

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

### What Failed (and is encoded in the system)
- **Degeneration-of-Thought:** once confident, models fail to self-correct → BENCH uses
  independence phase (each lens forms view before seeing others).
- **Conformity-driven failures:** agents converge → SPAR/BENCH mandatory Outlier lens.
- **Fixed-round committees:** waste compute after convergence → BENCH uses adaptive stopping.
- **Over-instruction:** context files can make agents worse → AD-04 ceiling (≤150-200 instructions).
- **Hardcoded parameters:** rot on model swap → layer separation (invariants vs parameters).
- **Same-model audit theater:** labels self-review as independent → LOCK-5 mandatory labeling.

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

## How to Add a New Component

```
1. Run DUCK_BUILD (loads ledger, checks for prior attempts)
2. Draft the component with all 6 G25 fields
3. Run governance-gate.md validation checklist
4. If it passes: add to component registry, log decision
5. If rejected: log with reject_reason + revival_condition
6. Run SPAR on the new component before merging
```

## How to Improve an Existing File

```
1. Run DUCK_BUILD
2. State what's wrong and what the fix is
3. BENCH review the proposed change
4. Check: does this change violate any invariant in rules.md?
5. Check: does this introduce a new hardcoded parameter? (should go to session profile)
6. Update evolution-ledger.md with the decision
7. DUCK_BUILD_HANDOFF before ending the session
```

## Session Handoff for Builders

Every build session should end with `DUCK_BUILD_HANDOFF` which produces:
- What was built (file list + summary)
- What was decided (accept/reject + rationale)
- What is pending
- What was tried and failed (with reasons — prevents circles)
- Recommended next steps

This is institutional memory. Without it, the next session re-proposes rejected ideas,
re-discovers failure modes, and repeats the same corrections.

## Research Pipeline Status

R&Duck v2.0 research pipeline (7 components) is specified but not yet built:
watch-list agent, ingest gateway, corpus store, decision ledger, analysis engine,
diff-testing gate, self-audit module. PTPF v1.0 scores: Σ28% Δ−62% — acknowledged
as insufficient for governance-grade research. Target: Σ≥75%.

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

## Version History

See CHANGELOG.md for full release notes.
Current: v1.0.0 ("The Grounded Producer Release")
