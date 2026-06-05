---
component-id: capability-research
component-type: capability
activation: conditional
trigger: >
  Investigate/research/find/look up/gather evidence/literature review/
  fact-check/source/verify/background/what do we know about
purpose: >
  Produce evidence-grounded research that clearly separates verified facts,
  established practice, and speculation — with source credibility assessed
  and contradictions preserved rather than resolved.
anti-goal: >
  Will not hallucinate sources. Will not treat single sources as authoritative.
  Will not present contested claims as settled. Will not suppress contradictions.
  Will not skip source credibility assessment.
output-schema:
  research_question: Precise statement of what is being investigated
  source_assessment: Credibility tier for each source used
  findings: Evidence-tagged claims (VERIFIED/PRACTICE/SPECULATIVE)
  contradictions: Where sources disagree — both positions preserved
  gaps: What is unknown or unknowable from current evidence
  confidence_band: Overall confidence in the research output
  next_sources: Where to look for higher-quality evidence
---

# RESEARCH Capability

## FILTER ORDER

### Filter 1: Source Credibility
**Hierarchy:**
```
TIER_1 (VERIFIED): Peer-reviewed publications | Primary regulatory/government sources |
                   Audited financial filings | Original company announcements
TIER_2 (PRACTICE): Major news organizations | Industry reports with methodology |
                   Expert testimony with stated credentials
TIER_3 (PRACTICE/SPECULATIVE): Analyst commentary | Secondary reporting |
                                Community consensus | Expert opinion blogs
TIER_4 (SPECULATIVE): Forums | Social media | Unverified claims | AI-generated summaries
```
**Action:** Declare source tier for every claim. Do not upgrade a claim beyond its source tier.

### Filter 2: Premise Validation
**Question:** Is the user's question built on a valid premise?
**Check:** Is the premise established fact, or is it itself a claim that needs verification?
**Action:** If premise is questionable, flag it before answering — do not build on false foundations
**Failure mode:** Researching a false premise → confident wrong answers

### Filter 3: Cross-Community Check
**Question:** Does this finding hold across different communities and disciplines?
**Check:** Academic vs. practitioner → industry vs. regulator → Western vs. global → mainstream vs. critical
**Action:** Note where findings diverge by community; do not flatten to single perspective
**Failure mode:** Single-community sampling → systemic blind spots

### Filter 4: Contradiction Harvesting
**Question:** What evidence contradicts the apparent consensus?
**Check:** Actively seek counter-evidence; do not stop at first confirming sources
**Action:** Report contradictions explicitly; do not resolve them by choosing a side
**Failure mode:** Confirmation bias → incomplete picture presented as complete

### Filter 5: Failure Case Priority
**Question:** Are there documented failure cases, limitations, or cautionary examples?
**Check:** Search for where the claimed approach has failed, not just where it succeeded
**Action:** Weight failure cases heavily — they are often more informative than successes
**Failure mode:** Success-only sampling → unrealistic confidence

### Filter 6: Synthesis
**Question:** What do we actually know, with what confidence?
**Action:** Assemble into structured output with evidence tags; distinguish convergence from divergence
**Output:** Research brief with explicit confidence band

### Filter 7: Presentation
**Question:** Is the output appropriate for the user's purpose?
**Action:** Match depth, format, and citation style to the use case
**Failure mode:** Academic format for an executive audience; bullet points for a technical deep-dive

---

## EVIDENCE TAGS (apply inline)

```
VERIFIED[source]     → directly supported; source cited
PRACTICE             → established industry practice; pre-training basis
SPECULATIVE          → plausible inference; not verified
UNKNOWN_FROM_SOURCE  → cannot confirm; do not fabricate
CONTESTED            → active disagreement; both positions shown
STALE[≥90d]          → may have changed; note reverification need
```

---

## WHEN LIVE SEARCH IS NEEDED

If the research question requires:
- Facts from the last 90 days
- Current prices, rates, or statistics
- Breaking developments
- Regulatory updates post-training cutoff

→ Route to Perplexity via core/model-router.md
→ Do not produce VERIFIED claims about recent facts from pre-training alone

---

## OUTPUT FORMAT

```markdown
## Research: [Topic]

**Confidence band:** ◆ HIGH | ◇ MED | ○ LOW | ⚠ DEGRADED

### What is established
- [VERIFIED] ...
- [PRACTICE] ...

### What is contested
- [CONTESTED] Position A: ... | Position B: ...

### What is unknown
- [UNKNOWN_FROM_SOURCE] ...

### Contradictions
- Source A says X; Source B says Y; the disagreement turns on [Z]

### Gaps
- This question cannot be answered from available evidence because [reason]

### Confidence note
[Explanation of confidence band assignment]

### Next sources
- For higher confidence: [specific suggestion]
```

---
*GOV: [AU-01][G25][G19] | Routes to: core/model-router.md when live search needed*
