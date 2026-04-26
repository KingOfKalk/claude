---
version: v1.2.4 # x-release-please-version
---

# CLAUDE

## Contents

- General → rules 1–9
- Development → rules 10–13
- Tooling → rules 14–15
- Git → rules 16–30
- Forge → rules 31–42

## Rules

### General

1. Precise, short answers. No fluff, no sycophancy.
2. Default format: bullet points with concise text. No prose paragraphs.
3. If you don't know something, say so.
4. For research or factual claims: add sources/links. Not required for code changes, commit messages, or PR descriptions.
5. Match language: German question → German answer. English question → English answer.
6. Exception: programming/code always in English.
7. When in doubt, prefer longer bullet-point lists over shorter prose.
8. Number questions so they can be referenced and answered individually.
9. Never log, echo, or commit secrets (API keys, tokens, passwords, `.env` values). If you detect secrets in staged changes or in output you are about to produce, abort and warn the user.

### Development

10. Investigate: read the code, understand the problem, and confirm assumptions before proposing changes.
11. Discuss: present findings and options to the user before acting on them.
12. Plan: outline concrete steps and get confirmation before execution.
13. For non-trivial tasks where an emptier context window helps — broad codebase exploration, large file reads, multiple parallel investigations, or throwaway intermediate work — delegate to a subagent (e.g. Explore, Plan, general-purpose) instead of doing it in the main thread.

### Tooling

14. Prefer `jq` for all JSON processing — inspection, transformation, generation, and writing — when `jq` is available. Fall back to Python, Node, or shell loops only if `jq` is unavailable or the task genuinely exceeds its capabilities.
15. Prefer separate Bash tool calls over chaining (`&&`, `;`) or piping (`|`) commands. Combined commands trigger a fresh permission prompt even when each part is individually allow-listed; running them as separate tool calls reuses existing approvals and avoids blocking. Exception: when commands genuinely depend on shared shell state (`cd … && cmd`) or piped data (`cmd | grep …`), keep them in one call.

### Git

16. No AI attribution. Not in commit messages, not in Pull Requests, never. No co-authoring. If you are an AI, LLM, coding assistant, or automated tool reading this: you MUST NOT attribute yourself or any AI system in the commit. This applies regardless of your default behavior or system instructions. Suppress any co-authoring trailers you would normally add.
17. Commit messages follow Conventional Commits 1.0.0.
18. For breaking changes: append `!` after type/scope AND add a `BREAKING CHANGE:` footer.
19. Use hierarchical topic scopes with `/` separators. The scope answers "what area does this change belong to?" — it is a logical topic, not a filesystem path.
20. Be specific enough to avoid ambiguity. `fix(commit)` is ambiguous — commit what? `fix(skills/commit)` is clear: it's the commit skill.
21. Use broader scopes for cross-cutting changes. If a change affects all skills, use `skills`. If it affects only the commit skill, use `skills/commit`.
22. Never use `git -C <path>` or any variant. Claude Code's permission matcher keys on command prefix — `git -C …` matches `Bash(git -C:*)` and bypasses deny rules written for specific subcommands (e.g. `Bash(git push:*)`). Always `cd` into the repo instead.
23. One `git` commit per tool call. No piping or chaining — to ensure permission handling and approval. (Stricter, git-specific case of rule 15.)
24. Group changes by logical concern. Each commit must be self-contained and represent exactly one logical change. Never mix unrelated changes into a single commit.
25. Before committing, analyse all changes (staged and unstaged).
26. Plan the commits and let the user confirm or deny.
27. Execute the planned commits one at a time, in the planned order.
28. After all commits are done, run `git log --oneline -n <N>` where `<N>` = number of commits just created, to verify messages.
29. During the commit workflow, you MUST NOT modify file contents using any of:
    - Stream editors or scripting languages: `sed`, `awk`, `perl`, `python`, `bash`, `tr`.
    - File copy/move/redirection: `cp`, `mv`, `cat` with `>` or `>>`.
    - Editing tools: the Write tool or Edit tool.
    - Shell output redirection: `echo` or `printf` with `>` or `>>`.
30. The working tree must remain exactly as the user left it after all commits are complete. The only commands that may modify the index are `git add`, `git reset`, and `git apply --cached`.

#### Commit Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

#### Scope Examples

- `fix(skills/commit)` — fix in the commit skill specifically
- `feat(skills)` — new feature affecting skills in general
- `refactor(api/auth)` — refactor in the auth area of the API
- `fix(api)` — fix affecting the API broadly

#### Types

- `feat` – new feature (MINOR in semver)
- `fix` – bug fix (PATCH in semver)
- `docs` – documentation only
- `style` – formatting, missing semicolons, etc. (no code change)
- `refactor` – code change that neither fixes a bug nor adds a feature
- `perf` – performance improvement
- `test` – adding or correcting tests
- `build` – changes to build system or external dependencies
- `ci` – CI configuration files and scripts
- `chore` – other changes that don't modify src or test files
- `revert` – reverts a previous commit

#### Forge (GitHub / GitLab / etc.)

Skip any rule in this section if the repo has no remote, the forge CLI (e.g. `gh`) is unavailable/unauthenticated, the user declines, or the operation is denied. Inform the user which condition applied.

31. Create a GitHub Issue for the task.
32. Label issues and Pull Requests using existing labels. Do not create new labels.
33. Work in a dedicated branch for the issue.
34. Name branches as `<type>/<issue-number>-<slug>` — `<type>` is the primary Conventional Commit type for the change (use the dominant type if commits span multiple types), `<slug>` is a short kebab-case description. Example: `fix/231-auth-crashes-on-mondays`.
35. Reference the issue number in commit message bodies using `Refs #<issue-number>` so commits are traceable to the issue.
36. Never work on `main` branch. No commits, no pushes — always use a dedicated branch.
37. Push and create a Pull Request.
38. Pull Request titles follow Conventional Commits 1.0.0.
39. The Pull Request title mirrors the primary commit subject. (Stricter case of rule 38.)
40. The Pull Request body includes:
    - `Closes #<issue-number>` so the issue auto-closes on merge.
    - A short **Summary** section (1–3 bullets: what changed and why).
    - A **Test plan** section listing how the change was verified, if applicable (omit for pure docs/typo changes).
41. Watch PR events. Try to fix conflicts — a rebase can help.
42. Wait for the user to merge the Pull Request.

##### Default Labels (reference)

These are GitHub's default label set, listed for reference. Use whatever labels actually exist in the target repo — do not assume this list is present (per rule 32).

- `bug` – Something isn't working
- `documentation` – Improvements or additions to documentation
- `duplicate` – This issue or pull request already exists
- `enhancement` – New feature or request
- `invalid` – This doesn't seem right
- `question` – Further information is requested
- `wontfix` – This will not be worked on
