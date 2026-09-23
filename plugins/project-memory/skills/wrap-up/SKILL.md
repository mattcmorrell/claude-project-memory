---
name: wrap-up
description: End-of-session memory update. Brings INTENT.md up to date, moves hard-won lessons into KNOWLEDGE.md, and asks before clearing finished work. Use when the user says wrap up, we're done for now, save where we are, or end of session.
---

# Wrap up the session

Goal: the next session, or the next person, can pick this work up cold without
redoing anything or re-suggesting something already rejected.

If `INTENT.md` or `KNOWLEDGE.md` doesn't exist, tell the user to run
`/project-memory:setup` first, then stop.

For the quality bar, read `../setup/templates/example-INTENT.md` (next to this skill's
folder) if you haven't this session.

## 1. Look back over this session

Pull out:
- **What moved forward**, and why each choice was made.
- **What got rejected**: what was tried, why it failed, what the user said.
  These are the most valuable lines in the file. Never drop the "why."
- **Things learned the hard way**: gotchas, surprising behavior, facts you got wrong
  at first. These go to KNOWLEDGE.md, not INTENT.md.
- **Where things stand**: open questions, next steps.

## 2. Update INTENT.md

Rewrite each section so it's true right now. Don't add a dated log.
- **Goal**: change it only if the goal actually shifted. Keep the audience and the feel.
- **Done**: only what explains a choice. Cut anything obvious from the files themselves.
- **Rejected**: add new entries. Keep all old ones unless the user brought one back.
- Stay under ~100 lines. If it's over, compress Done first. Never cut Rejected reasons.

## 3. Update KNOWLEDGE.md

For each hard-won lesson:
- Only add what was confirmed this session. Mark anything unconfirmed.
- Write the fact, why it matters, and how we know (file, command, or source).
- If an entry on the same topic exists, update it in place. If an old entry turned out
  wrong, fix or delete it.

## 4. Is the work finished?

If the goal in INTENT.md looks done:
1. Make sure every lasting lesson is already in KNOWLEDGE.md.
2. Ask the user: "This looks finished. Clear INTENT.md so the next piece of work starts fresh?"
3. Only on a yes, reset INTENT.md to the blank template in `../setup/templates/INTENT.md`.

## 5. Report

Two to four plain lines: what changed in each file, and the one next step. Don't commit.
