# Claude

My very basic Claude setup.
See [CLAUDE.md](CLAUDE.md).

CLAUDE.md holds only always-on preferences and a few hard git guardrails.
The commit and issue/PR workflow lives in the `git` plugin of
[KingOfKalk/claude-code-plugins](https://github.com/KingOfKalk/claude-code-plugins):

```text
/plugin marketplace add KingOfKalk/claude-code-plugins
/plugin install git@kingofkalk-claude-code-plugins
```

## Claude Code

A script to ensure the web environments have my CLAUDE.md as well system wide.
See [web_env_setup.sh](./claude_code/web_env_setup.sh).

## Prevent Sleep During Long Claude Sessions

When running Claude for extended tasks, your Mac may sleep or dim the display, interrupting the session. To prevent this, open a separate terminal and run:

```bash
caffeinate -dimsu
```

This keeps the system, display, and disk awake until you stop it with `Ctrl+C`.
