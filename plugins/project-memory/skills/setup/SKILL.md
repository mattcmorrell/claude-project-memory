---
name: setup
description: Set up long-term memory in this project. Creates INTENT.md and KNOWLEDGE.md and wires them into CLAUDE.md (or CLAUDE.local.md in shared repos) so they load every session. Use when the user asks to set up project memory, INTENT.md, or KNOWLEDGE.md.
---

# Set up project memory

The files you need are in this skill's `templates/` folder:
- `claude-md-block.md`: the instructions block that goes into CLAUDE.md
- `INTENT.md`, `KNOWLEDGE.md`: blank starting files
- `example-INTENT.md`: a real, good INTENT.md. It's the quality bar for every INTENT.md you write.

## 1. Decide: shared or private

Check who commits to this repo:

```bash
git rev-parse --is-inside-work-tree && git log --format='%ae' | sort -u
```

- **Only the user commits, or there's no git history**: **shared mode.** The block goes in
  `CLAUDE.md`, and the memory files get committed like anything else.
- **Other people commit** (it's an engineering or team repo): **private mode.** The block
  goes in `CLAUDE.local.md`. Add `CLAUDE.local.md`, `INTENT.md`, and `KNOWLEDGE.md` to
  `.git/info/exclude`, not `.gitignore`. Editing `.gitignore` would be a change the
  whole team sees. Claude Code asks permission before touching `.git`, so first tell the
  user in one line: "Next I'll ask to hide these files from git so they never get
  committed. Please allow it." Then run (skipping names already listed):
  `printf 'CLAUDE.local.md\nINTENT.md\nKNOWLEDGE.md\n' >> .git/info/exclude`
- **Not a git repo**: shared mode.

Tell the user which mode you picked and why in one sentence, and that they can say
"switch" to flip it. Don't ask first.

In private mode, if `INTENT.md` or `KNOWLEDGE.md` is already tracked by git
(`git ls-files INTENT.md KNOWLEDGE.md`), stop and ask. Someone else may rely on those files.

## 2. Create or keep the memory files

For each of `INTENT.md` and `KNOWLEDGE.md` at the repo root:
- **Missing**: copy the blank template.
- **Already exists**: keep it. Don't overwrite. Skim it. If it's clearly stale (work that
  looks finished) or over ~100 lines, mention that in one line at the end.

If the user has work going on right now (it's clear from the conversation or they say so),
fill in INTENT.md's Goal and Current direction from what you know, matching the depth of
`example-INTENT.md`. Otherwise leave the template blank.

## 3. Add the instructions block

Target file: `CLAUDE.md` (shared) or `CLAUDE.local.md` (private). Create it if missing.

- If it already has a `## Project memory` section, replace that section with the template.
- Otherwise append the template block to the end.
- If it has older INTENT.md or knowledge-file instructions elsewhere, point them out and
  offer to remove them. Two sets of rules that contradict each other make Claude pick one at random.

## 4. Report

Two to four plain lines: the mode, which files were created or kept, where the block went,
and that `/project-memory:wrap-up` is the command to run at the end of a work session.
Don't commit anything.
