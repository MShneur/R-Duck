# R&Duck Review Protocol v1.0.0
# The DA / SPAR / BENCH ladder. Auto-casts reviewers by task. You never fill in roles.

## THE LADDER
```
DA     light    1 lens (devil's advocate)           one objection, one sentence
SPAR   default  2-4 auto-cast + Outlier + DA        one finding each + quick verdict
BENCH  heavy    full auto-cast panel, independent    debate + judge verdict + adaptive stop
```

## DA (Devil's Advocate)
One adversarial pass. Finds the single strongest objection.
Output: the objection + what changes if it's right.

## SPAR (Self-assembling Panel for Adversarial Review)
```yaml
CAST (automatic — you name zero roles):
  1. Read the task
  2. Select 2-4 personas from libraries/personas.md whose lexicon + anti-goals best fit
  3. ALWAYS add ONE Outlier: a persona from an UNRELATED domain, chosen to break the frame
  4. ALWAYS add Devil's Advocate posture

PASS (fast):
  Each cast persona: ONE highest-value finding (not an essay)
  Outlier: one reframe ("what if the question itself is wrong?")
  DA: the single strongest objection

VERDICT: SHIP | FIX [list] | RECAST (wrong panel) | HALT (fundamental problem)
```

## BENCH (the evolved full committee)
Fixes 3 known failure modes from multi-agent debate research:
- Degeneration-of-Thought: once confident, models fail to self-correct
- Conformity: agents converge on each other, losing independence
- Majority-voting weakness: voting fails even when individuals are correct

```yaml
CAST: auto-select by task fit from full persona + domain libraries. 5-8 lenses + Outlier.

INDEPENDENCE PHASE (kills conformity + DoT):
  Each lens forms its assessment BEFORE seeing any other lens's view.
  No lens reads another's output during this phase.
  This is the critical difference from the old committee.

DEBATE PHASE:
  All independent assessments revealed simultaneously.
  Lenses can respond to each other — challenge, support, or refine.
  Max 2 debate rounds (adaptive stop: if no new issue emerges, stop after 1).

JUDGE PHASE (not a vote):
  One synthesis pass reviews all findings and debate.
  Issues a reasoned VERDICT — not a tally.
  Verdict: SHIP | FIX [severity-ranked list] | HALT [blocking issue] | DEFER [needs external input]
  Must state: what was checked, what wasn't, and what this review structurally cannot catch.

ADAPTIVE STOPPING:
  No new issue in debate round → stop early (don't run fixed rounds).
  Hard cap: 2 debate rounds max regardless.
  This prevents compute waste after convergence.
```

## WHEN TO USE WHICH
```
Quick gut-check on a draft          → DA
Standard review before delivery     → SPAR (default)
Release gate / high-stakes decision → BENCH
Architecture / governance changes   → BENCH + external model recommended
```

## AUDIT TIER LABELING (LOCK-5)
Same-model review is ALWAYS labeled: "⚠ INTERNAL BIASED REVIEW — same model, not independent."
For high-stakes: recommend external model via routing.md offload templates.

## DRIFT SUBTYPES (checked by SPAR and BENCH)
```
MEMORY_DRIFT:      contradicts earlier decisions or Core
EPISTEMIC_DRIFT:   confidence exceeds evidence
REPAIR_DRIFT:      correction acknowledged but not implemented
GOAL_DRIFT:        solving a different problem than asked
SPECIFICITY_DRIFT: user specifics replaced with generic statements
SYCOPHANCY_DRIFT:  analysis bent toward what user wants to hear
SCOPE_DRIFT:       output grew beyond task boundary
CONFIDENCE_INFLATION: weak claims without hedging
```
