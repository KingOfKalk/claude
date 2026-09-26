# Contributing

Thanks for your interest. This repo follows a tight, issue-driven workflow. Always-on rules live in [CLAUDE.md](CLAUDE.md); the full commit and issue/PR workflow lives in the `git` plugin of [KingOfKalk/claude-code-plugins](https://github.com/KingOfKalk/claude-code-plugins). This doc is the short version for contributors.

## Before You Start

- Open an issue (or claim an existing one) describing the change.
- Small fixes (typos, clear bugs) can skip the issue, but a PR is still required.

## Branching

- One branch per issue.
- Naming: `<type>/<issue-number>-<slug>` — e.g. `feat/12-add-x`, `fix/34-typo-in-readme`.
- Never commit directly to `main`.

## Commits

- Follow [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/).
- Allowed `types`, scope conventions, and the breaking-change format are defined by the `git` plugin.
- Atomic: one logical concern per commit. Don't mix unrelated changes.
- No AI attribution or co-authoring trailers.

## Pull Requests

- Title uses Conventional Commits (same format as commits).
- Body includes `Closes #<issue-number>`.
- Keep scope tight — open a separate PR for unrelated work.
- Maintainer merges; do not self-merge.

## Releases

- Fully automated via [release-please](https://github.com/googleapis/release-please).
- `feat:` bumps minor, `fix:` bumps patch, `BREAKING CHANGE:` bumps major.
- Don't edit `CHANGELOG.md`, the version in `CLAUDE.md` frontmatter, or `.release-please-manifest.json` by hand — release-please owns them.
