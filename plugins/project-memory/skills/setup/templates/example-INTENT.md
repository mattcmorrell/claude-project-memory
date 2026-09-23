# Token Traction Slide Deck

## Goal
A ~10 minute recorded talk for the design team about Claude Code caching and cost.
The core reframe: **"Token Traction," not "Token Efficiency."** Tokens are intelligence
and work, not a scarce resource to ration. The audience is designers at mixed skill
levels who started on Max plans (flat fee) and now use Enterprise/API at work (pay per
token). It should feel confident and visual, with big numbers and few words. Not a lecture.

## Current direction
One self-contained HTML file with a tiny custom slide engine. Arrow keys move between
slides; clicks step through animations inside a slide so Matt can time them to his talk.
Dark theme matching the existing cost tool.

## Done
- 14 slides, flowing: cache basics → warm vs cold → multi-Claude → /compact and /clear
  → Opus vs Sonnet → live cost demo → memory files → closing.
- Cache tiers use two colors (base = amber, conversation = green) so they read as
  different things at a glance.

## Rejected
- **reveal.js**: spent more time fighting its CSS than building slides. A 30-line
  custom engine gives full control.
- **Auto-playing animations**: Matt needs to click to match his talk track.
- **A "cooling" middle state for the cache**: wrong. The cache is either warm or
  cold; there's nothing in between.
- **"The base layer survives /clear"**: wrong. /clear wipes everything. (Also
  recorded in KNOWLEDGE.md.)
- **Both cache tiers in green**: couldn't tell them apart.

## Open questions
- None right now.

## Next steps
- Full run-through for visuals and animation timing.
- Check it fits in ~10 minutes, then record.
