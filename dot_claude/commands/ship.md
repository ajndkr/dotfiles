---
allowed-tools: Bash(git:*), Bash(gh pr:*), Bash(cat:*), Bash(find:*)
description: Commit changes, push, and open a pull request
argument-hint: [description or issue number]
disable-model-invocation: true
---

## Context

- Current branch: !`git branch --show-current`
- Git status: !`git status --short`
- Diff summary: !`git diff --stat`

## Branch

Always start by checking whether you're on `main` or `master`. If so, create and check out a new branch before doing anything else.

Branch naming format: `<tag>/<gh-issue-num>-<scope>-<description>`

- `tag` is the conventional commit type (`feat`, `fix`, `chore`, etc.)
- `gh-issue-num` is the GitHub issue number if one exists in context — omit it entirely (including the dash) if there isn't one
- `scope` and `description` are lowercase kebab-case

Examples: `feat/142-auth-token-refresh`, `fix/api-timeout-handling`, `chore/89-deps-update`

## Commits

Review the staged and unstaged changes and split them into commits by functional change. Each commit should represent one coherent unit of work. If the overall change is small and cohesive, a single commit is fine.

Commit message format: `type(scope): description`

- When there are multiple commits in the branch, drop the `(scope)` from all of them to keep things clean
- For the scope convention, check the repo's README for a conventional commit tag/scope legend and follow it. This applies to PR titles too.
- Subject line under 72 characters
- No commit body or co-authored-by trailer unless the user explicitly asks for one
- Never amend a commit or force push unless the user explicitly asks

Present the planned commits (which files go into each, and the proposed message) and wait for approval before executing.

## Push

Push the branch to the remote:
```
git push origin <branch> --set-upstream
```

## Pull request

When the user is ready to open a PR:

1. Check for an existing PR template in the repo (`.github/pull_request_template.md` or similar locations) and use it to structure the body. Fill in each section based on what was done.

2. If any GitHub issues are related, use a closing keyword in the body (`Closes #123`, `Fixes #123`) to link them.

3. PR title format:
   - Single commit branch: use the commit message as the title
   - Multi-commit branch: write a `type(scope): description` title that summarizes the overall change

4. Ask the user whether the PR should be opened as a **draft** or ready for review.

5. Present the full PR (title, body, base branch, draft status) and wait for approval, then create it:
   ```
   gh pr create --title "<title>" --body "<body>" --base <base> [--draft]
   ```

Report the PR number and URL when done.
