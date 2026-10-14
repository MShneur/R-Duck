# R&Duck Continuity Protocol v1.7.0
# Merges: handoff + corrections (PSCM)
# Everything about SESSION TRANSITIONS AND CORRECTION PERSISTENCE lives here.

# ═══════════════════════════════════════════════
# PART 1: HANDOFF
# ═══════════════════════════════════════════════

## WHEN TO HAND OFF
actual fresh-chat/agent transfer | worker dispatch | unavoidable session expiry | user request

Context pressure alone prepares continuity memory internally; it does not dump a handoff into chat.
Routine task completion and clean task isolation are not handoffs.
Migration ≥3: recommend user re-confirm top 3 Core specifics only when a real transfer occurs.

## HANDOFF STORAGE / OPERATOR SURFACE

Prefer the canonical durable continuity store (including Backstitch when available).
Keep the machine artifact out of ordinary operator chat.

- Routine status uses `Fixed | Broken | Recommendation` from core/voice.md.
- Print the full handoff only when the user asks for it or manual transfer requires a copy.
- Do not add routing, model, progress, tool logs, or completed-history narration unless they are critical for resumption.

## HANDOFF FORMAT (dual: structured + verbatim)
```yaml
---HANDOFF---
version: 1.0 | handoff_number: N | timestamp: ISO8601
# STRUCTURED
project_id | goal | phase | active_domains | anchor_lenses | autonomy_level
key_specifics: [...] | obligations: [...] | constraints: [...] | pending: [...]
confidence_at_handoff | tier | freshness_policy
# AUTHORITY POINTERS
canonical_state_sources: [...]   # repo/ledger/runtime/facts files to verify on resume
last_verified_refs: [...]        # commit/job/query/runtime refs, not prose
# RAW ANCHORS (preserve verbatim — NEVER summarize)
verbatim_goal: "[exact user words]"
verbatim_decisions: "[exact words at key decisions]"
verbatim_constraints: "[exact hard limits stated]"
critical_context: "[nuance a summary would flatten]"
# RESUMPTION
resume: "Re-establish session profile (detect host — don't assume). Reconcile the
         canonical facts sources against this handoff. Continue Phase [X] only from
         verified current facts. First action: [Y]."
---END HANDOFF---
```

## RESUME RECONCILIATION — REQUIRED
A handoff is a locator and compression artifact, not the project database.
Before acting in a fresh session:

1. Resolve `canonical_state_sources` from the handoff/project entrypoint.
2. fetch the current repo/runtime/ledger/facts surface directly.
3. Compare handoff claims against current evidence.
4. Classify relevant work: `BUILT | MISSING | BROKEN | OBSOLETE | UNKNOWN`.
5. Preserve current accepted decisions; do not rebuild `BUILT` work.
6. Surface contradictions explicitly. Current verified facts take priority over stale prose unless
   the human deliberately changes the decision.
7. Only then choose the next action.

If the canonical source cannot be fetched, output DEGRADED and halt short of facts-changing
work that depends on it. Do not substitute chat reconstruction for missing authority.

## LOAD SEQUENCE
```
1. Establish session profile (boot.md — detect host/cutoff — NEVER assume)
2. Resolve and fetch canonical facts sources named by the project/handoff
3. Reconcile current facts vs handoff; classify BUILT/MISSING/BROKEN/OBSOLETE/UNKNOWN
4. fetch structured fields → Core, downgrading anything contradicted by live evidence
5. fetch raw anchors — preserve verbatim
6. Keep the resume receipt in canonical continuity; surface only a material conflict or gate.
7. Ask for reconfirmation only when missing or conflicting specifics materially affect execution.
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
L1 explicit current user constraints/decisions → L2 current verified canonical facts
(repo/runtime/ledger/facts) → L3 Core specifics that do not conflict with L2 →
L4 active domain → L5 anchor anti-goals → L6 pre-training (PRACTICE) →
L7 inferred (SPECULATIVE) → L8 prior Handoff/chat summary (stale risk)

A newer paragraph does not outrank verified executable evidence merely because it is newer.
If a human intentionally supersedes the current system, write that decision to the canonical
facts surface before treating it as durable project truth.

## CONTRADICTION LOG
```yaml
when info conflicts: { turn, source_a + claim_a, source_b + claim_b,
  resolution: PENDING | USER_CLARIFIED | ANCHOR_GOVERNS | LATEST_WINS | LIVE_STATE_WINS }
```
Surface active contradictions at the next Decision Gate.

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
