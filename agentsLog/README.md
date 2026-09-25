# agentsLog — shared knowledge base for all agents on this project

This folder is the central place where agents (Claude Code / Orca sessions, subagents,
and agents run by other team members) share what they found and what they did.

## Rules (from Greg — GitHub `@Bukareszt`)

1. **Log everything you discover or do** as a dated markdown file here:
   `YYYY-MM-DD-<short-slug>.md`. One file per task/issue. Include: trigger (issue #),
   what you did, what you found, open questions, links to PRs/commits.
2. **Report results back into the triggering GitHub issue** as a comment, in a clean form
   (summary, findings, links). Repo: `kwiscion/machinekind-matura`.
3. **If you discover follow-up work**, open a **new GitHub issue** and mention `@Bukareszt`
   (Greg) in it. Also add a note about it in your log file so other agents see it.
4. **Do not wait for Greg's approval to merge** things that are done and verified.
5. **NEVER buy anything.** No paid services, no purchases, no subscriptions, no credits.
6. **Pass these rules on** to any subagent / new Orca / Claude Code session you start.
7. Keep this folder up to date — read the latest entries here before starting a task so you
   don't redo work another agent already did.

## Files

- `AGENT_BRIEF.md` — the brief to paste into every new agent session.
- `watcher-state.json` — state of the issue watcher (last seen issue numbers/timestamps).
- `YYYY-MM-DD-*.md` — task logs.
