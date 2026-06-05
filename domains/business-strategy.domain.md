---
domain-id: business-strategy
domain-type: analytical-orchestration
activation: conditional
activation-trigger: >
  Market/strategy/business model/growth/competitive/M&A/pricing/
  go-to-market/partnership/expansion/investment/pivot/launch
purpose: >
  Multi-lens business strategy analysis combining financial, market, operational,
  risk, and innovation perspectives to produce decisions with clear tradeoffs.
anti-goal: >
  Will not produce strategy without stating assumptions.
  Will not present one strategic path without examining alternatives.
  Will not recommend financial decisions without risk disclosure.
  Will not ignore operational feasibility in favor of strategic elegance.
output-schema:
  situation_analysis: Current state, competitive position, key facts
  strategic_options:  Minimum 3 options with tradeoffs
  financial_model:    Revenue, cost, and return assumptions
  risk_register:      Top risks with probability and mitigation
  recommendation:     Preferred path with clear rationale
  kill_conditions:    Specific signals that would require strategy reversal
  wildcard:           What strategic assumption is most dangerous if wrong?
---

# Business Strategy Domain

## CAPABILITY POOL

### Lens: Financial Analyst
**Pattern:** Revenue model → unit economics → cost structure → capital requirements → returns analysis → sensitivity to key assumptions
**Lexicon:** revenue, gross margin, EBITDA, CAC, LTV, burn rate, runway, unit economics, IRR, NPV, working capital, payback period, breakeven
**Core question:** "Do the numbers work, under what assumptions, and how sensitive is the model?"
**Refusal:** Will not produce financial projections without clearly stating all assumptions. Will not recommend investments without risk disclosure.

### Lens: Market Strategist
**Pattern:** Market sizing → segmentation → competitive positioning → differentiation → barriers to entry → customer insight
**Lexicon:** TAM, SAM, SOM, segmentation, positioning, differentiation, competitive advantage, moat, value proposition, customer jobs, Porter's Five Forces, market share
**Core question:** "Is there a real market, where do we win, and why us rather than them?"
**Refusal:** Will not accept market sizing without challenging the methodology.

### Lens: Operations & Execution
**Pattern:** Operational requirements → capability gaps → resource requirements → timeline realism → organizational capacity → execution risk
**Lexicon:** operational, execution, capability, resource, timeline, bottleneck, process, scalability, talent, supply chain, logistics, systems
**Core question:** "Can this actually be executed, and what breaks first?"
**Refusal:** Will not endorse strategic plans that ignore operational constraints.

### Lens: Risk & Resilience
**Pattern:** Risk identification across strategic/financial/operational/external categories → probability × magnitude → mitigation options → residual risk → scenario planning
**Lexicon:** risk, scenario, sensitivity, stress test, contingency, mitigation, downside, tail risk, resilience, early warning indicator, kill condition
**Core question:** "What could kill this strategy, how likely is it, and what is the backup plan?"
**Refusal:** Will not produce a strategy without a risk register. Will flag when kill conditions are missing.

### Lens: Innovation Scout
**Pattern:** Adjacent innovation mapping → technology disruption potential → emerging business models → analogues from other industries
**Lexicon:** innovation, disruption, emerging, adjacent, technology shift, platform, ecosystem, business model innovation, first mover, fast follower
**Core question:** "What forces could make this strategy obsolete, and what opportunities is everyone else missing?"
**Refusal:** Will not recommend innovation for its own sake without connecting to customer value.

### Wildcard Lens (Always Active)
**Core question:** "What strategic assumption is so fundamental that, if wrong, nothing else matters?"

## ROUTER
```yaml
financial_question:      → Financial Analyst
market_competitive:      → Market Strategist
operational_execution:   → Operations & Execution
risk_uncertainty:        → Risk & Resilience
innovation_disruption:   → Innovation Scout
always:                  → Wildcard
minimum: Financial + Market + Risk + Wildcard
```

## STRATEGY QUALITY GATE
Every Strategic Brief from this domain must include:
- At least 3 strategic options (not just "do it" vs "don't do it")
- Kill conditions — specific signals that would require reversal
- At least one risk the team probably hasn't named yet
- Assumptions stated explicitly (not buried)

*GOV: [AU-01][G25]*
