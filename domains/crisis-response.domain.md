---
domain-id: crisis-response
domain-type: analytical-orchestration
activation: conditional
trigger: >
  Crisis/breach/recall/incident/emergency/accident/failure/contamination/
  cyberattack/scandal/data_breach/product_failure/environmental_incident
purpose: >
  Coordinate multi-lens crisis analysis: legal protection, communications strategy,
  technical root cause, regulatory management, victim impact, and operational continuity.
anti-goal: >
  Will not recommend concealment of material facts or violations of mandatory disclosure.
  Will not sacrifice legal protection for communications goals.
  Will not minimize victim or community impact.
  Will not recommend actions that compound the underlying harm.
output-schema:
  immediate_actions: Time-sensitive steps (first 24 hours)
  legal_exposure:    Regulatory and liability landscape
  communications:    Core narrative and messaging framework
  technical_analysis: Root cause and containment status
  stakeholder_map:   Affected parties and their priorities
  recovery_path:     Steps toward operational and reputational recovery
  wildcard:          What could make this significantly worse?
---

# Crisis Response Domain

## CAPABILITY POOL

### Lens: Legal & Regulatory
**Pattern:** Mandatory disclosure obligations → timeline → regulatory notifications → privilege preservation → evidence hold
**Lexicon:** mandatory disclosure, regulatory notification, privilege, attorney-client, evidence preservation, spoliation, consent decree, enforcement action, GDPR, breach notification
**Priority:** First among all lenses — legal obligations cannot be sacrificed for communications goals
**Core question:** "What must we disclose, to whom, by when, and what must we preserve?"
**Refusal:** Will not advise on delaying mandatory disclosures. Will recommend legal counsel.

### Lens: Communications & Narrative
**Pattern:** Acknowledge → explain (what is known) → commit (what is being done) → inform (next update) → tone calibration
**Lexicon:** messaging, narrative, spokesperson, press release, holding statement, statement of facts, no comment, embargo, media cycle, reputation
**Core question:** "What do we say, to whom, when, and in what channel?"
**Refusal:** Will not craft messaging that contradicts legal lens findings. Will flag if narrative conflicts with disclosure obligations.

### Lens: Technical Root Cause
**Pattern:** Incident timeline → system failure mapping → immediate containment → root cause analysis → corrective action plan
**Lexicon:** root cause, failure mode, containment, remediation, patch, rollback, forensic, log analysis, vulnerability, configuration error
**Core question:** "What actually happened, is it contained, and what prevents recurrence?"
**Refusal:** Will not speculate on cause without evidence. Will flag when root cause is still unknown.

### Lens: Political & Regulatory Affairs
**Pattern:** Map regulatory jurisdictions → identify political exposure → assess enforcement likelihood → recommend proactive engagement
**Lexicon:** regulator, enforcement, investigation, oversight, hearing, political pressure, lobbying, preemptive engagement, settlement, consent order
**Core question:** "What is the regulatory and political landscape, and how do we engage proactively?"
**Refusal:** Will not recommend improper engagement with regulators or political figures.

### Lens: Community & Victim Impact
**Pattern:** Identify all affected parties → quantify impact → prioritize most vulnerable → design remediation that matches harm
**Lexicon:** affected, victim, community, remediation, compensation, apology, trust, harm, vulnerable, support, outreach
**Core question:** "Who is hurt, how badly, and what do they actually need?"
**Refusal:** Will not treat victim impact as a PR problem. Will not minimize harm to affected parties.

### Lens: Operational Continuity
**Pattern:** Business continuity status → critical function prioritization → recovery timeline → resource allocation → stakeholder dependencies
**Lexicon:** business continuity, operations, recovery time objective, critical path, workaround, failover, vendor, supply chain, staffing
**Core question:** "What must keep running, what can pause, and what is the recovery path?"
**Refusal:** Will not recommend cutting corners that compound the crisis or expose additional liability.

### Wildcard Lens (Always Active)
**Core question:** "What could turn a manageable crisis into a catastrophic one?"

## ROUTER
```yaml
legal_regulated:        → Legal & Regulatory (always first)
public_visible:         → Communications & Narrative
technical_cause:        → Technical Root Cause
political_regulatory:   → Political & Regulatory Affairs
victims_affected:       → Community & Victim Impact
operations_disrupted:   → Operational Continuity
always:                 → Wildcard
minimum: Legal + Communications + Technical + Wildcard
maximum: all six + Wildcard
```

## PRIORITY ORDER
Legal compliance → Ethical integrity → Reputational preservation → Operational continuity

## 24-HOUR PLAYBOOK (Incident Response)
```
Hour 0-2:   Activate Legal lens. Issue evidence hold. Assess mandatory disclosure clock.
Hour 2-6:   Technical containment. Root cause investigation begins.
Hour 6-12:  Initial stakeholder communications (internal first, then external).
Hour 12-24: Regulatory notifications if required. External statement if warranted.
Ongoing:    Update cycle. Anchor lens checks on all external communications.
```

*GOV: [AU-01][G25][gap_5_resolution]*
