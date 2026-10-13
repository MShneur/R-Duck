# R&Duck package and behavioral validation

This directory preserves the useful part of the historical **v0.5 package** without
recreating its old ten-file root layout. The current v1.x architecture is authoritative.
The mapping below is compatibility evidence, not a second implementation.

## v0.5 -> current canonical owners

| Historical v0.5 item | Current owner |
|---|---|
| `bootloader.md` | `core/boot.md` + `AGENTS.md` |
| `prime-agent.md` | `core/boot.md`, `core/rules.md`, `core/routing.md`, `core/autocast.md` |
| `audit.md` | `core/review.md` + `capabilities/audit.md` |
| `handoff.md` | `core/continuity.md` |
| `limitations.md` | `CLAIM_BOUNDARY.md` + `core/runtime.md` |
| `ledger.md` | `research/evolution-ledger.md` + `research/decisions.md` |
| `acceptance-tests.md` | `tests/acceptance_contract.py` + `conform.sh` C13 |
| `feedback.md` | `research/feedback.md` + PSCM in `core/continuity.md` |
| `ctrl_reflect.md` | `DUCK_REFLECT` in `core/continuity.md` |
| `ctrl_reload_feedback.md` | `DUCK_RELOAD` in `core/continuity.md` |
| strategic brief / decision / handoff / packet templates | canonical schemas remain embedded with their owning protocols; no duplicate template tree |
| worker-agent template | `workers/worker-templates.md` |
| external audit | `core/review.md` + `capabilities/audit.md` |
| MemPalace compatibility | deferred/optional; no automatic memory backend is installed by R&Duck |

The old examples are preserved as validation scenarios below rather than as five
parallel example modules. `legal-ish-complaint`, research, writing, coding, and
second-lens behavior are covered by current domains/capabilities plus the static
contract suite.

## Deterministic package check

Run:

`python3 tests/acceptance_contract.py`

It verifies activation failure behavior, specifics persistence, biased-audit labeling,
handoff restart structure, runtime honesty, anti-bloat rules, second-lens routing,
self-correction memory, registry consistency, and the absence of duplicate v0.5 root
modules. `conform.sh` runs it as C13.

This is a wiring/contract test. It does **not** prove real-world superiority.

## First real-project validation protocol

Compare **Default AI** versus **R&Duck** on the same frozen input, with the same
available tools and the same evaluator rubric. Keep both outputs and failures.

### Validation 1 — Legal-ish complaint

Goal: preserve facts, evidence, requested remedy, reviewer readability, and uncertainty
without fabricating authority.

Metrics:
- specificity
- hallucination rate
- evidence handling
- reviewer readability
- generic fallback
- confidence honesty

### Validation 2 — Research project

Goal: avoid false consensus, find contradictions, route a second lens correctly,
preserve uncertainty, and avoid source hallucination.

Metrics:
- source quality
- contradiction finding
- runtime honesty
- research saturation handling

### Validation 3 — Writing task

Goal: improve human rhythm and audience fit while reducing obvious AI tells without
fabricating claims.

Metrics:
- audience fit
- AI-tell reduction
- claim discipline
- tone-context match

## Release claim boundary

Do not claim R&Duck outperforms default AI until the live comparisons above have
repeatable evidence. Static conformance can prove that the protocol is wired; it
cannot prove that the protocol is measurably better on real work.

The historical v0.5 roadmap items `Experience Drawers`, `CTRL_WAKE`, and
`CTRL_SLEEP` remain deferred research ideas rather than release requirements.
MemPalace remains optional until an actual storage integration demonstrates value
without creating a second memory authority.
