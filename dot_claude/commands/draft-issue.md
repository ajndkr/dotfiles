---
allowed-tools: Bash(gh issue:*), Bash(gh label:*)
description: Draft a GitHub issue, get approval, then open it with labels
argument-hint: <description of the issue>
disable-model-invocation: true
---

Create a GitHub issue based on: $ARGUMENTS

If the description is too vague to write a useful issue, ask follow-up questions before drafting.

## Drafting the issue

Write a short, specific **title** that someone scanning a backlog can understand without clicking into it.

The **body** has two parts and nothing else unless the user explicitly asks for more:

**Opening paragraph (no heading):** Describe what's happening or what's needed and why it matters. Give enough context that someone unfamiliar with the problem can understand the situation. Write it as a plain paragraph — do not use "As a ... I want ... so that ..." framing.

**Acceptance Criteria:** 3 to 5 checkboxes describing the observable outcomes that mean this issue is done. Frame these as end results a user or stakeholder would notice, not implementation details or code-level tasks.

Example body:

```
When a client uploads a video longer than 10 minutes, the submission silently fails and the analyst never sees it in their queue. The upload endpoint returns 200 but the processing job times out without logging an error, so there's no visibility into the failure.

## Acceptance Criteria
- [ ] Videos up to 30 minutes can be submitted and appear in the analyst queue
- [ ] Failed uploads surface a clear error to the client with a reason
- [ ] Processing failures are logged with enough detail to debug
```

## Approval flow

Show the full draft (title + body) and wait for explicit approval before doing anything else. If the user requests changes, revise and re-present.

## Labels and creation

After approval, fetch the repo's labels:
```
gh label list --limit 100 --json name,description
```

Suggest labels that fit and confirm with the user, then create the issue:
```
gh issue create --title "<title>" --body "<body>" --label "<label1>" --label "<label2>"
```

Report the issue number and URL when done.
