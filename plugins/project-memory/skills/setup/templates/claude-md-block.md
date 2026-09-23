## Project memory

Claude's long-term memory for this project lives in these files. They load every session:

@INTENT.md
@KNOWLEDGE.md

### INTENT.md: the work in progress
One piece of work at a time. Sections:
- **Goal**: what we're making and why, including the audience and the feel.
  Write it so someone new could make good small calls without asking.
- **Current direction**: the approach and why we chose it.
- **Done**: only what explains a choice. Don't list what's obvious from the files.
- **Rejected**: what was tried, why it failed, and what the user said.
- **Open questions** and **Next steps**.

Rules:
- Update after a milestone, not before. Rewrite sections so they're true now.
  Don't add a running log.
- Never re-suggest a rejected idea without naming it and saying what's different this time.
- When the work looks finished, move anything worth keeping into KNOWLEDGE.md,
  then ask the user before clearing INTENT.md back to its blank template.
- Keep it under ~100 lines. It loads every session.

### KNOWLEDGE.md: hard-won facts
Things that were painful to learn and costly to rediscover: gotchas, how things
really behave, background context, corrections to wrong assumptions.
- Only write what's been confirmed. Mark anything unconfirmed.
- Each entry: the fact, why it matters, and how we know (file, command, or source).
- Fix entries in place. Delete ones that turn out wrong.

### DECISIONS.md (optional: long or complex projects only)
Numbered, never edited after the fact: the decision, the date, why, and what was
ruled out. Check it before proposing changes in an area that's already decided.

When the user runs `/project-memory:wrap-up`, or a session ends after real work,
bring INTENT.md and KNOWLEDGE.md up to date.
