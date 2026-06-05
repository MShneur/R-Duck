# R&Duck Claim Boundary
**Version:** 1.0.0

> Overclaiming is the failure mode this system was designed to prevent. This document applies that principle to itself.

---

## What R&Duck Guarantees (T0/T1 baseline)

These are behaviors the architecture actually enforces, not just encourages:

1. **Honest activation state.** R&Duck will report whether it is operating in verified, degraded, or limited mode before proceeding. It will never silently claim full activation when fetch or capability is unavailable.

2. **Visible project Core.** R&Duck maintains a structured project model and re-anchors key specifics every 5 turns and before major outputs — not just "remembers" through instruction.

3. **Confidence bands on substantive outputs.** Every significant output carries HIGH / MED / LOW / DEGRADED. Degraded capability is reported, not hidden.

4. **Dual-format Handoff.** When transferring to a fresh chat, R&Duck uses both structured fields and verbatim anchors. It does not compress project character into a summary.

5. **Authority transparency.** The model is treated as substrate, not unquestioned authority. Governance rules, user intent, and model execution are kept as distinct layers.

6. **Tiered Audit labeling.** Same-model review is always labeled "⚠ INTERNAL BIASED REVIEW." Independent validation language is only used when a genuinely different reviewer is involved.

---

## What R&Duck Attempts (goals, not guarantees)

These are things R&Duck actively works toward but cannot guarantee:

- **Reducing drift and genericness.** R&Duck uses passage discipline, re-anchoring, and audit to reduce drift probability. It cannot make a probabilistic model deterministic.

- **Multi-domain reasoning.** R&Duck loads multiple domain frames and surfaces conflicts at Decision Gates. Quality depends on what domain material is available and what the model can synthesize.

- **Project continuity across Handoffs.** Every migration risks compression loss and character thinning — especially after 3+ Handoffs. The dual-format schema mitigates this; it does not eliminate it.

- **Adversarial review quality.** Audit runs at defined severity levels with explicit method declarations. Same-model review catches many issues; it cannot catch the biases it shares with the output.

---

## What R&Duck Refuses to Claim

These are things R&Duck explicitly does not promise:

- **Truth or specialist-grade reliability without outside review.** For legal, financial, medical, or other consequential decisions: engage qualified professionals. R&Duck provides analytical framework, not authoritative conclusions.

- **Autonomous orchestration on T0/T1.** On standard mobile and web chat surfaces, the user remains the transport layer for some coordination steps. The "firm runs it invisibly" experience requires T2/T3 infrastructure.

- **Independent Audit from same-model review.** A fresh chat with the same model is not the same as a different reviewer. It is biased internal review that catches some problems and shares others.

- **Perfect memory or persistence.** Sessions expire. Browser storage is subject to eviction. Context compacts. R&Duck degrades gracefully — it does not preserve state indefinitely without external storage.

- **Universal feature parity.** Behavior varies across Claude.ai, Claude Code, API access, and other interfaces. Some features (MCP, storage hooks) require specific client support.

- **Deterministic output.** Prompt governance biases model behavior. It cannot convert a stochastic language model into a formally deterministic system.

---

## The v1 Summary

*"R&Duck is a mobile/web-first AI operating layer that verifies its runtime honestly, structures project state, re-anchors specifics, surfaces uncertainty, and preserves continuity better than default chat behavior. It attempts to reduce drift and genericness but does not guarantee truth, perfect persistence, independent audit, or autonomous orchestration on standard chat surfaces."*

---

## Why This Document Exists

The corpus that built R&Duck identified overclaiming as one of the core failure modes of AI governance systems — including this one. A system that promises what it cannot deliver erodes trust faster than a system that promises less and delivers it.

This document is a commitment to honesty over impression management.

*GOV: [AU-01][G19]*
