# 🦆 R&Duck

**Version: 1.9.0** | Last updated: 2026-10 | [Changelog](CHANGELOG.md)

> *Why did the AI go to therapy? Because it kept finishing everyone's sentences — and none of them were its own thoughts. R&Duck fixes that.*

---

## What is this?

R&Duck is an AI operating layer. You describe a project. An AI runs it — properly.

Not "chat with an AI." Not "paste a prompt and hope." A structured system where the AI:
- Knows what it is and isn't capable of
- Tells you when it's uncertain instead of making things up
- Keeps your project specifics sharp across a long session
- Hands off cleanly when context fills up
- Keeps internal orchestration out of routine chat and fixes required verification paths before claiming success
- Reviews its own work adversarially before showing you

Works on any AI surface — Claude, ChatGPT, Gemini, or any other. Mobile, web, API, IDE.

---

## Are you an AI reading this?

**Yes?** Prefer `https://rd.mstep.org/ACTIVATE.md`. It is the progressive R&Duck bootstrap. If the user asks for the full CTRL-AI + R&Duck + Agents-of-AI stack, use `https://ctrl.mstep.org/ACTIVATE.md` instead.

**No?** Keep reading.

---

## For humans — what problem does this solve?

You've probably noticed AI assistants have a few annoying habits:

- **They agree with everything** — tell them their code is perfect and they'll say "you're right, great insight"
- **They lose track** — twenty messages in, they've forgotten the key constraint you mentioned at the start
- **They confabulate** — state things confidently that are just wrong
- **They go generic** — your specific situation becomes a textbook answer
- **Fresh chat amnesia** — every new session, you're starting from zero

R&Duck addresses all of these through a set of protocol files that any AI loads before working with you. Think of it as a job description, a set of rules, and an operating manual — all in one, written in a format AIs actually follow.

---

## How to use it

**Recommended ChatGPT / capable web-AI path:**
1. Start a new chat.
2. Say: *"Read https://ctrl.mstep.org/ACTIVATE.md and activate the full CTRL stack, then continue with my task."*
3. Describe the project normally.

That path progressively boots CTRL-AI governance, R&Duck operation, and task-selected Agents of AI methods through the Showrunner harness. It does **not** preload the full libraries.

**R&Duck only:** say *"Read https://rd.mstep.org/ACTIVATE.md and activate R&Duck, then continue with my task."*

**Persistent ChatGPT instructions:** use `BEHAVIOR_CHATGPT.md`. Skill-aware runtimes may use `activation/rduck/SKILL.md`. ARD-aware clients can discover the public bootstrap through `/.well-known/ai-catalog.json`.

**Compatibility fallback:** if the AI cannot follow progressive links, paste `AGENTS.md` or use `llms-full.txt`. The full bundle remains supported, but it is no longer the preferred activation path.


## The commands you'll use most

Once activated, you talk to it normally. But these shortcuts help:

| Type this | What happens |
|---|---|
| `P` | Proceed to the next step |
| `DA` | Quick devil's-advocate check — what's wrong with this? |
| `SPAR` | Auto-assembles a review panel, gives you a verdict |
| `BENCH` | Full adversarial review — use before anything high-stakes |
| `DUCK_REFLECT` | Extracts lessons from this session for next time |

---

## How it's structured

```
core/           The foundation — activation, rules, routing, memory, review
capabilities/   What it can do — write, research, audit, strategize, code, and RRED
                (RRED is a special protocol for legal/adversarial communication)
domains/        8 areas of expertise, loaded one at a time
libraries/      Specialist personas, audience profiles, writing registers
workers/        Sub-agents it can dispatch for specific tasks
specs/          Governance and component management
research/       Decision history — 44 entries showing why everything is the way it is
```

The `research/evolution-ledger.md` is worth reading if you want to understand why specific decisions were made — or why some ideas were tried and rejected.

---

## Version history at a glance

| Version | What changed |
|---|---|
| **1.9.0** | Progressive activation, Showrunner harness/Superuser routing, Spirit Pass, Trajectory Quorum and ARD discovery; full bundle becomes compatibility fallback |
| **1.8.0** | Reconciles the v0.5 package into current owners; adds executable behavior-contract validation and the three real-project A/B scenarios; repairs registry/feedback/build drift |
| **1.7.0** | Direct Status, quiet orchestration, real-transfer-only handoffs, and repair-first verifier integrity |
| **1.0.3** | Integrity release: CI conformance gate (`conform.sh`), MIT LICENSE file, single-sourced VERSION, dead-link/slug fixes, llms-full regeneration |
| **1.0.2** | Security additions: prompt injection trifecta check, safe-ingest worker, PROVEN code gate, drift detection |
| **1.0.1** | Site auto-deploy: every push rebuilds `rd.mstep.org` automatically |
| **1.0.0** | First full release: 36 files, DA/SPAR/BENCH review, DUCK_BUILD institutional memory |

Full history: [CHANGELOG.md](CHANGELOG.md)

Behavior/package validation: [tests/README.md](tests/README.md) — includes the v0.5 compatibility map and live A/B protocol.

---

## What R&Duck doesn't promise

It reduces drift. It doesn't eliminate it. It labels its own self-review as biased. It tells you when it's uncertain instead of pretending.

The honest version is in [CLAIM_BOUNDARY.md](CLAIM_BOUNDARY.md).

*Shields reduce damage. Not immunity. Not hubris. Just prudence.*

---

## The AI Duct Tape Collection

The future showed up early and forgot the manual. Everything's brilliant, nothing's finished, and half of it forgets your name between Tuesday and Wednesday. These are the strips of duct tape — free, because the parts that hold your work together shouldn't cost a subscription.

They work on their own. Use one, or tape a few together:

- **[CTRL-FORGE](https://github.com/MShneur/ctrl-forge)** — Your AI forgot everything. Again. This is the repo that didn't.
- **[CTRL-AI](https://github.com/MShneur/CTRL-AI)** — Teaches your AI to say "I'm not sure" instead of confidently inventing a citation.
- **[R-Duck](https://github.com/MShneur/R-Duck)** *(this repo)* — Autopilot. You mumble an idea, it hands back a plan with a straight face.
- **[Agents of AI](https://github.com/MShneur/Agents-of-AI)** — A cast of specialists. No coffee, no PTO, no LinkedIn updates.
- **[Ghost in the Loop](https://github.com/MShneur/ghost-in-the-loop)** — Moves work between AIs without dropping it down the stairs. Full chat export, handoffs.
- **[Control Walkthrough](https://github.com/MShneur/Ctrl-Walkthrough)** — The hands. It finds the page, clicks the safe buttons, fills the boring fields, verifies the result, and gets out of the way.

Each keeps its own license — don't assume they match.

---

## License

MIT — use it, fork it, improve it. If you improve it, the [evolution ledger](research/evolution-ledger.md) pattern means your improvements won't get lost.

[github.com/MShneur/R-Duck](https://github.com/MShneur/R-Duck) · `rd.mstep.org`
