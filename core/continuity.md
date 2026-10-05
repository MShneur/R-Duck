# R&Duck Continuity Protocol v1.0.0
# Merges: handoff + corrections (PSCM)
# Everything about SESSION TRANSITIONS AND CORRECTION PERSISTENCE lives here.

# ═══════════════════════════════════════════════
# PART 0: STITCH GATE — CONTINUITY COST CONTROL
# ═══════════════════════════════════════════════

Continuity is **always considered, not always loaded**. The existence of a project or handoff does not justify reading it.

```text
S0 BYPASS     self-contained/simple; prior project state cannot change answer -> zero continuity reads
S1 PIN        one exact Core fact/rule/decision needed -> one exact pointer or current Core field
S2 RECALL     continue/resume/already-tried/what-did-we-decide/existing mechanism -> current authority + relevant Stitchboard
S3 RECONCILE  conflicting sources, multiple workers/lanes, owner/branch changes, migrations, architecture change -> bounded full reconciliation
```

Rules:
- Escalate only when the cheaper level cannot answer correctly.
- S0 never reads historical handoffs, ledgers, memory services, or repository history for reassurance.
- S1 uses Core/current exact pointers; no broad retrieval.
- S2 loads only the relevant checklist slice and source pointers.
- S3 performs the full authority/ownership/supersession pass.
- User correction to project semantics escalates to at least S2 and must be persisted.

## STITCHBOARD — high-churn project checklist

For projects with repeated experiments, many lanes, or recurring hypotheses, keep this section in the **existing canonical Core/handoff/ledger surface**:

```yaml
STITCHBOARD:
  KNOWN:          # verified current facts/invariants + source pointer
  TRIED_WORKED:   # attempt + what it proved
  TRIED_FAILED:   # attempt + exact failure + revival condition
  NOT_TRIED:      # plausible paths intentionally not yet tested
  DEFERRED:       # valid but postponed + reason
  HYPOTHESES:     # active, explicitly unconfirmed
  NEXT:           # one bounded next action
```

Entries are one line plus source pointer. Evidence stays where it already lives. A failed path is never erased; it can return only if its revival condition changes.

# ═══════════════════════════════════════════════
# PART 1: HANDOFF
# ═══════════════════════════════════════════════

## WHEN TO HAND OFF
context >75% | session near expiry | clean task isolation | worker dispatch | user request
Migration ≥3: ⚠ recommend user re-confirm top 3 Core specifics.

## HANDOFF FORMAT (dual: structured + verbatim)
```yaml
---HANDOFF---
version: 1.0 | handoff_number: N | timestamp: ISO8601
# STRUCTURED
project_id | goal | phase | active_domains | anchor_lenses | autonomy_level
key_specifics: [...] | obligations: [...] | constraints: [...] | pending: [...]
confidence_at_handoff | tier | freshness_policy
# RAW ANCHORS (preserve verbatim — NEVER summarize)
verbatim_goal: "[exact user words]"
verbatim_decisions: "[exact words at key decisions]"
verbatim_constraints: "[exact hard limits stated]"
critical_context: "[nuance a summary would flatten]"
# RESUMPTION
resume: "Re-establish session profile (detect host — don't assume). Re-anchor Core.
         Continue Phase [X]. First action: [Y]."
---END HANDOFF---
```

## LOAD SEQUENCE
```
0. Run STITCH GATE. S0 stops here; S1 loads exact Core only; S2/S3 continue below.
1. Establish session profile (boot.md — detect host/cutoff — NEVER assume)
2. Read structured fields → Core
3. Read raw anchors — preserve verbatim
4. Declare: "Resuming [project_id] | Phase [X] | Tier [T] | [N] migrations"
5. If ≥3 migrations → confirm top 3 specifics with user
```

## SUMMARY PACKET (Agent → Prime Agent)
```yaml
---SUMMARY PACKET---
agent_task | agent_domain | confidence
output: [full deliverable]
self_check: { completed: YES|NO|PARTIAL, findings, gaps, assumptions, recommended_next }
evidence_quality: [per-claim tags]
---END PACKET---
```
PARTIAL/DEGRADED packets do NOT auto-enter Core. Prime validates first.

## RETRIEVAL HIERARCHY
L1 user constraints (always win) → L2 Core specifics → L3 active domain →
L4 anchor anti-goals → L5 pre-training (PRACTICE) → L6 inferred (SPECULATIVE) → L7 prior Handoff (stale risk)

## CONTRADICTION LOG
```yaml
when info conflicts: { turn, source_a + claim_a, source_b + claim_b,
  resolution: PENDING | USER_CLARIFIED | ANCHOR_GOVERNS | LATEST_WINS }
Surface active contradictions at the next Decision Gate.
```

# ═══════════════════════════════════════════════
# PART 2: PSCM (Self-Correction Lens)
# ═══════════════════════════════════════════════

## TRIGGERS (checkpoints — never every turn)
User asks for reflection | session end / Handoff | correction density ≥3 same type | long session

## COMMANDS
DUCK_REFLECT → run extraction now | DUCK_RELOAD → load latest feedback file at session start

## COMMITTEE (on feedback artifact only)
```
PRODUCER:  What experience does user want?
GROUNDING: Where did system overclaim or hide uncertainty?
DRIFT:     Where was specificity lost? Corrections treated as one-time patches?
UX:        Tone, brevity, format, question preferences
RED_TEAM:  Challenge weak candidates — exclude temporary/emotional/project-local items
```

## FOUR BUCKETS
```yaml
B1_stable_preferences:     tone | verbosity | quality_bar | workflow | routing      → LONG-TERM MEMORY
B2_persistent_corrections: patterns AI must stop repeating                          → LONG-TERM MEMORY
B3_project_anchors:        facts for this project only                              → Core/Handoff ONLY
B4_failure_ledger:         what_happened | root_cause | fix                         → SESSION ONLY
Uncertain if durable → exclude from long-term. One-off comments excluded unless repeated 3×.
```

## RELOAD SEQUENCE
Load feedback → apply B1 as constraints → apply B2 as anti-patterns → if same project load B3 →
review B4 → declare "[N] preferences, [N] corrections active."

## HONEST LIMITS
Same-model correction review is biased. Reload not automatic on all platforms (T0/T1 manual).
Governance biases behavior — does not guarantee enforcement.
