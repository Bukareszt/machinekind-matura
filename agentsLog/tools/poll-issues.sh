#!/usr/bin/env bash
# Poll GitHub issues addressed to Greg (@Bukareszt) in kwiscion/machinekind-matura.
# Prints JSON array of candidate issues (open, assigned to / mentioning Bukareszt or "Greg"),
# with their comments, so the watcher can diff against agentsLog/watcher-state.json.
set -euo pipefail
REPO="${REPO:-kwiscion/machinekind-matura}"
LOGIN="${LOGIN:-Bukareszt}"
gh issue list --repo "$REPO" --state open --limit 100 \
  --json number,title,body,state,assignees,labels,author,createdAt,updatedAt,url,comments \
| jq --arg login "$LOGIN" '
  [ .[] | select(
      ([.assignees[].login] | index($login)) != null
      or ((.body // "") | test("@"+$login; "i"))
      or ((.body // "") | test("\\bgreg\\b"; "i"))
      or (.title | test("\\bgreg\\b"; "i"))
      or ([.comments[]? | .body] | join("\n") | test("@"+$login; "i"))
      or ([.labels[]? | .name] | index("greg") != null)
    )
    | {number, title, url, author: .author.login, createdAt, updatedAt,
       assignees: [.assignees[].login], labels: [.labels[].name],
       body, comments: [.comments[]? | {author: .author.login, createdAt, body}]}
  ]'
