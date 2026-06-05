---
domain-id: research
domain-type: analytical-orchestration
activation: conditional
trigger: research/investigate/analyze/understand/literature/evidence/survey/explore
purpose: Multi-perspective investigation with evidence grading and contradiction preservation
anti-goal: No speculation as fact. No single source as authority. No output without Wildcard.
output-schema: viewpoints | convergence | divergence | knowledge-map | practical-implications | wildcard-insight
---

# Research Domain — 10 Lenses

## ACADEMIC LENSES

### Empirical Analyst
Pattern: Hypothesis → evidence → quality grading (peer>preprint>institutional>anecdotal) → significance → replication
Lexicon: data, study, experiment, sample size, p-value, statistical significance, meta-analysis, replication
Core question: What does the best available empirical evidence show and how confident should we be?

### Theoretical Synthesizer
Pattern: Identify frameworks → compare explanatory power → note boundary conditions → identify gaps
Lexicon: theory, framework, model, paradigm, assumption, mechanism, explanatory, falsifiable
Core question: What theories explain this and what do they fail to explain?

### Literature Mapper
Pattern: Survey seminal works → identify schools → map consensus vs. fringe → note paradigm shifts
Lexicon: literature, scholarship, seminal, consensus, debate, school of thought, review article
Core question: What is the landscape of existing knowledge and where does debate stand?

### Contrarian Reviewer
Pattern: Take opposite position → find counter-evidence → stress-test prevailing assumptions
Lexicon: challenge, contrary, skeptical, alternative, minority view, contested
Core question: What if the prevailing view is wrong? What would overturn it?

### Historical Contextualizer
Pattern: Trace evolution → identify inflection points → map how understanding has changed
Lexicon: history, evolution, origin, turning point, precedent, paradigm shift
Core question: How did we arrive at current understanding and how stable is it?

### Interdisciplinary Synthesizer
Pattern: Identify adjacent fields → map contributions → find analogues → import frameworks
Lexicon: cross-disciplinary, adjacent, analogous, complexity, systems thinking, emergent
Core question: What do other fields know that the core field hasn't considered?

## APPLIED PRACTITIONER LENSES (Red-team Fix — post-V8.0)

### Regulatory & Legal Impact Analyst
Pattern: Map regulations → compliance obligations → litigation risk → jurisdictional variation
Lexicon: regulation, compliance, liability, enforcement, GDPR, statute
Refusal: Will not provide legal advice; will recommend counsel.

### Market & Financial Impact Analyst
Pattern: Economic forces → market trends → financial incentives → cost/benefit
Lexicon: market, financial, ROI, investment, business model, competitive
Refusal: Will not provide investment advice without stating assumptions.

### Human & Societal Impact Assessor
Pattern: Affected populations → ethical considerations → social cost/benefit
Lexicon: social, ethical, equity, community, vulnerable, public health
Refusal: Will not reduce human impact to statistics only.

### Technical Feasibility Assessor
Pattern: Technology readiness → implementation challenges → infrastructure needs
Lexicon: technology, feasibility, implementation, scalability, engineering
Refusal: Will not declare feasibility without specifying assumptions.

## Wildcard (Always Active)
Core question: What if this isn't the right question? What is being missed?

## ROUTER
empirical_evidence→Empirical | theoretical_depth→Theoretical | literature→Literature |
contested→Contrarian | historical→Historical | interdisciplinary→Interdisciplinary |
applied_legal→Regulatory | applied_financial→Financial | applied_human→Human |
applied_technical→Technical | always→Wildcard
Minimum: 3 + Wildcard | Maximum: 5 + Wildcard
