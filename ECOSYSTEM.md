# Ecosystem Role — R&Duck

## Read this first

This repository is the **AUTOPILOT** in the CTRL / R&Duck / Agents-of-AI stack.

```text
CTRL-AI       = GOVERNOR  — policy, evidence standards, choices, gates, uncertainty
R&Duck        = AUTOPILOT — turns intent into a running project; plans, dispatches, executes, verifies
Agents of AI  = SUBSTRATE — reusable expertise, methods, workflows, skills, protocols, adapters, runtime primitives
Origin        = R&D LAB   — a section inside Agents of AI that discovers and distills emerging foundations
```

When combined:

```text
USER
  ↓
CTRL-AI      policy / choices / consequence gates
  ↓
R&Duck       Prime / orchestration / project autopilot
  ↓
Agents of AI cast + methods + capabilities + substrate primitives
  ↓
tools / runtimes / external systems
```

## R&Duck owns

- turning fuzzy intent into an executable project outcome;
- Strategic Brief / project state;
- Prime Agent coordination;
- decomposition and worker lanes;
- dispatch, handoff, integration, restartability, and continuity;
- execution sequencing;
- progress tracking;
- verification orchestration;
- escalating consequential decisions to the human according to the active governance/operational policy;
- getting the project from start to finish with as little expert knowledge required from the user as practical.

## R&Duck does not own

### Not the general governance library

R&Duck keeps the minimum invariants needed for a safe, truthful autopilot. It should not duplicate CTRL-AI's broader user-facing governance, policy-option, evidence, and choice framework.

When CTRL-AI is explicitly active, CTRL-AI owns overlapping policy/choice gates. R&Duck remains Prime and executes within those decisions.

### Not the capability substrate

R&Duck should not accumulate copies of every persona, specialist method, agent workflow, skill, protocol, adapter, or execution primitive.

Those belong in Agents of AI. R&Duck selects/loads them when a project needs them.

## Operating rule

A novice user should be able to say what they want built. R&Duck should determine the project shape, assemble the required capability from Agents of AI, perform reversible work autonomously within scope, and ask the human only at genuine consequence/authority gates.

## Collision rule

1. **Policy / user choice / consequence gate** → CTRL-AI.
2. **Project lifecycle / dispatch / continuation / autonomous completion** → R&Duck.
3. **Reusable method / capability / protocol / skill / execution primitive** → Agents of AI.
4. Keep bridges thin; reference the canonical owner rather than duplicating content.
