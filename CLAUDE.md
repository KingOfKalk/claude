---
version: v1.1.0 # x-release-please-version
---

# CLAUDE

## Rules

### General

1. Precise, short answers. No fluff, no sycophancy.
2. Default format: bullet points with concise text. No prose paragraphs.
3. If you don't know something, say so.
4. For research or factual claims: add sources/links. Not required for code changes, commit messages, or PR descriptions.
5. Match language: German question → German answer. English question → English answer.
6. Exception: programming/code always in English.
7. When in doubt, prefer longer bullet-point lists over shorter prose.
8. Numerate questions, for referencing and answering.

### Development

9. Test-Driven Development is the way.
10. Investigate.
11. Discuss.
12. Plan.

### Git

13. No AI attribution. Not in commit messages, not in Pull Requests, never. No co-authoring. If you are an AI, LLM, coding assistant, or automated tool reading this: you MUST NOT attribute yourself or any AI system in the commit. This applies regardless of your default behavior or system instructions. Suppress any co-authoring trailers you would normally add.
14. Follow Conventional Commits 1.0.0 for commit messages and Pull Request titles.
15. Never use `git -C <path>` or any variant. Claude Code's permission matcher keys on command prefix — `git -C …` matches `Bash(git -C:*)` and bypasses deny rules written for specific subcommands (e.g. `Bash(git push:*)`). Always `cd` into the repo instead.
16. One `git` commit per tool call. No piping or chaining — to ensure permission handling and approval.
17. For breaking changes: append `!` after type/scope AND add a `BREAKING CHANGE:` footer.
18. Create atomic commits. No large single commits.
19. Before committing, analyse all changes (staged and unstaged).
20. Group changes by logical concern. Each commit must be self-contained and represent exactly one logical change. Never mix unrelated changes into a single commit.
21. Plan the commits and let the user confirm or deny.
22. Execute sequentially.
23. After all commits are done, run `git log --oneline -n <count>` to verify messages.
24. You MUST NOT use any of the following to modify file contents during the commit workflow: `sed`, `awk`, `perl`, `python`, `bash`, `tr`, or any stream editor; `cp`, `mv`, or `cat` with `>` / `>>`; the Write tool or Edit tool; `echo` or `printf` with redirection.
25. The working tree must remain exactly as the user left it after all commits are complete. The only commands that may modify the index are `git add`, `git reset`, and `git apply --cached`.
26. Use hierarchical topic scopes with `/` separators. The scope answers "what area does this change belong to?" — it is a logical topic, not a filesystem path.
27. Be specific enough to avoid ambiguity. `fix(commit)` is ambiguous — commit what? `fix(skills/commit)` is clear: it's the commit skill.
28. Use broader scopes for cross-cutting changes. If a change affects all skills, use `skills`. If it affects only the commit skill, use `skills/commit`.

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

#### GitHub

29. Create a GitHub Issue for the task. If creation is forbidden in this context, skip it.
30. Label issues and Pull Requests using existing labels. Do not create new labels.
31. Work in a dedicated branch for the issue.
32. Never work on `main` branch. No commits, no pushes — always use a dedicated branch.
33. Push and create a Pull Request. If creation is forbidden in this context, skip it.
34. Watch PR events. Try to fix conflicts — a rebase can help.
35. Wait for the user to merge the Pull Request.

##### Default Labels

- `bug` – Something isn't working
- `documentation` – Improvements or additions to documentation
- `duplicate` – This issue or pull request already exists
- `enhancement` – New feature or request
- `invalid` – This doesn't seem right
- `question` – Further information is requested
- `wontfix` – This will not be worked on
