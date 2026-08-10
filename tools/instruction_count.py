#!/usr/bin/env python3
"""Count ACTIVE INSTRUCTIONS in R&Duck's always-loaded path (AD-04).

AD-04 bounds active instructions. conform.sh previously counted content-lines as
a proxy, which overstated by 60-95% and reported a false ceiling violation for
two releases. This counts directives instead.

Counted:     normative clauses, ID'd rules, bare imperatives, key: value
             directives, and each lookup-table row (one row = one dispatch).
             Fenced CONTENT counts — R&Duck states most directives inside fences.
Not counted: fence delimiters, headers, front matter, blank lines, prose.

Band: the low end treats a multi-field schema block as one instruction; the high
end counts each field. Both are printed. Neither is picked to flatter the result.
Exit 1 only if the low end exceeds the ceiling.
"""
import re, sys, pathlib

CEILING = 200
NORM  = re.compile(r"\b(must|never|always|do not|don't|cannot|forbidden|required|only|refuses?|halt)\b", re.I)
IMPER = re.compile(r'^\s*(?:[-*]|\d+[.)])\s*\S|^\s*[A-Z]{3,}\s')
KV    = re.compile(r'^\s*[A-Za-z_][A-Za-z_ /-]{2,30}:\s*\S')
IDRULE= re.compile(r'^([A-Z]{2}-\d{2}|LOCK-\d|G\d{2}):')
REF   = re.compile(r'^## (VOCABULARY|IDENTITY|REFERENCES|SESSION PROFILE|CORE FIELDS)')

def always_loaded():
    m = re.search(r'^## Core \(always loaded\)\n(.*?)(?=^## )',
                  pathlib.Path('llms.txt').read_text(), re.S | re.M)
    if not m:
        sys.exit("llms.txt has no '## Core (always loaded)' section")
    return [l.split()[0].lstrip('/') for l in m.group(1).splitlines() if l.startswith('/core/')]

def count(path):
    infm = fmdone = inref = False
    directives = rows = schema = 0
    for line in pathlib.Path(path).read_text().splitlines():
        t = line.strip()
        if t == '---' and not fmdone:
            infm = not infm
            if not infm:
                fmdone = True
            continue
        if infm:
            continue
        if t.startswith('## '):
            inref = bool(REF.match(t)); continue
        if t.startswith('```') or t.startswith('#') or not t or t.startswith('*GOV'):
            continue
        if t.startswith('|'):
            if not t.startswith('|--') and t.count('|') > 2:
                rows += 1
            continue
        if IDRULE.match(t) or NORM.search(t) or IMPER.match(line) or KV.match(line):
            if inref: schema += 1
            else:     directives += 1
    return directives, rows, schema

def main():
    files = always_loaded()
    td = tr = ts = 0
    for f in files:
        d, r, s = count(f); td += d; tr += r; ts += s
        print(f"      {f:<22} directives {d:>3}  rows {r:>3}  schema/glossary {s:>3}")
    lo = td + tr + len(files)
    hi = td + tr + ts
    verdict = ('OVER CEILING' if lo > CEILING else
               'AT EDGE — no headroom' if hi > CEILING else 'within ceiling')
    print(f"      BAND {lo}-{hi} instructions | AD-04 ceiling 150-{CEILING} | {verdict}")
    return 1 if lo > CEILING else 0

if __name__ == '__main__':
    sys.exit(main())
