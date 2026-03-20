---
name: morning
description: >-
  Shows a morning standup summary of current work and sprint progress.
  Activates when the user types /morning.
user_invocable: true
---

# Morning Standup

## Instructions

1. Get the current user's email using `jira me`.
2. Fetch tickets currently assigned to the user in the active sprint using:
   - `jira issue list --jql 'assignee = "<email>" AND sprint in openSprints() AND status in ("In Progress", "Review", "QA", "Awaiting Review")'`
3. Fetch tickets the user worked on or reviewed in the current sprint (tickets may have been reassigned):
   - `jira issue list --jql 'assignee was "<email>" AND sprint in openSprints() AND status = Done'`
4. Check for any open PRs using `gh pr list --author @me --json number,title,url,reviewDecision`.
5. Present a clean summary with three sections:

### Currently Working On
List any tickets in active states with their key, summary, and status.

### Worked On / Reviewed This Sprint
List recently completed tickets with their key and summary. These are tickets the user was assigned to at some point, which could mean they wrote the code or reviewed it.

### Open PRs
List any open PRs with their title, URL, and review status.

6. Keep it concise. No filler text.
7. If a JIRA query fails or returns no results, note it briefly and move on. Do not skip the other sections.
