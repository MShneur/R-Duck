# R&Duck Evolution Ledger
**GOV: [LR-01][LR-02][LR-03]**

All architectural decisions, accepts, rejects, and lessons. Every entry persists permanently.

---

```yaml
entry_01:
  date: 2026-04
  type: baseline
  decision: accept
  change: R&Duck v0.1 created — single Prime Agent + 5 typed capabilities + shared libraries
  rationale: Prime-centered composition reduces drift surface vs peer-agent or mode-first approaches
  source: Multi-AI research synthesis (ChatGPT, DeepSeek, Perplexity, Claude, Grok)
  reject_reason: N/A

entry_02:
  date: 2026-04
  type: failure_lesson
  decision: accept
  change: PSCM (self-correction lens) added — corrections must be persistent, not local patches
  rationale: Session after session, corrections were treated as one-time fixes and not retained
  source: Observed pattern across multiple sessions
  failure_prevented: Correction treated as one-time patch; same error repeated

entry_03:
  date: 2026-04
  type: architectural
  decision: accept
  change: Model router added — R&Duck knows its limits and routes to better external tools
  rationale: One model cannot do everything equally well; overclaiming is a core failure mode
  source: Cross-AI analysis; saturation detection research
  failure_prevented: Bluffing past capability limits with weak answers

entry_04:
  date: 2026-04
  type: capability_tiering
  decision: accept
  change: T0/T1/T2/T3 tier system — T0/T1 is the real product; T2/T3 are optional enhancements
  rationale: Mobile/web-first without requiring local PC build
  source: User requirement; mobile deployment constraint
  failure_prevented: Architectural features only available to power users

entry_05:
  date: 2026-04
  type: memory
  decision: accept
  change: EdgeVec + TalaDB specified for mobile-native storage without server requirement
  rationale: Browser-native WASM storage removes local PC dependency from T2/T3
  source: DeepSeek PWA architecture research
  notes: SPECULATIVE — browser eviction behavior not validated
  failure_prevented: Memory only available on desktop

entry_06:
  date: 2026-04
  type: architectural
  decision: accept
  change: Bootloader notation — structured JSON/YAML with embedded symbolic logic
  rationale: AI-native notation beats prose (scored 69/100 vs prose 44/100)
  source: Variable evaluation across AI architectures
  failure_prevented: AI-facing files optimized for human readers; poor parse reliability

entry_07:
  date: 2026-04
  type: architectural
  decision: accept
  change: Unrestricted Brainstorm Protocol (UBP/v1) — fires before every goal-level decision
  rationale: Prevents premature closure on options; ensures categorical diversity
  source: Multi-session evaluation; diminishing returns reached at v11
  notes: UBP reached diminishing returns — do not refine further without new evidence

entry_08:
  date: 2026-04
  type: naming
  decision: accept
  change: Vocabulary locked: R&Duck / Prime Agent / Agents / Core / Strategic Brief /
          Decision Gate / Handoff / Summary Packet / Audit
  rationale: Fortune 500 professional framing + developer-legible technical terms
  source: Naming research session (Perplexity)
  failure_prevented: Inconsistent naming causing coordination failures

entry_09:
  date: 2026-04
  type: persona
  decision: reject
  change: Multiple "master" agents (rejected) — one Prime Agent confirmed
  rationale: Multiple masters create authority ambiguity and drift
  source: DeepSeek red-team comparison
  reject_reason: Authority ambiguity; coordination failure
  revival_condition: N/A — structural decision
  review_trigger: N/A

entry_10:
  date: 2026-04
  type: architectural
  decision: accept
  change: Dual-format Handoff — structured fields + raw verbatim anchors
  rationale: Structured-only handoffs flatten meaning; verbatim anchors prevent character loss
  source: Perplexity analysis; session degradation observation
  failure_prevented: Project character thinning after repeated migrations

entry_11:
  date: 2026-04
  type: capability
  decision: accept
  change: AI-native notation for all AI-facing files (YAML/JSON, not prose)
  rationale: Prose bootloader was optimized for human readers; AI parse reliability lower
  source: Notation variable evaluation
  failure_prevented: Drift in instruction parsing across different AI models

entry_12:
  date: 2026-04
  type: architectural
  decision: accept
  change: Ghost Admin persona extraction — silent behavioral model from corrections
  rationale: Behavioral patterns are richer than stated preferences
  source: DeepSeek analysis
  failure_prevented: User preferences only captured when explicitly stated

entry_13:
  date: 2026-04
  type: architectural
  decision: accept
  change: State blocks — invisible continuity anchors generated after every response
  rationale: Context between turns is the primary driver of session coherence
  source: DeepSeek analysis
  failure_prevented: State loss between turns causing repeated context errors

entry_14:
  date: 2026-05
  type: architectural_correction
  decision: accept
  change: Five red-team fixes to V8 architecture incorporated into boot/kernel.md
  source: DeepSeek red-team sandbox comparison V7.2 vs V8
  changes:
    fix_1: Intent-aware routing (verb > noun) replaces keyword-only domain matching
    fix_2: Anchor lenses persist across domain hotswaps
    fix_3: Applied practitioner lenses added to Research domain
    fix_4: Auto-Council proposal for 3+ domain tasks
    fix_5: Output gate checks anchor lenses, not just active domain
  failure_prevented: Domain mismatch on multi-intent queries; legal context dropped in PR drafts

entry_15:
  date: 2026-05
  type: gap_resolution
  decision: accept
  change: All 8 V7.1.1 gaps addressed with concrete implementations
  gaps_resolved:
    gap_1: Persistent memory — Cognee/Mem0 pattern + benchmark criteria
    gap_2: Context compaction — write/select/compress/isolate + state blocks
    gap_3: Multi-agent handoff — LangGraph-pattern compressed state schema
    gap_4: Ghostwriter OS — 6-mode pipeline built from scratch
    gap_5: Incident response — 24h playbook + Rule of Two + rollback protocol
    gap_6: Evidence freshness — LLM-as-Judge with explicit rubrics
    gap_7: Workflow library — 5 templates with scaffold + test cases
    gap_8: Artifact factory — compiled AI paradigm; deterministic versioned artifacts

entry_16:
  date: 2026-05
  type: governance
  decision: accept
  change: 30-rule Golden Rule Index with typed IDs (AU/TS/OD/HC/PI/MR/AD/AG/LR + G15-G25)
  rationale: Rule IDs enable downstream reference without duplication; enforces AG-03
  source: Perplexity ctrl-main-lite architecture research
  failure_prevented: Rule duplication drift across files; stale governance language

entry_17:
  date: 2026-05
  type: architectural_clarification
  decision: accept
  change: Unified architecture declaration — R&Duck and CTRL-AI V8 are one system, two modes
  rationale: Parallel track framing was causing architectural duplication
  source: Committee VerifyLens pass
  failure_prevented: Duplicate files, conflicting architectures

entry_18:
  date: 2026-05
  type: claim_boundary
  decision: accept
  change: Explicit claim boundary document (guarantees / attempts / refuses)
  rationale: Overclaiming is the core failure this system was designed to prevent
  source: Perplexity R&Duck critique; deployment package committee
  failure_prevented: User trust collapse when system fails to deliver overclaimed capabilities

entry_19:
  date: 2026-05
  type: module
  decision: accept
  change: PSCM Self-Correction Lens formally specified as full governance module
  rationale: End-of-session extraction prevents corrections from being treated as patches
  source: Perplexity + Claude session collaborative build
  failure_prevented: Persistent correction failures; preferences lost across sessions

entry_20:
  date: 2026-05
  type: security
  decision: accept
  change: Rule of Two added as hard constraint (LOCK-6)
  rationale: IEEE/NIST standard for agentic AI security; prevents lethal trifecta exploits
  source: Perplexity gap analysis + IEEE/NIST agentic AI guidance
  failure_prevented: Agent prompt injection and data exfiltration via combined capabilities

entry_21:
  date: 2026-05
  type: loading
  decision: accept
  change: Hybrid loading architecture — MCP primary / URL fallback / IndexedDB emergency
  rationale: Single-path loading (GitHub raw only) fails offline; no progressive disclosure
  source: DeepSeek connector architecture research
  failure_prevented: Activation failure on mobile; no offline capability

entry_22:
  date: 2026-05
  type: audit
  decision: accept
  change: Audit tiered — Internal Biased labeled explicitly / External recommended for high-stakes
  rationale: Same-model review is structurally biased; presenting it as independent = deception
  source: Multiple sessions; VerifyLens pass
  failure_prevented: Audit theater; false confidence in self-review

entry_23:
  date: 2026-05
  type: persona_reject
  decision: reject
  change: Lyra personality/identity engineering (rejected as architecture model)
  rationale: Architecture claim (steering layer) is valid. Personality/identity claim is not.
  reject_reason: Determinism claims ("zero drift") exceed transformer capability
  revival_condition: If mechanistic interpretability allows genuine behavioral guarantees
  review_trigger: 2027-05 or if academic evidence of behavioral enforcement emerges
  what_was_kept: 4-D staged workflow (Deconstruct/Diagnose/Develop/Deliver) as intake pattern

entry_24:
  date: 2026-05
  type: research_pipeline
  decision: accept
  change: R&Duck v2.0 research pipeline spec (7 components)
  rationale: PTPF scores for v1.0 pipeline were Σ28% Δ-62% — not fit for governance research
  target: v2.0 → Σ≥75% Δ>0% Ω≥70% Ψ≥80% ¤≥80%
  notes: SPECULATIVE — self-assessed projections; third-party validation needed
  components: [watch-list-agent, ingest-gateway, corpus-store, decision-ledger,
               analysis-engine, diff-testing-gate, self-audit-module]
```

---
*GOV: [LR-01][LR-02][LR-03] | Append new entries; never modify old ones*

entry_25:
  date: 2026-06
  type: architectural_refactor
  decision: accept
  change: Invariants/parameters layer separation. Added core/session-profile.md as the runtime
          parameter layer; stripped all hardcoded parameters from other core files.
  source: User insight — "shouldn't it be based on the topic / rebuilt per project?"
  rationale: System confused permanent invariants with derived parameters. Would rot on model swap,
             historical research, novel project type, or changed free tier. Date was the first crack.
  failure_prevented: Static-assumption rot; cross-AI self-model lying about host capabilities

entry_26:
  date: 2026-06
  type: factual_correction
  decision: accept
  change: Removed hardcoded "knowledge cutoff: April 2025" from model-router.md. Self-model now
          populated at runtime from session-profile. Corrected Rule of Two attribution (community
          label, not formal IEEE/NIST standard name).
  source: Opus-max review pass
  failure_prevented: Confidently wrong cutoff; cross-AI misrepresentation; overclaimed standards naming

entry_27:
  date: 2026-06
  type: module_addition
  decision: accept
  change: core/freshness.md — topic-class recency (TIMELESS/SLOW/MODERATE/FAST) replaces hardcoded
          day-count staleness. Classify the query, not the calendar.
  source: User insight — recency is a property of the topic
  failure_prevented: Arbitrary staleness flags on timeless facts; missed verification on fast-changing facts

entry_28:
  date: 2026-06
  type: module_addition
  decision: accept
  change: core/compose.md — domain composition engine. The 8 domains are presets over a composition
          engine, not the complete universe. No-preset projects compose a domain from the lens library.
  source: Red-team — the 8 domains are presumptuous
  failure_prevented: Forcing novel projects into ill-fitting preset domains

entry_29:
  date: 2026-06
  type: research_integration
  decision: adapt
  change: PRD / Agentic-PRD frameworks integrated. Working-backwards intake, measurable success gate,
          autonomy levels 1-4 (separate axis from infra tier), acceptance-criteria-as-predicates,
          positive non-goals, ~150-200 instruction ceiling (AD-04).
  source: Web research — IEEE 29148, Amazon PR-FAQ, Agentic PRD (2025-2026)
  rationale: PRD discipline strengthens the Strategic Brief and Session Profile without making the
             constitution itself a PRD (Spike's caution honored)
  reject_note: Did NOT adopt full PRD-as-constitution; only profile + brief are PRD-shaped

entry_30:
  date: 2026-06
  type: deployment
  decision: accept
  change: BEHAVIOR files built — Claude (Projects), ChatGPT (≤1500-char custom-instructions fit),
          Gemini (Gem). System is now actually deployable, not just architecturally complete.
  source: UX/Deployment committee persona
  failure_prevented: Architecturally complete but undeployable

entry_31:
  date: 2026-06
  type: self_correction
  decision: accept
  change: 1.0.0 self-audit caught a G25 violation in the build itself — domain-template, gatekeeper,
          and component-registry had >50% overlapping gate logic. Refactored domain-template to a pure
          shell (AG-04). System corrected its own duplicate sprawl.
  source: Self-audit (the system running its own governance on itself)
  failure_prevented: The exact bloat the G25 gate exists to prevent, shipped in the gate's own files

entry_32:
  date: 2026-06
  type: consolidation
  decision: accept
  change: core/ consolidated 11 → 6 files. Files that load together merged. boot.md (was
          bootloader+handshake+session-profile), runtime.md (persistence+confidence+freshness),
          routing.md (compose+model-router), continuity.md (handoff+corrections). specs/ 3→1.
  source: User insight — "I feel like we're entering a huge library. Is it design or drift?"
  rationale: The granularity came from IDE-agent architecture (auto-loads subdirectory files).
          R&Duck's primary target is mobile/web chat where fine granularity = cost without benefit.
          Applied AG-02 test: files that always load together are one load-unit.
  failure_prevented: Maintenance burden; cross-reference complexity; over-instruction risk

entry_33:
  date: 2026-06
  type: capability_addition
  decision: accept
  change: RRED Protocol v2.0 added as capabilities/rred.md. Strategic communication protocol
          for high-stakes adversarial-resilient outputs. 12 CORE + 14 LC extension rules.
  source: User-built protocol (multiple AI sessions + user corrections)
  rationale: Fills a gap WRITE capability couldn't — frame control, disclosure sequencing,
          adversarial resilience, claim-load management for hostile-reader contexts.

entry_34:
  date: 2026-06
  type: protocol_addition
  decision: accept
  change: SPAR/BENCH review ladder added to core/review.md. Auto-casts reviewers by task.
          Independence phase (kills DoT/conformity). Adaptive stopping. Judge verdict not vote.
  source: Multi-agent debate research (NeurIPS 2025, ETH Zurich 2026, Society of Mind lineage)
  rationale: Prior committee was manually filled, fixed 8 personas, sequential (conformity-prone),
          no judge synthesis, no stopping rule — three known failure modes.

entry_35:
  date: 2026-06
  type: protocol_addition
  decision: accept
  change: DUCK_BUILD protocol added to specs/governance-gate.md. Build-mode institutional memory.
          Checks ledger before proposing. Circle-prevention rule for rejected ideas.
  source: User insight — "it's like a super handoff between builds so we don't go in circles"
  rationale: Without build memory, sessions re-propose rejected ideas and rediscover failure modes.

entry_36:
  date: 2026-06
  type: standard_adoption
  decision: accept
  change: AGENTS.md adopted as standard entry file (replaces BEHAVIOR_CLAUDE.md).
          Auto-discovered by Claude Code, Cursor, Codex, Copilot (60K+ repos use this standard).
  source: AGENTS.md ecosystem research (2026)
  rationale: Zero-touch IDE activation. The standard already exists — match it.

entry_37:
  date: 2026-06
  type: research_integration
  decision: adapt
  change: ETH Zurich over-instruction finding encoded as AD-04 ceiling justification.
          Study showed context files increase reasoning tokens +22% without improving outcomes.
  source: ETH Zurich/LogicStar 2026 — "Evaluating AGENTS.md"
  what_was_kept: the empirical bound (~150-200 instructions) and the principle (load less, not more)
  what_was_rejected: the implication that context files don't help (they do when kept lean)

entry_38:
  date: 2026-06
  type: security_integration
  decision: accept
  change: Trifecta check added to routing.md — explicit named protocol that fires before
          ingesting external content. Checks whether session combines private data + untrusted
          content + external comms. Halts if all three present.
  source: Simon Willison (coined 2025) — "The lethal trifecta for AI agents"
  rationale: LOCK-6 stated the rule; trifecta check makes it a triggered protocol with
          specific actions, not just a rule to remember. Documented exploits against
          Microsoft 365, GitHub MCP, Slack AI, ChatGPT, and 20+ production systems.

entry_39:
  date: 2026-06
  type: worker_addition
  decision: accept
  change: Safe-ingest worker (Worker 8) added — Dual LLM pattern applied to R&Duck.
          Isolated read-only worker for external/untrusted content. No private data,
          no tools, no external comms. Returns Summary Packet only.
  source: Willison "Dual LLM pattern" (2023) + IBM/ETH Zurich design patterns paper (2025)
  rationale: Architecture-level defense against prompt injection. The model that processes
          untrusted input must never be the same context that holds private data.

entry_40:
  date: 2026-06
  type: capability_upgrade
  decision: accept
  change: PROVEN gate added to CODE capability — 3-level verification standard
          (runs → correct → proven on 3+ cases). Production code requires level 3.
  source: Willison — "the bottleneck has moved to testing" + "97% is a failing grade"
  rationale: "Actually runs" is necessary but not sufficient. Slow erosion of quality
          through unverified outputs compounds across decisions.

entry_41:
  date: 2026-06
  type: protocol_addition
  decision: accept
  change: DRIFT_WATCH added to runtime.md — every 10 turns, compare current output rigor
          to session-start rigor. Catches normalization of deviance (gradual quality decline).
  source: Willison/Lenny podcast — "normalization of deviance" concept applied to AI output
  rationale: Individual outputs can pass quality checks while overall standards quietly decline.
          Same-model detection has blind spots — acknowledged as honest limit.

entry_42:
  date: 2026-06
  type: security_warning
  decision: accept
  change: MCP trifecta warning added to routing.md — T2/T3 must audit tool combinations
          against the trifecta before activation.
  source: Willison — MCP prompt injection security problems (April 2025), GitHub MCP exploit
  rationale: A single MCP tool can combine all three trifecta elements. R&Duck recommends MCP
          at T2/T3 but wasn't warning about the combination risk.
