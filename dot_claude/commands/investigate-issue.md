---
allowed-tools: Bash(gh issue:*), Bash(gh label:*), Bash(git log:*), Bash(grep:*), Bash(find:*)
description: Fetch and investigate a GitHub issue in depth
argument-hint: [issue-number]
---

## Context

- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

## Instructions

If `$ARGUMENTS` is empty, list recent open issues and ask which one to investigate:
```
gh issue list --state open --limit 20
```

If an issue number is provided, fetch and investigate issue #$ARGUMENTS:

### 1. Fetch the issue

```
gh issue view $ARGUMENTS --json number,title,body,labels,assignees,state,comments,milestone
```

### 2. Summarize

Present a clear summary:
- **Title & number**
- **State** (open/closed) and current labels
- **Core problem or request** — distill the description
- **Key discussion points** from comments (if any)

### 3. Investigate the codebase

- Search for files, functions, or modules mentioned in or related to the issue
- Identify the area(s) of the code that would need changes
- Check for related tests or recent commits in those areas

### 4. Impact assessment

- Estimated scope (small fix / medium feature / large refactor)
- Files and services likely affected
- Potential risks or dependencies
- Suggested approach or next steps
