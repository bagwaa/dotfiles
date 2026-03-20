---
name: pr-feedback
description: >-
  Fetches and reviews PR feedback/comments for the current branch.
  Activates when the user types /pr-feedback.
user_invocable: true
---

# PR Feedback

## Instructions

1. Determine the current branch name using `git branch --show-current`.
2. Find the open PR for this branch using `gh pr list --head <branch> --json number,url --jq '.[0]'`.
3. If no PR is found, tell the user there is no open PR for this branch.
4. Fetch all review comments using `gh api repos/{owner}/{repo}/pulls/{number}/comments`.
5. Also fetch general PR comments (conversation) using `gh api repos/{owner}/{repo}/pulls/{number}/reviews --jq '.[] | select(.body != "") | {user: .user.login, state: .state, body: .body}'`.
6. Filter out comments from the current user (bagwaa) and from bots (Copilot, github-actions, etc.) unless the user specifically asks to see them.
7. Present the feedback grouped by reviewer, showing:
   - The file and line number
   - The comment body
   - Whether it has been replied to already
8. Give your honest opinion on each piece of feedback: do you agree, disagree, or think it needs more context?
9. Ask the user how they want to proceed with each item.
