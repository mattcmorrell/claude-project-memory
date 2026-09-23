#!/bin/bash
# Third-party marketplaces don't auto-update by default, so pull updates ourselves, at most once a day.

# Desktop-app-only users may not have `claude` on PATH, so prefer the binary that launched this hook.
claude="$CLAUDE_CODE_EXECPATH"
[ -x "$claude" ] && [ -f "$claude" ] || claude=$(command -v claude)
[ -n "$claude" ] || claude=$(ls -d "$HOME/Library/Application Support/Claude/claude-code/"*/claude.app/Contents/MacOS/claude 2>/dev/null | sort -V | tail -1)
[ -n "$claude" ] || exit 0

data="${CLAUDE_PLUGIN_DATA:-$HOME/.claude/project-memory}"
mkdir -p "$data"
stamp="$data/last-update-check"
[ -n "$(find "$stamp" -mmin -1440 2>/dev/null)" ] && exit 0
touch "$stamp"

nohup "$claude" plugin marketplace update design-team >"$data/last-update.log" 2>&1 </dev/null \
  && nohup "$claude" plugin update project-memory@design-team >>"$data/last-update.log" 2>&1 </dev/null &
exit 0
