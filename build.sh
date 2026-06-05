#!/bin/bash
# R&Duck Site Builder — runs on every deploy via GitHub Actions
# Generates: index.html per directory + llms-full.txt
# Source .md files stay untouched. Generated files only exist on the deployed site.

set -e

# ═══════════════════════════════════════
# 1. Generate llms-full.txt (auto-concatenation)
# ═══════════════════════════════════════
echo "Generating llms-full.txt..."
cat > llms-full.txt << 'HEADER'
# R&Duck v1.0.0 — Full Protocol (Single-File Load)
# Auto-generated on every deploy. Do not edit manually.
# Individual files at the site root or via llms.txt index.
HEADER

# Core files first (in load order)
for f in core/boot.md core/rules.md core/runtime.md core/routing.md core/continuity.md core/review.md; do
  if [ -f "$f" ]; then
    echo "" >> llms-full.txt
    echo "# ════════════════════════════════════════" >> llms-full.txt
    echo "# FILE: $f" >> llms-full.txt
    echo "# ════════════════════════════════════════" >> llms-full.txt
    cat "$f" >> llms-full.txt
  fi
done

# Then capabilities, then specs
for dir in capabilities specs; do
  for f in "$dir"/*.md; do
    [ -f "$f" ] || continue
    echo "" >> llms-full.txt
    echo "# ════════════════════════════════════════" >> llms-full.txt
    echo "# FILE: $f" >> llms-full.txt
    echo "# ════════════════════════════════════════" >> llms-full.txt
    cat "$f" >> llms-full.txt
  done
done

echo "  llms-full.txt: $(wc -c < llms-full.txt) bytes"

# ═══════════════════════════════════════
# 2. Generate index.html pages
# ═══════════════════════════════════════
generate_index() {
  local dir="$1"
  local title="$2"
  local index_file="$dir/index.html"

  cat > "$index_file" << HTMLHEAD
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>R&Duck — $title</title>
<style>
body{font-family:system-ui,-apple-system,sans-serif;max-width:700px;margin:2rem auto;padding:0 1rem;color:#e0e0e0;background:#1a1a2e}
a{color:#64b5f6;text-decoration:none}a:hover{text-decoration:underline}
h1{font-size:1.4rem;border-bottom:1px solid #333;padding-bottom:.5rem}
h2{font-size:1.1rem;color:#90caf9;margin-top:1.5rem}
.file{display:block;padding:.4rem 0;border-bottom:1px solid #222}
.desc{color:#888;font-size:.85rem;margin-left:.5rem}
.nav{font-size:.9rem;color:#888;margin-bottom:1rem}
code{background:#2a2a3e;padding:.2rem .4rem;border-radius:3px;font-size:.85rem}
</style>
</head>
<body>
<h1>🦆 R&Duck — $title</h1>
HTMLHEAD

  # Add navigation
  if [ "$dir" != "." ]; then
    echo '<p class="nav"><a href="/">← Home</a></p>' >> "$index_file"
  fi

  # List subdirectories
  local has_dirs=false
  for d in "$dir"/*/; do
    [ -d "$d" ] || continue
    [[ "$d" == *".git/"* ]] && continue
    [[ "$d" == *".github/"* ]] && continue
    has_dirs=true
    local dirname=$(basename "$d")
    echo "<a class=\"file\" href=\"/$dirname/\">📁 $dirname/</a>" >> "$index_file"
  done

  # List files
  for f in "$dir"/*; do
    [ -f "$f" ] || continue
    local filename=$(basename "$f")
    [[ "$filename" == "index.html" ]] && continue
    [[ "$filename" == "build.sh" ]] && continue
    [[ "$filename" == ".nojekyll" ]] && continue

    local icon="📄"
    local desc=""
    case "$filename" in
      *.md) icon="📝";;
      *.txt) icon="📋";;
      *.json) icon="⚙️";;
      *.yml) icon="🔧";;
    esac

    # Extract first heading or description from .md files
    if [[ "$filename" == *.md ]]; then
      desc=$(head -5 "$f" | grep "^#" | head -1 | sed 's/^#* *//' | cut -c1-80)
    fi

    local relpath="$filename"
    if [ "$dir" != "." ]; then
      relpath="$filename"
    fi

    if [ -n "$desc" ]; then
      echo "<a class=\"file\" href=\"$relpath\">$icon $filename<span class=\"desc\"> — $desc</span></a>" >> "$index_file"
    else
      echo "<a class=\"file\" href=\"$relpath\">$icon $filename</a>" >> "$index_file"
    fi
  done

  cat >> "$index_file" << 'HTMLFOOT'
<p style="margin-top:2rem;font-size:.8rem;color:#555">
R&Duck v1.0.0 — Auto-generated directory. <a href="https://github.com/MShneur/R-Duck">GitHub</a>
</p>
</body>
</html>
HTMLFOOT

  echo "  Generated: $index_file"
}

echo "Generating index pages..."

# Root index — special (includes quick-start info)
cat > index.html << 'ROOTHTML'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>R&Duck — AI Operating Layer</title>
<style>
body{font-family:system-ui,-apple-system,sans-serif;max-width:700px;margin:2rem auto;padding:0 1rem;color:#e0e0e0;background:#1a1a2e}
a{color:#64b5f6;text-decoration:none}a:hover{text-decoration:underline}
h1{font-size:1.5rem;border-bottom:1px solid #333;padding-bottom:.5rem}
h2{font-size:1.1rem;color:#90caf9;margin-top:1.5rem}
.file{display:block;padding:.4rem 0;border-bottom:1px solid #222}
.desc{color:#888;font-size:.85rem;margin-left:.5rem}
code{background:#2a2a3e;padding:.2rem .4rem;border-radius:3px;font-size:.85rem}
.hero{background:#2a2a3e;padding:1rem;border-radius:8px;margin:1rem 0}
.hero p{margin:.3rem 0;font-size:.9rem}
</style>
</head>
<body>
<h1>🦆 R&Duck v1.0.0</h1>
<div class="hero">
<p><strong>The duck listens. R&amp;D happens. Your project runs.</strong></p>
<p>Producer-grade AI operating layer. Works on any AI surface.</p>
</div>

<h2>🤖 For AI Agents</h2>
<a class="file" href="llms.txt">📋 llms.txt<span class="desc"> — Progressive loading index (start here)</span></a>
<a class="file" href="llms-full.txt">📋 llms-full.txt<span class="desc"> — Full system, one file (~67KB)</span></a>
<a class="file" href="AGENTS.md">📝 AGENTS.md<span class="desc"> — Bootstrap with chain-load instructions</span></a>

<h2>📁 Protocol Files</h2>
<a class="file" href="core/">📁 core/<span class="desc"> — Boot, rules, runtime, routing, continuity, review</span></a>
<a class="file" href="capabilities/">📁 capabilities/<span class="desc"> — Write, research, audit, strategize, code, RRED</span></a>
<a class="file" href="domains/">📁 domains/<span class="desc"> — 8 analytical domains (load one at a time)</span></a>
<a class="file" href="libraries/">📁 libraries/<span class="desc"> — Personas, audiences, registers</span></a>
<a class="file" href="workers/">📁 workers/<span class="desc"> — 7 worker types + Summary Packet</span></a>
<a class="file" href="specs/">📁 specs/<span class="desc"> — Governance gate + component registry</span></a>
<a class="file" href="research/">📁 research/<span class="desc"> — Evolution ledger, decisions, feedback</span></a>

<h2>📄 Documentation</h2>
<a class="file" href="README.md">📝 README.md</a>
<a class="file" href="WIKI.md">📝 WIKI.md<span class="desc"> — Build notes &amp; contributor guide</span></a>
<a class="file" href="CHANGELOG.md">📝 CHANGELOG.md</a>
<a class="file" href="CLAIM_BOUNDARY.md">📝 CLAIM_BOUNDARY.md<span class="desc"> — What R&amp;Duck guarantees, attempts, refuses</span></a>

<h2>🔧 Platform-Specific</h2>
<a class="file" href="BEHAVIOR_CHATGPT.md">📝 ChatGPT<span class="desc"> — Custom instructions (≤1500 chars)</span></a>
<a class="file" href="BEHAVIOR_GEMINI.md">📝 Gemini<span class="desc"> — Gem instructions</span></a>

<p style="margin-top:2rem;font-size:.8rem;color:#555">
Auto-generated on every push. <a href="https://github.com/MShneur/R-Duck">GitHub</a> · MIT License
</p>
</body>
</html>
ROOTHTML
echo "  Generated: index.html (root)"

# Generate index for each subdirectory
for dir in core capabilities domains libraries workers specs research; do
  [ -d "$dir" ] && generate_index "$dir" "$dir/"
done

echo "Build complete."
