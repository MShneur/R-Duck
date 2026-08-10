#!/bin/bash
# R&Duck Conformance Gate — governance applied to the repo itself.
# Runs in CI before every deploy (see .github/workflows/deploy.yml) and locally: ./conform.sh
# Philosophy: "the largest failure is runtime governance persistence, not conceptual quality."
# A rule that is not mechanically enforced will drift. These checks enforce AU-01/AU-02,
# AG-03, G25, and AD-04 against the repository's own contents.
#
# Exit 0 = SHIP. Exit 1 = blocked, fix listed ✗ items.

set -u
FAIL=0
pass() { printf '  ✓ %s\n' "$1"; }
fail() { printf '  ✗ %s\n' "$1"; FAIL=1; }
warn() { printf '  ⚠ %s\n' "$1"; }

echo "R&Duck CONFORMANCE GATE"
echo "═══════════════════════"

# ── C1: VERSION single source ──────────────────────────────────────────────
if [ -f VERSION ] && grep -qE '^[0-9]+\.[0-9]+\.[0-9]+$' VERSION; then
  V=$(cat VERSION); pass "C1 VERSION file present: $V"
else
  fail "C1 VERSION file missing or not semver"; V="0.0.0"
fi

# ── C2: version consistency across canonical surfaces ─────────────────────
echo "— C2 version consistency —"
chk_ver() { # file, pattern-with-$V
  if grep -qF "$2" "$1" 2>/dev/null; then pass "C2 $1"; else fail "C2 $1 does not contain '$2'"; fi
}
chk_ver README.md      "Version: $V"
chk_ver core/boot.md   "version: $V"
chk_ver llms.txt       "# R&Duck v$V"
chk_ver llms.txt       "version: $V"
chk_ver AGENTS.md      "v$V"

# ── C3: CHANGELOG covers current version ───────────────────────────────────
if grep -q "## v$V" CHANGELOG.md 2>/dev/null; then pass "C3 CHANGELOG has v$V entry"
else fail "C3 CHANGELOG.md missing '## v$V' entry"; fi

# ── C4: LICENSE exists (three files claim MIT) ─────────────────────────────
if [ -f LICENSE ] && grep -q "MIT License" LICENSE; then pass "C4 LICENSE present (MIT)"
else fail "C4 LICENSE file missing — repo claims MIT in llms.txt/boot.md/README"; fi

# ── C5: banned dead repo slug ──────────────────────────────────────────────
BAD_SLUG="MShneur/r""duck"   # split so this script never matches itself
HITS=$(grep -rn --exclude-dir=.git --exclude=conform.sh "$BAD_SLUG" . 2>/dev/null || true)
if [ -z "$HITS" ]; then pass "C5 no dead repo-slug references"
else fail "C5 dead repo slug found:"; echo "$HITS" | sed 's/^/      /'; fi

# ── C6: committed llms-full.txt freshness ──────────────────────────────────
# build.sh regenerates llms-full at deploy, but the COMMITTED copy is what clones
# and raw.githubusercontent readers receive. Stale committed copy = stale governance.
if bash build.sh llms-only >/dev/null 2>&1; then
  if git diff --quiet -- llms-full.txt 2>/dev/null; then
    pass "C6 committed llms-full.txt matches fresh regeneration"
  else
    fail "C6 llms-full.txt is STALE — run ./build.sh and commit the regenerated file"
  fi
else
  fail "C6 build.sh llms-only failed"
fi

# ── C7: llms.txt path integrity ────────────────────────────────────────────
echo "— C7 llms.txt path integrity —"
C7_OK=1
while read -r p; do
  [ -f ".$p" ] || { fail "C7 llms.txt lists missing file: $p"; C7_OK=0; }
done < <(grep -oE '^/[a-z-]+/[A-Za-z._-]+\.(md|txt)' llms.txt)
[ "$C7_OK" = 1 ] && pass "C7 all parseable llms.txt paths resolve"

# ── C8: G25 front-matter lint (capabilities + domains) ─────────────────────
# G25 / specs/governance-gate.md: every component declares id, type, activation,
# trigger, purpose, anti-goal, output-schema. Domains use domain-id/domain-type
# naming (accepted as equivalent — predates the gate).
echo "— C8 G25 front-matter lint —"
C8_OK=1
for f in capabilities/*.md domains/*.md; do
  fm=$(awk '/^---$/{n++; next} n==1{print} n==2{exit}' "$f")
  miss=""
  echo "$fm" | grep -qE '^(component|domain)-id:'   || miss="$miss id"
  echo "$fm" | grep -qE '^(component|domain)-type:' || miss="$miss type"
  for field in activation trigger purpose anti-goal output-schema; do
    echo "$fm" | grep -q "^$field:" || miss="$miss $field"
  done
  [ -n "$miss" ] && { fail "C8 $f missing:$miss"; C8_OK=0; }
done
[ "$C8_OK" = 1 ] && pass "C8 all 14 components pass G25 front-matter lint"

# ── C9: rule-ID resolution (AG-03 — rules.md is single policy source) ──────
echo "— C9 rule-ID resolution —"
DEFINED=$(grep -ohE '^((AU|TS|OD|HC|PI|MR|AD|AG|LR)-[0-9]{2}|LOCK-[0-9]|G(1[5-9]|2[0-5])):' core/rules.md | tr -d ':' | sort -u)
REFERENCED=$(grep -rhoE '\b((AU|TS|OD|HC|PI|MR|AD|AG|LR)-[0-9]{2}|LOCK-[0-9]|G(1[5-9]|2[0-5]))\b' \
  --include='*.md' --include='*.txt' --exclude-dir=.git . | sort -u)
C9_OK=1
while read -r id; do
  [ -z "$id" ] && continue
  echo "$DEFINED" | grep -qx "$id" || { fail "C9 referenced but undefined in rules.md: $id"; C9_OK=0; }
done <<< "$REFERENCED"
[ "$C9_OK" = 1 ] && pass "C9 every referenced rule ID resolves to core/rules.md"

# ── C11: autocast id resolution (AG-10 — cast names must exist) ────────────
# Turn-1 audit found AoA had outgrown both integration maps. This check makes that
# class of drift a build failure instead of a discovery. Local ids are enforced
# offline; aoa: ids are checked against the live library when the network allows.
echo "— C11 autocast id resolution —"
if python3 - <<'C11PY'
import re,sys,pathlib,urllib.request,json
cast=pathlib.Path('core/autocast.md').read_text()
extra=pathlib.Path('core/runtime.md').read_text()
pers=pathlib.Path('libraries/personas.md').read_text()
local={m.group(1) for m in re.finditer(r'^([a-z_]+):\s', pers.split('INCLUDED PERSONAS')[1], re.M)}
rows=[l for l in cast.splitlines() if l.startswith('|') and not l.startswith('|---') and 'Task signal' not in l]
ul=set(); ua=set()
for r in rows:
    cells=[c.strip() for c in r.strip('|').split('|')]
    for c in cells[1:3]:
        ua|=set(re.findall(r'`aoa:([a-z0-9-]+)`', c))
        ul|=set(re.findall(r'(?<!`)\b([a-z_]{4,})\b(?!`)', re.sub(r'`aoa:[a-z0-9-]+`','',c)))
ua|=set(re.findall(r'`aoa:([a-z0-9-]+)`', extra))
ul-={'and','the'}
bad=sorted(ul-local)
if bad:
    print("      local persona ids not in libraries/personas.md: "+", ".join(bad)); sys.exit(1)
try:
    import os
    u="https://api.github.com/repos/MShneur/Agents-of-AI/git/trees/main?recursive=1"
    rq=urllib.request.Request(u)
    tok=os.environ.get("GITHUB_TOKEN") or os.environ.get("GH_TOKEN")
    if tok: rq.add_header("Authorization","token "+tok)
    d=json.load(urllib.request.urlopen(rq,timeout=10))
    live={m.group(2) for m in (re.match(r'(agents|personas|modes|teams|techniques|workflows|failures)/(.+)\.md$',t['path']) for t in d['tree']) if m}
    ba=sorted(ua-live)
    if ba:
        print("      aoa: ids missing from live library: "+", ".join(ba)); sys.exit(1)
    print(f"      {len(ul)} local + {len(ua)} aoa ids resolve (live library: {len(live)})")
except Exception as e:
    print(f"      local ids OK; aoa: check skipped (offline: {type(e).__name__})")
sys.exit(0)
C11PY
then pass "C11 autocast ids resolve"; else fail "C11 autocast references an id that does not exist"; fi

# ── C10: instruction ceiling (AD-04 — WARN only) ───────────────────────────
echo "— C10 instruction ceiling —"
if python3 tools/instruction_count.py; then
  warn "C10 band above. AD-04 bounds instructions, not lines — a line count overstates by 60-95%."
else
  fail "C10 always-loaded path exceeds the AD-04 instruction ceiling"
fi

echo "═══════════════════════"
if [ "$FAIL" = 0 ]; then echo "VERDICT: SHIP ✓"; exit 0
else echo "VERDICT: BLOCKED ✗ — fix items above"; exit 1; fi
