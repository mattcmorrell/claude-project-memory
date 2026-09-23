#!/bin/bash
# Offers project-memory setup once per project. Silent if already set up or already offered.

dir="${CLAUDE_PROJECT_DIR:-$(pwd)}"
root=$(git -C "$dir" rev-parse --show-toplevel 2>/dev/null || echo "$dir")

missing=()
[ -f "$root/INTENT.md" ] || missing+=("INTENT.md")
[ -f "$root/KNOWLEDGE.md" ] || missing+=("KNOWLEDGE.md")
grep -qs "^@INTENT.md" "$root/CLAUDE.md" "$root/CLAUDE.local.md" "$root/.claude/CLAUDE.md" \
  || missing+=("the CLAUDE.md link that loads them")

[ ${#missing[@]} -eq 0 ] && exit 0

data="${CLAUDE_PLUGIN_DATA:-$HOME/.claude/project-memory}"
mkdir -p "$data"
offered="$data/offered.txt"
grep -qxF "$root" "$offered" 2>/dev/null && exit 0
echo "$root" >> "$offered"

list=$(IFS=,; echo "${missing[*]}" | sed 's/,/, /g')
cat <<EOF
Project memory isn't set up in this project yet (missing: $list).
In your first reply, offer in one plain sentence to set it up, for example:
"This project doesn't have memory files yet. Want me to set them up so I remember our work between sessions?"
If the user's first message asks for something else, do that first and add the offer at the end.
If they say yes, run the project-memory:setup skill. Offer only this once; don't bring it up again.
EOF
