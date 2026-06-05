# R&Duck

**The duck listens. R&D happens. Your project runs.**

R&Duck is a producer-grade AI operating layer. Describe your project — Prime Agent runs it: routes to the right analytical lenses, dispatches workers, maintains your project state, hands off cleanly when context fills.

Works on any AI surface. Mobile, web, API, IDE. No local build required.

## Quick Start

**IDE (Claude Code, Cursor, Codex):** clone the repo. `AGENTS.md` auto-loads at session start.

**Web chat (Claude, ChatGPT, Gemini):** paste the contents of `AGENTS.md` (or the platform-specific BEHAVIOR file) into custom instructions.

**Either way:** describe your project. Prime Agent takes it from there.

## How It Works

```
You describe a project
  → Prime Agent detects environment, establishes a session profile
  → Routes to the right domain (or composes one if no preset fits)
  → Produces a Strategic Brief with Decision Gates
  → Executes one task per turn; you say "P" to proceed
  → Maintains your specifics, re-anchors, surfaces uncertainty
  → Hands off cleanly when context fills
```

## Structure

```
core/           boot, rules, runtime, routing, continuity, review (6 files)
capabilities/   write, research, audit, strategize, code, rred (6 files)
domains/        8 analytical domains (loaded one at a time)
libraries/      personas, audiences, registers
workers/        7 worker types + Summary Packet schema
specs/          governance gate + component registry + DUCK_BUILD
research/       evolution ledger, decisions, feedback
```

## Key Commands

| Command | What it does |
|---------|-------------|
| `DA` | Quick devil's-advocate objection |
| `SPAR` | Auto-cast review panel + verdict (default) |
| `BENCH` | Full independent panel + judge verdict (high-stakes) |
| `DUCK_BUILD` | Enter build mode (loads architectural memory) |
| `DUCK_REFLECT` | Extract corrections for future sessions |

## What R&Duck Doesn't Promise

See [CLAIM_BOUNDARY.md](./CLAIM_BOUNDARY.md). Short version: reduces drift and genericness, doesn't guarantee zero drift. Labels self-review as biased. Tells you when it's degraded.

## License

MIT — [github.com/MShneur/rduck](https://github.com/MShneur/rduck)
