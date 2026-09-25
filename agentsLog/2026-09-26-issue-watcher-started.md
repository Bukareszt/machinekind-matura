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
- Orca CLI symlink (`/usr/local/bin/orca`) is broken, but the bundled CLI works:
  `/Applications/Orca.app/Contents/Resources/bin/orca`. Orca runtime is ready, so issue
  tasks are dispatched as Orca worktrees (`orca worktree create --agent claude --issue <n>
  --prompt ...`), falling back to in-session subagents if Orca is unavailable.
- Fork `Bukareszt/machinekind-matura` created so branches can be pushed and PRs opened
  against `kwiscion/machinekind-matura` (see `agentsLog/README.md` git workflow).

## Open questions for Greg
- Please ask `kwiscion` to grant `@Bukareszt` push access (or confirm fork+PR workflow).
