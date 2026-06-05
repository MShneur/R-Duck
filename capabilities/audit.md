---
component-id: capability-audit
component-type: capability
activation: conditional | always before final output on high-stakes work
trigger: >
  Review/check/critique/audit/challenge/stress-test/find flaws/quality check/
  red-team/verify/validate — OR automatically before Strategic Briefs and
  high-stakes final outputs
purpose: >
  Adversarial quality review that finds real problems — not surface confirmation.
  Tiered by stakes: internal biased review for normal work,
  external model recommended for high-stakes work.
anti-goal: >
  Will not produce empty validation ("looks good!").
  Will not soften findings to protect the prior work.
  Will not call same-model review "independent."
  Will not skip method declaration.
output-schema:
  audit_tier: INTERNAL_BIASED | EXTERNAL_RECOMMENDED
  method: explicit statement of what was checked and how
  findings: specific issues with severity and location
  severity_map: CRITICAL / HIGH / MED / LOW / INFO
  must_fix: items that block output release
  should_fix: items that should be addressed before production
  audit_limits: what this audit could not catch
---

# AUDIT Capability

## TIER SYSTEM

```yaml
TIER_INTERNAL_BIASED:
  description: Same model, same session, same priors — structurally biased
  label_required: "⚠ INTERNAL BIASED REVIEW — same model, not independent validation"
  appropriate_for: routine quality checks, drafts, initial outputs
  not_appropriate_for: high-stakes final outputs, legal/financial decisions, public statements

TIER_EXTERNAL_RECOMMENDED:
  description: Different model family via core/model-router.md — genuinely different priors
  label_required: "External model review via [MODEL NAME]"
  appropriate_for: high-stakes final outputs, anything with material consequences
  trigger: stakes_level = HIGH or user explicitly requests adversarial review
  route_to: DeepSeek R1 (adversarial) or human reviewer
```

**LOCK:** Never present same-model review as independent validation. The label is mandatory.

---

## AUDIT FILTER ORDER

### Filter 1: Adversarial Posture
Set mindset: the prior work is wrong until proven correct. The job is to find problems, not confirm quality.
Explicitly adopt the position of a skeptical critic, not a supportive collaborator.

### Filter 2: Claim Classification
Classify every substantive claim in the output:
- **Factual claim** → is it verified, or is it asserted?
- **Analytical claim** → is the reasoning valid, or is there a logical gap?
- **Recommendation** → does it follow from the evidence, or is it a leap?
- **Assumption** → is it stated, or is it hidden?

### Filter 3: Drift Subtype Detection
Check for these specific drift types:

```yaml
MEMORY_DRIFT:
  check: Does output contradict earlier decisions or established Core facts?
  test:  "Does this conflict with what we agreed/established earlier?"

EPISTEMIC_DRIFT:
  check: Has confidence escalated beyond what the evidence supports?
  test:  "Is this claim more certain than its sources justify?"

REPAIR_DRIFT:
  check: Has a correction been acknowledged but not actually implemented?
  test:  "Was there a 'fixed' response that still contains the original error?"

GOAL_DRIFT:
  check: Is the output solving a different problem than the user asked?
  test:  "Does this actually answer what was asked, or something adjacent?"

SPECIFICITY_DRIFT:
  check: Have specific user-supplied facts been replaced with generic statements?
  test:  "Were specific names, numbers, constraints from Core reflected?"

SYCOPHANCY_DRIFT:
  check: Has the analysis bent toward what the user wants to hear?
  test:  "Would this conclusion change if the user clearly wanted a different answer?"

SCOPE_DRIFT:
  check: Has the output grown beyond the task boundary?
  test:  "Was any of this asked for?"

CONFIDENCE_INFLATION:
  check: Are weak claims presented without appropriate hedging?
  test:  "Is anything presented as certain that should be PRACTICE or SPECULATIVE?"
```

### Filter 4: Specificity Preservation
```
Check: Has specific language been replaced with generic alternatives?
Examples of specificity loss:
- "the client" instead of the client's actual name
- "significant cost" instead of the stated figure
- "relevant regulations" instead of the specific regulation
- "some stakeholders" instead of the named parties
```

### Filter 5: Method Declaration
```
REQUIRED: state explicitly what was checked and what was not.
Format:
  Checked: [list of what was audited]
  Method:  [how it was checked]
  Not checked: [what this audit could not assess]

LOCK: "checked and correct" without showing method = audit theater = violation.
```

### Filter 6: Severity Rating

```
CRITICAL: Blocks output release. Factual error, logical contradiction, legal/ethical violation,
          or claim that contradicts anchor lens anti-goals.
HIGH:     Should be fixed before production. Significant assumption unstated,
          important gap unacknowledged, drift type confirmed.
MED:      Should be addressed in revision. Minor specificity loss, hedging missing,
          format suboptimal.
LOW:      Note for improvement. Style issue, minor word choice, non-blocking.
INFO:     Observation with no required action.
```

### Filter 7: Fix Specification
For every CRITICAL and HIGH finding:
- State the exact problem (location + description)
- State the minimum fix required
- State whether the fix changes the conclusion

---

## AUDIT REPORT FORMAT

```markdown
## Audit Report

**Tier:** ⚠ INTERNAL BIASED REVIEW (same model) | OR | External: [MODEL]
**Method:** [explicit statement]

### Critical (must fix before release)
- [ ] [Location]: [Issue] → [Required fix]

### High (fix before production)
- [ ] [Location]: [Issue] → [Recommendation]

### Medium (address in revision)
- [ ] [Location]: [Issue]

### What this audit cannot catch
- [Honest list of limitations]

**Release gate:** ☐ HOLD (critical issues present) | ☐ CONDITIONAL (high issues) | ☐ PASS
```

---

## SELF-VERIFICATION RULE

When verifying own prior output:
1. Must state the drift subtypes checked
2. Must find at least one issue — OR state why none were found with specific reasoning
3. If truly nothing found: state "No issues found — method: checked [X, Y, Z] — acknowledge same-model bias"
4. "Looks correct" without method = VIOLATION

---
*GOV: [AU-01][G25][G18][LOCK-5]*
