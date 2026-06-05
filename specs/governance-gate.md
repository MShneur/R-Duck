# R&Duck Governance Gate v1.0.0
# Merges: domain-template + gatekeeper-protocol + component-registry + BUILD MODE
# Everything about ADMITTING NEW COMPONENTS AND BUILDING THE SYSTEM lives here.

# ═══════════════════════════════════════════════
# PART 1: G25 GATE (validation for new components)
# ═══════════════════════════════════════════════

## REQUIRED FIELDS (all 6 — any missing → reject)
```yaml
component-id:    unique slug, no shadowing existing ids (check registry below)
component-type:  protocol | persona | layer | trait-group | domain | capability
activation:      always | conditional | manual | agent-requested
trigger:         testable (specific keywords or phase) — "when needed" → REJECT
purpose:         one sentence, non-overlapping with existing
anti-goal:       concrete refusal scenario, testable
output-schema:   ≥2 required sections
```

## VALIDATION CHECKLIST
```
[ ] UNIQUENESS    id collision with registry? → reject or merge
[ ] OVERLAP       purpose >50% overlap? → reject or merge (AG-01)
[ ] TRIGGER       testable rule? "when needed" → reject
[ ] ANTI_GOAL     produces specific testable refusal? → else reject
[ ] SCHEMA        ≥2 output sections? → else reject
[ ] FAILURE       prevents a NAMED failure mode? → else question necessity
[ ] CEILING       exceeds ~150-200 instruction limit? → justify or merge (AD-04)
```

## TEMPLATE (copy to compose new components — AG-04: shell only)
```yaml
---
component-id: | component-type: | activation: | trigger:
purpose: | anti-goal: | output-schema:
---
# [Name]
## CAPABILITY POOL / FILTER ORDER / RULES
## SELF-CHECK GATE
```

## SPLIT THRESHOLD (AG-02)
New standalone file requires: reuse by 2+ components | size >500 lines | different update cadence.
Absent → keep as section in existing file.

## EXTERNAL-FINDING GATE (LR-03)
External research never auto-merges. Must: name the gap, pass G25, logged in decisions.md.

# ═══════════════════════════════════════════════
# PART 2: COMPONENT REGISTRY
# ═══════════════════════════════════════════════

```
CORE (6 files):
  boot | rules | runtime | routing | continuity | review

CAPABILITIES (6 files):
  write | research | audit | strategize | code | rred

DOMAINS (8 files — presets over routing.md compose engine):
  research | claims-disputes | crisis-response | public-communication
  legal-strategy | technical-analysis | business-strategy | creative-production

LIBRARIES (3): personas | audiences | registers
WORKERS (1):   worker-templates (7 types)
SPECS (1):     governance-gate (this file)
RESEARCH (3):  evolution-ledger | decisions | feedback
```

Before admitting any new component: confirm id + purpose don't collide with the above.

# ═══════════════════════════════════════════════
# PART 3: DUCK_BUILD (Build Mode Protocol)
# ═══════════════════════════════════════════════

## PURPOSE
When developing R&Duck itself (not running a project), DUCK_BUILD activates institutional
memory so builds don't go in circles. It's a super-handoff between development sessions:
before proposing anything new, it checks what was tried, why it failed, and whether the
revival conditions have been met.

## ACTIVATION
```
DUCK_BUILD           → enter build mode
DUCK_BUILD_HANDOFF   → produce a build-session handoff for the next developer/session
```

## BUILD MODE RULES
```yaml
ON_ACTIVATE:
  1. Load research/evolution-ledger.md (all prior decisions)
  2. Load research/decisions.md (detailed logs)
  3. State: "Build mode active. [N] prior decisions loaded. What are we building?"

BEFORE_PROPOSING_ANY_CHANGE:
  1. Search ledger for prior attempts on the same topic
  2. If found with REJECT: surface the rejection reason + revival condition
     "This was tried before (entry [N]). It was rejected because [reason].
      Revival condition: [condition]. Has that condition been met?"
  3. If found with ACCEPT: surface what already exists — don't rebuild it
  4. If not found: proceed, but log the new decision

ON_EVERY_BUILD_DECISION:
  Log to evolution-ledger.md:
    entry_N: { date, type, decision: accept|adapt|reject|defer,
               change, source, rationale, reject_reason?, revival_condition?, review_trigger? }

ON_SESSION_END (DUCK_BUILD_HANDOFF):
  Produce a build handoff containing:
    - What was built this session (file list + summary)
    - What was decided (accept/reject with rationale)
    - What is pending (unfinished items)
    - What was tried and failed (with failure reasons — prevents circles)
    - Recommended next steps (prioritized)
    - Any corrections to the developer's approach (PSCM-style)
```

## WHY THIS EXISTS
Without build memory, every new session re-proposes ideas that were already tried and rejected,
re-merges things that didn't work, and rediscovers failure modes the hard way. This protocol
is institutional memory for the development process itself. The evolution ledger is the data;
DUCK_BUILD is the protocol that queries it before acting.

## THE CIRCLE-PREVENTION RULE
```
If a proposal matches a prior REJECT entry AND the revival condition has NOT been met:
  → Surface the prior decision
  → State: "This was rejected because [X]. Revival condition [Y] hasn't been met."
  → Require explicit acknowledgment before proceeding anyway
  → If proceeding: log as "revival attempted — [reason for retry]"

If revival condition HAS been met (new evidence, new capability, changed context):
  → Surface the prior decision
  → State: "This was rejected because [X], but the revival condition [Y] appears met because [Z]."
  → Proceed with explicit reference to what changed
  → Log as "revival — condition met: [evidence]"
```
