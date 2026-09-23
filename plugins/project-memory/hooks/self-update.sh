#!/bin/bash
# Third-party marketplaces don't auto-update by default, so pull updates ourselves, at most once a day.

command -v claude >/dev/null || exit 0

data="${CLAUDE_PLUGIN_DATA:-$HOME/.claude/project-memory}"
mkdir -p "$data"
stamp="$data/last-update-check"
[ -n "$(find "$stamp" -mmin -1440 2>/dev/null)" ] && exit 0
touch "$stamp"

nohup bash -c 'claude plugin marketplace update design-team && claude plugin update project-memory@design-team' \
  >"$data/last-update.log" 2>&1 </dev/null &
exit 0
