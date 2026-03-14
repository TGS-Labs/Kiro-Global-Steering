# Repository Context

## Purpose

This repository is a staging area for Kiro global configuration files. Files are authored under `docs/` and then installed to the user's home directory via scripts.

## Directory layout

- `docs/steering/` — Steering files to be installed globally to `~/.kiro/steering/`
- `docs/skills/` — Skill folders to be installed globally to `~/.kiro/skills/`
- `docs/hooks/` — Hook files to be installed globally to `~/.kiro/hooks/`
- `scripts/copy-steering.sh` — Installs steering files from `docs/steering/` to `~/.kiro/steering/`
- `scripts/install-skills.sh` — Installs skill folders from `docs/skills/` to `~/.kiro/skills/`
- `scripts/install-hooks.sh` — Installs hook files from `docs/hooks/` to `~/.kiro/hooks/`

## Default behavior

When asked to write a skill, steering file, or hook, write it under `docs/` (not `.kiro/`). These are staging copies intended for global installation.

- "Write a skill" → create it in `docs/skills/<skill-name>/SKILL.md`
- "Write a steering file" → create it in `docs/steering/<filename>.md`
- "Write a hook" → create it in `docs/hooks/<hook-name>.json`

Only write directly into `.kiro/steering/`, `.kiro/skills/`, or `.kiro/hooks/` if the user explicitly asks for a local (workspace-level) configuration.

## Installation

After authoring or updating files in `docs/`, run the appropriate install script:

```bash
./scripts/copy-steering.sh    # installs steering files
./scripts/install-skills.sh   # installs skill folders
./scripts/install-hooks.sh    # installs hook files
```
