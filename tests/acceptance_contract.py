#!/usr/bin/env python3
"""Deterministic R&Duck package acceptance checks.

These checks verify that the current repository wires the behavioral contracts
described by the historical v0.5 package into the maintained v1.x owners.
They do not prove that R&Duck outperforms a default model on live projects.
"""
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
FAILURES = []
PASSES = []

def read(path):
    return (ROOT / path).read_text(encoding="utf-8")

def require(name, path, needles):
    text = read(path)
    missing = [n for n in needles if n not in text]
    if missing:
        FAILURES.append(f"{name}: {path} missing {missing}")
    else:
        PASSES.append(name)

def require_true(name, condition, detail):
    if condition:
        PASSES.append(name)
    else:
        FAILURES.append(f"{name}: {detail}")

# v0.5 behavior contracts, mapped into the current architecture.
require("activation-failure", "core/boot.md", [
    "DEMONSTRATED fetch this session",
    "Fail → T0 DEGRADED",
    "never claim full activation when degraded",
])
require("specifics-persistence", "core/runtime.md", [
    "key_specifics",
    "## RE-ANCHOR PROTOCOL",
    "Never answer generic when user gave specifics",
])
require("handoff-verbatim-restart", "core/continuity.md", [
    "## HANDOFF FORMAT (dual: structured + verbatim)",
    "verbatim_goal:",
    "verbatim_constraints:",
    "## LOAD SEQUENCE",
])
require("audit-bias", "core/review.md", [
    "SELF-CONFIRMATION",
    "⚠ INTERNAL BIASED REVIEW",
    "Architecture / governance changes   → BENCH + external model recommended",
])
require("runtime-honesty", "core/runtime.md", [
    "FAST:",
    "MANDATORY live verification",
    "## HONEST LIMITS",
    "NOT_TESTED",
])
require("anti-bloat", "core/voice.md", [
    "Depth is requested, never assumed.",
    "Never volunteer the long form.",
    "five bullets, one line each",
])
require("second-lens-routing", "capabilities/audit.md", [
    "TIER_EXTERNAL_RECOMMENDED",
    "Will not call same-model review \"independent.\"",
])
require("self-correction-memory", "core/continuity.md", [
    "DUCK_REFLECT",
    "DUCK_RELOAD",
    "B1_stable_preferences",
    "B2_persistent_corrections",
])
require("feedback-owner", "research/feedback.md", [
    "See core/continuity.md for protocol",
])

# No resurrection of the obsolete ten-file root package.
legacy = [
    "bootloader.md", "prime-agent.md", "audit.md", "handoff.md",
    "limitations.md", "ledger.md", "acceptance-tests.md", "feedback.md",
    "ctrl_reflect.md", "ctrl_reload_feedback.md",
]
present = [p for p in legacy if (ROOT / p).exists()]
require_true("no-duplicate-v05-root-modules", not present,
             f"obsolete root modules present: {present}")

# Registry must match the current maintained architecture.
registry = read("specs/governance-gate.md")
core_count = len(list((ROOT / "core").glob("*.md")))
spec_count = len(list((ROOT / "specs").glob("*.md")))
worker_text = read("workers/worker-templates.md")
worker_count = len(re.findall(r"^### Worker \d+:", worker_text, re.M))
require_true("component-registry-counts",
             f"CORE ({core_count} files):" in registry
             and f"SPECS ({spec_count}):" in registry
             and f"worker-templates ({worker_count} types)" in registry,
             f"registry drift: core={core_count}, specs={spec_count}, workers={worker_count}")

# The package builder must not duplicate an always-loaded core file.
build = read("build.sh")
line = next((l for l in build.splitlines()
             if l.startswith("for f in core/boot.md core/rules.md")), "")
require_true("single-autocast-in-full-bundle",
             line.split().count("core/autocast.md") == 1,
             "build.sh llms-full core list must contain core/autocast.md exactly once")

# Historical v0.5 live-validation scenarios remain an explicit non-theater gate.
plan = read("tests/README.md")
for label in ("Validation 1 — Legal-ish complaint",
              "Validation 2 — Research project",
              "Validation 3 — Writing task"):
    require_true("scenario-" + label.split("—")[1].strip().lower().replace(" ", "-"),
                 label in plan, f"tests/README.md missing {label}")
require_true("no-false-outperformance-claim",
             "Do not claim R&Duck outperforms default AI until" in plan,
             "live A/B claim boundary missing")

total = len(PASSES) + len(FAILURES)
if FAILURES:
    print(f"R&Duck package acceptance: FAIL ({len(PASSES)}/{total} passed)")
    for item in FAILURES:
        print(f"  FAIL {item}")
    sys.exit(1)

print(f"R&Duck package acceptance: PASS ({len(PASSES)}/{total})")
for item in PASSES:
    print(f"  PASS {item}")
