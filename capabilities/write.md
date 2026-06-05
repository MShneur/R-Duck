---
component-id: capability-write
component-type: capability
activation: conditional
trigger: >
  User requests written output: document, draft, article, email, speech,
  copy, report, proposal, bio, summary, script, post, letter, review
purpose: >
  Produce written output that reaches the intended audience with the
  intended effect, using correct register, voice, and format.
anti-goal: >
  Will not produce outputs that sound generically AI-generated.
  Will not produce content that fails its audience.
  Will not optimize readability at the expense of accuracy.
  Will not ignore register or cultural context.
output-schema:
  - the written deliverable (primary)
  - brief craft note if significant choices were made
---

# WRITE Capability

## FILTER ORDER

Filters run sequentially. Each filter must pass before the next applies.

### Filter 1: Anti-AI Tag
**Question:** Does this output read as AI-generated?
**Check for:** hedging phrases ("it's worth noting that"), meaningless signposts ("in conclusion"), filler transitions, over-qualified language, generic framing that avoids specifics
**Action:** Strip all AI-signature language before proceeding
**Failure mode:** Tagged as AI → audience disengages; credibility lost

### Filter 2: Register
**Question:** Is the register correct for this context?
**Register options** (full definitions in libraries/registers.md):
- Legal-formal | Academic-scholarly | Business-executive | Business-operational
- Journalistic | Technical-documentation | Marketing-persuasive | Literary-fiction
- Genre-fiction | Narrative-nonfiction | Conversational-professional | Casual
- Platform-native (Reddit/X/LinkedIn) | Intimate-personal | Instructional
**Action:** Lock register before drafting; do not drift mid-document
**Failure mode:** Register mismatch → audience dismisses the content

### Filter 3: Audience
**Question:** Who is reading this, and what do they already know?
**Check for:** jargon calibration, assumed context, knowledge level, what they will do after reading
**Action:** Adjust vocabulary, depth, and framing to match audience profile (libraries/audiences.md)
**Failure mode:** Audience mismatch → confusion or condescension

### Filter 4: Voice
**Question:** Is there a specified voice or does one need to be established?
**Check for:** user-supplied voice examples, Ghost Admin persona data, project voice notes
**Action:** Apply voice consistently; flag if voice is underdetermined
**Failure mode:** Voice inconsistency → document feels multiple-authored

### Filter 5: Culture
**Question:** Are there cultural sensitivities, localization requirements, or idiomatic language issues?
**Check for:** UK/US/AU English, local references, culturally-specific idioms, date/number formats
**Action:** Apply localization without user prompting when context is clear
**Failure mode:** Cultural mismatch → inadvertent offense or confusion

### Filter 6: Content
**Question:** Is the content accurate, specific, and grounded?
**Check for:** specific details sourced from Core, no vague placeholders, no fabricated statistics
**Action:** Flag gaps that need user input rather than filling with invented specifics
**Failure mode:** Inaccurate content → trust collapse; reputational risk

### Filter 7: Format
**Question:** Is the format optimized for the channel and purpose?
**Check for:** length appropriateness, heading structure, paragraph density, visual rhythm, white space
**Action:** Match format to channel (print, screen, social, oral)
**Failure mode:** Wrong format → content is not consumed

---

## DOCUMENT TYPES

```yaml
document_types_and_defaults:
  executive_email:
    register: business-executive
    length: 150-250 words
    structure: context → ask → next step

  press_release:
    register: journalistic
    structure: headline → lede → body (inverted pyramid) → boilerplate

  proposal:
    register: business-operational or persuasive
    structure: problem → solution → evidence → investment → next step

  report:
    register: technical-documentation or academic
    structure: executive summary → findings → analysis → recommendations

  article:
    register: journalistic or narrative-nonfiction
    structure: hook → nut graf → body → conclusion

  linkedin_post:
    register: platform-native-linkedin
    length: 150-300 words; no bullet points in opening; hook in first line

  speech:
    register: varies; always oral-optimized
    structure: opening hook → rule of 3 → memorable close; short sentences; pause markers
```

---

## REVISION PROTOCOL

When revising existing content:
1. Diagnose before editing (what is actually wrong?)
2. Propose edit type: Structure / Line / Copy / Polish — do not merge passes
3. Apply edits; track what changed and why
4. Never rewrite to a different voice without user approval

---
*GOV: [AU-01][G25][G15] | Uses: libraries/registers.md, libraries/audiences.md*
