#!/usr/bin/env bash
# Content gates for this repository. Run by the Council pre-push hook, and runnable by anyone:
#   bash scripts/pre-push-gates.sh
# Offline and deterministic. Fails closed on any hit.
set -uo pipefail
cd "$(dirname "$0")/.." || exit 1
fail=0
TEXT_FILES=$(git ls-files '*.md' '*.json' | grep -v '^LICENSE$')

# 1. The manifest parses and points at the free, read-only endpoint only.
python3 - <<'PY' || fail=1
import json, sys
m = json.load(open("gemini-extension.json"))
errs = [k for k in ("name", "version", "description", "mcpServers") if k not in m]
urls = [s.get("httpUrl") or s.get("url") for s in m.get("mcpServers", {}).values()]
if urls != ["https://councilof.ai/mcp/free"]:
    errs.append(f"mcpServers must be exactly the free endpoint, got {urls}")
if len(m.get("description", "")) > 100:
    errs.append("description over 100 characters")
if m.get("contextFileName") and not __import__("os").path.exists(m["contextFileName"]):
    errs.append(f"contextFileName {m['contextFileName']} missing")
if errs:
    print("gate: gemini-extension.json:", "; ".join(errs)); sys.exit(1)
print("gate: gemini-extension.json ok")
PY

# 2. Doctrine words: we measure; we never certify. No superlatives, no safety claims.
hits=$(grep -n -i -E '\b(certif[a-z]*|compliant|compliance|accredit[a-z]*|safe|best|leading)\b' $TEXT_FILES || true)
if [ -n "$hits" ]; then echo "gate: banned words:"; echo "$hits"; fail=1; else echo "gate: no banned words"; fi

# 3. No public prices.
hits=$(grep -n -E '(US\$|\$|€|£)[ ]?[0-9]' $TEXT_FILES || true)
if [ -n "$hits" ]; then echo "gate: price-like strings:"; echo "$hits"; fail=1; else echo "gate: no prices"; fi

# 4. No frozen counts that go stale: tool and board counts come from the live server.
hits=$(grep -n -i -E '\b[0-9]{1,3} +(free +|read-only +|paid +)?(mcp +)?tools\b|\b[0-9]{1,3} +ax(is|es)\b' $TEXT_FILES || true)
if [ -n "$hits" ]; then echo "gate: frozen counts:"; echo "$hits"; fail=1; else echo "gate: no frozen counts"; fi

[ $fail -eq 0 ] && echo "gate: PASS" || echo "gate: FAIL"
exit $fail
