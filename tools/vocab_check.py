#!/usr/bin/env python3
"""vocab_check.py — enforce specs/vocabulary.md with a one-way ratchet.

Does not fail on pre-existing uses. Fails when a scope's count goes UP, which
means a new violation was introduced. When a scope improves, the baseline
tightens to match, so gains cannot be lost later.

Terms are parsed from specs/vocabulary.md — the spec is the single source, and
this script holds no word list of its own.

Usage:
  python3 tools/vocab_check.py             # verify against baseline
  python3 tools/vocab_check.py --report    # per-term detail, no pass/fail
  python3 tools/vocab_check.py --adopt     # write current counts as baseline
"""
import json
import os
import re
import sys
import pathlib

SPEC = pathlib.Path("specs/vocabulary.md")
BASELINE = pathlib.Path("tools/vocab_baseline.json")
SCOPES = ["core", "capabilities", "specs", "domains"]
# Instruction text only. Rationale prose and history are out of scope by design.
EXCLUDE = {"specs/vocabulary.md"}


def terms():
    """Parse the approved/forbidden table out of the spec."""
    rows = re.findall(r"^\|\s*[^|]+\|\s*\*\*([a-z]+)\*\*\s*\|[^|]*\|\s*([^|]+)\|",
                      SPEC.read_text(), re.M)
    if not rows:
        sys.exit("ERROR: no term table found in specs/vocabulary.md")
    return {approved: [w.strip() for w in bad.split(",") if w.strip()]
            for approved, bad in rows}


def count(scope, table):
    total = 0
    detail = {}
    for f in sorted(pathlib.Path(scope).glob("*.md")):
        if str(f) in EXCLUDE:
            continue
        text = f.read_text().lower()
        for approved, bad in table.items():
            for w in bad:
                n = len(re.findall(rf"\b{re.escape(w)}\b", text))
                if n:
                    total += n
                    detail[w] = detail.get(w, 0) + n
    return total, detail


def main():
    mode = sys.argv[1] if len(sys.argv) > 1 else ""
    table = terms()
    base = json.loads(BASELINE.read_text()) if BASELINE.exists() else {}
    counts = {}
    detail_all = {}
    for s in SCOPES:
        if pathlib.Path(s).is_dir():
            counts[s], detail_all[s] = count(s, table)

    if mode == "--report":
        for s, n in counts.items():
            print(f"  {s+'/':<16} {n:>4}  (baseline {base.get(s, '—')})")
            for w, c in sorted(detail_all[s].items(), key=lambda x: -x[1])[:6]:
                print(f"      {w:<12} {c}")
        return 0

    if mode == "--adopt":
        BASELINE.write_text(json.dumps(counts, indent=1, sort_keys=True) + "\n")
        print(f"      baseline adopted: {counts}")
        return 0

    failed = False
    tightened = {}
    for s, n in counts.items():
        b = base.get(s)
        if b is None:
            tightened[s] = n
            print(f"      {s+'/':<16} {n:>4}  new scope — baseline set")
        elif n > b:
            print(f"      {s+'/':<16} {n:>4}  ✗ ROSE from {b} — a new forbidden term entered")
            worst = sorted(detail_all[s].items(), key=lambda x: -x[1])[:3]
            print(f"          most used: {', '.join(f'{w} x{c}' for w, c in worst)}")
            failed = True
            tightened[s] = b
        else:
            tightened[s] = n
            arrow = f"↓ from {b}" if n < b else "held"
            print(f"      {s+'/':<16} {n:>4}  {arrow}")

    if not failed and tightened != base:
        BASELINE.write_text(json.dumps(tightened, indent=1, sort_keys=True) + "\n")

    total = sum(counts.values())
    print(f"      total {total} across {len(counts)} scopes | ratchet turns one way only")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
