# Publishing plugins to the team

How this repo ships plugins, so teammates can install with one paste and get updates without doing anything.

## How it's set up

- This repo is a **marketplace** called `design-team`. It's listed in `.claude-plugin/marketplace.json`.
- Each plugin lives in `plugins/<name>/`, with its own `.claude-plugin/plugin.json` (name, description, version).
- The repo is public, so anyone can install without GitHub access.

## Install (what teammates paste)

```
claude plugin marketplace add mattcmorrell/claude-project-memory && claude plugin install <plugin>@design-team
```

Then they restart Claude Code. For a shared repo, the `.claude/settings.json` snippet in the README installs it automatically when someone opens that repo.

## Updates: why the plugin updates itself

Claude Code turns auto-update **off** by default for marketplaces that aren't Anthropic's, and people won't turn it on. There's no setting in `marketplace.json` to change that, and the `"autoUpdate": true` settings option is only documented for company-wide managed settings.

So each plugin carries its own updater: `hooks/self-update.sh`, run by a `SessionStart` hook in `hooks/hooks.json`. Once a day, in the background, it runs:

```
claude plugin marketplace update design-team && claude plugin update <plugin>@design-team
```

To find `claude`, the script tries, in order: `$CLAUDE_CODE_EXECPATH` (the binary that ran the hook; undocumented but set today), `claude` on PATH, then the copy bundled in the Mac desktop app. Desktop-only users may have no `claude` command at all.

The update loads the next time Claude starts. The script's last output is in `~/.claude/plugins/data/<plugin>-design-team/last-update.log`.

**Adding a new plugin:** copy `plugins/project-memory/hooks/self-update.sh`, change `project-memory` to the new plugin's name, and add the hook entry to its `hooks.json`. Run it with `bash "..."` in the command, as project-memory does, so the file doesn't need to be marked executable.

## Shipping a change

1. Make the change inside `plugins/<name>/`.
2. **Bump `version` in that plugin's `plugin.json`.** Without a bump, nobody gets the change, including through the auto-updater.
3. Commit and push to `main`.
4. Update your own copy: `claude plugin marketplace update design-team && claude plugin update <plugin>@design-team`, then restart.

Changes to the README or this file don't need a bump. They live outside the plugin folder.

## Gotchas

- When Claude is running in a different project, its commands can read this repo but get blocked when they try to change it. Run git commands yourself with `! ...`, or open Claude in this repo.
