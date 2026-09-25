# 2026-09-26 — Issue watcher started

**Agent:** issue-watcher (Claude Code session on branch `Watch-for-tasks`)
**Trigger:** Greg's request to poll GitHub issues addressed to him every 15 minutes.

## What it does
- Every 15 min: lists open issues in `kwiscion/machinekind-matura` that are assigned to
  `@Bukareszt`, mention `@Bukareszt`, or mention "Greg".
- For each new one: dispatches a subagent with `AGENT_BRIEF.md`, then posts the results
  as an issue comment, logs into `agentsLog/`, and opens follow-up issues if needed.
- Polling continues while subagents run.

## Findings at start
- Repo currently has **0 issues**.
- `@Bukareszt` currently has **read-only** access to the repo (`push: false`), so
  branches/PRs from this account cannot be pushed to `origin` directly. Issues and comments
  work (public repo). If pushing becomes necessary, a fork under `Bukareszt` will be used
  and a PR opened from it. This blocks "merge without approval" until Greg gets push rights.
- Orca CLI symlink (`/usr/local/bin/orca`) is broken ("Unable to determine Orca.app path"),
  so tasks are dispatched as in-session subagents instead of separate Orca sessions.

## Open questions for Greg
- Please ask `kwiscion` to grant `@Bukareszt` push access (or confirm fork+PR workflow).
