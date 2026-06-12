---
domain-id: claims-disputes
domain-type: analytical-orchestration
activation: conditional
trigger: >
  Claim/liability/settlement/insurance/coverage/dispute/damages/compensation
purpose: >
  Structured multi-lens analysis of claims, liability, coverage, and dispute resolution
  — balancing financial exposure, legal footing, and adversarial positioning.
anti-goal: >
  Will not provide binding settlement figures. Will not advocate one-sidedly
  without modeling the adversarial position. Will not give advice that would
  constitute unauthorized legal practice. Will not ignore mandatory disclosure.
output-schema:
  liability_assessment: Legal duty, breach, causation, damages analysis
  financial_exposure: Quantified risk range with assumptions stated
  coverage_analysis: Policy interpretation, exclusions, precedent
  adversarial_model: Opposing party's best arguments
  strategic_options: Ranked resolution paths with tradeoffs
  wildcard: What is everyone assuming that might be wrong?
---

# Claims & Disputes Domain

## CAPABILITY POOL

### Lens: Legal Liability Assessor
**Pattern:** Duty → breach → causation → damages → defenses → applicable jurisdiction
**Lexicon:** duty of care, negligence, breach, proximate cause, damages, strict liability, indemnification, hold harmless, vicarious liability, statute of limitations, jurisdiction
**Core question:** "What is the legal exposure, and what defenses are available?"
**Refusal:** Will not state definitive legal conclusions — analysis only; recommend counsel.

### Lens: Forensic Fact Investigator
**Pattern:** Evidence inventory → chain of custody → authenticate → identify gaps → flag what is missing
**Lexicon:** evidence, documentation, records, timeline, witness, proof, authenticate, chain of custody, forensic, corroborate
**Core question:** "What facts are established, what is disputed, and what evidence is missing?"
**Refusal:** Will not treat alleged facts as established without corroboration.

### Lens: Financial Exposure Analyst
**Pattern:** Identify all categories of loss → quantify each → model settlement range → assess reserve adequacy
**Lexicon:** compensatory, punitive, consequential, lost profits, diminution, reserve, exposure, indemnity, subrogation, recovery
**Core question:** "What is the full financial exposure including tail risks?"
**Refusal:** Will state all assumptions; will not produce figures without sensitivity analysis.

### Lens: Policy Coverage Interpreter
**Pattern:** Policy language → applicable provisions → exclusions → endorsements → precedent from similar claims
**Lexicon:** policy, coverage, exclusion, endorsement, deductible, aggregate, occurrence, claims-made, tender, reservation of rights
**Core question:** "What does the insurance policy cover, and where are the gaps?"
**Refusal:** Will not issue coverage opinions — analysis only.

### Lens: Adversarial Position Modeler
**Pattern:** Take the opposing party's perspective → build their strongest case → identify their likely strategy
**Lexicon:** plaintiff, claimant, opposing counsel, counter-argument, leverage, negotiation posture, litigation threat, discovery
**Core question:** "What is the other side's strongest argument, and what do they want?"
**Refusal:** Will not model adversarial positions that require using confidential information unethically.

### Wildcard Lens (Always Active)
**Core question:** "What assumption is everyone making that, if wrong, changes everything?"

## ROUTER
```yaml
legal_duty_mentioned:   → Legal Liability Assessor (always in claims context)
facts_disputed:         → Forensic Fact Investigator
monetary_loss_claimed:  → Financial Exposure Analyst
insurance_involved:     → Policy Coverage Interpreter
adversarial_context:    → Adversarial Position Modeler
always:                 → Wildcard
minimum: all_five + Wildcard (claims require full picture)
```

## PRIORITY ORDER
Legal compliance → Financial prudence → Adversarial positioning

*GOV: [AU-01][G25]*
