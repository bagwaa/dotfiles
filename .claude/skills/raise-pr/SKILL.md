---
name: raise-pr
description: >-
  Raises a GitHub PR based on the current branch's changes.
  Activates when the user types /raise-pr followed by a Jira ticket number.
user_invocable: true
---

# Raise PR

## Arguments

The user will provide a Jira ticket number as the argument (e.g. `/raise-pr 7362`).

## Writing Style

Never use em dashes (—) anywhere in the generated title or description. Use commas, periods, or semicolons instead.

## Instructions

1. Run `git diff master...HEAD` and `git log master..HEAD --oneline` to understand all changes on the current branch.
2. Check if the current branch has been pushed to the remote. If not, push it with `git push -u origin HEAD`.
3. Generate a PR title in the format: `PLANNR-{ticket_number} | {concise title}`
4. Generate a PR description using this exact template:

```
## What is this PR?
{A short paragraph explaining what this PR is, what it does, and why it's needed. Provide enough context so a reviewer unfamiliar with the ticket can understand the motivation.}

## Any special deployment instructions? (e.g run a command)
{Fill in or "None"}

## Any front-end pull requests that need to be merged with this PR?
{Fill in or "None"}

## Description
{Concise summary of changes in bullet points or short paragraphs}
```

5. Create the PR using `gh pr create` against `master`:

```bash
gh pr create --base master --title "PLANNR-{ticket_number} | {concise title}" --body "$(cat <<'EOF'
{description from template above}
EOF
)"
```

6. Show the user the PR URL returned by `gh pr create`.
