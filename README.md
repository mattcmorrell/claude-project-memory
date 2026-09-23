# Project Memory for Claude Code

Claude starts every session with no memory of the last one. This plugin gives it
long-term memory in two plain files that live in your project.

## Install (once)

In Claude Code:

```
/plugin marketplace add BambooHR/claude-project-memory
/plugin install project-memory@design-team
```

## Use

| When | Run |
|---|---|
| First time in a project | `/project-memory:setup` |
| End of a work session | `/project-memory:wrap-up` |

That's it. After setup, Claude reads both files automatically at the start of every
session and after `/compact`.

## The two files

**INTENT.md: the work in progress.** It keeps the "why" behind a piece of work alive when
Claude's memory of the chat gets compressed or a new session starts. It holds the goal and
the feel you're after, the current approach, what's done, what you rejected (so Claude
doesn't pitch it again), open questions, and next steps. When the work is finished,
wrap-up asks before clearing it, so a stale file doesn't mislead the next session.

**KNOWLEDGE.md: hard-won facts.** Things that were painful to learn and costly to rediscover:
gotchas, how things really behave, background context, corrections to wrong assumptions.
This file outlives any single piece of work.

## What makes a good INTENT.md

- **The goal says the feel, not just the task.** "Tokens are intelligence, not a scarce
  resource" steers a hundred small choices. "Build a 14-slide deck" steers none.
- **Every rejected idea says why.** "Tried reveal.js" is useless. "Tried reveal.js, fought
  its CSS, went custom" stops Claude from suggesting it again.
- **One piece of work at a time.** A file covering two things ends up half stale.

See [`example-INTENT.md`](plugins/project-memory/skills/setup/templates/example-INTENT.md)
for a real one.

## Working in an engineering repo?

Setup checks whether other people commit to the repo. If they do, it keeps everything
private: the instructions go in `CLAUDE.local.md`, and none of the files get committed.
Say "switch" if it picks wrong.
