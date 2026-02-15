# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personally authored Claude Code skills for platform engineering, infrastructure, and development workflows. Each skill lives in `skills/<skill-name>/` and gets symlinked into `~/.claude/skills/` via GNU Stow.

Note: `~/.claude/skills/` may also contain skills from other sources (e.g., skills.sh, other repos, standalone installs). This repo only manages its own skills.

## Repository Structure

- `skills/` — Each subdirectory is a self-contained skill. A valid skill **must** contain a `SKILL.md` with YAML frontmatter (`name`, `description`). Optional: `README.md`, `LICENSE.txt`, `evals/evals.json`, `.stow-local-ignore`.
- `scripts/` — `stow-install.sh` manages symlinking skills into `~/.claude/skills/`.
- `docs/` — Shared documentation (installation guide, repository setup guide).

## Currently Available Skills

- **architecture-doc** — Generates ARCHITECTURE.md files following rust-analyzer/matklad conventions. Produces: bird's eye overview, code map, architectural invariants, boundaries, cross-cutting concerns. Target length: 500-1500 words.
- **one-p-learning** — Teaches any topic through first principles decomposition. Dynamic sections, interactive quizzes, adaptive re-explanation.

## Key Commands

```bash
# Install a single skill
./scripts/stow-install.sh architecture-doc

# Install all skills
./scripts/stow-install.sh --all

# Re-stow after changes (sync)
./scripts/stow-install.sh --restow architecture-doc

# Remove a skill
./scripts/stow-install.sh --remove architecture-doc

# List available skills
./scripts/stow-install.sh --list
```

Prerequisite: `brew install stow`

## Skill Anatomy

Every skill directory must have this structure:
```
skills/<name>/
├── SKILL.md              # Required — YAML frontmatter + instructions for Claude
├── .stow-local-ignore    # Excludes repo-only files from symlinking
├── README.md             # User-facing documentation
├── LICENSE.txt           # License
└── evals/
    └── evals.json        # Array of {prompt, expectations[]} test cases
```

The `SKILL.md` frontmatter format:
```yaml
---
name: skill-name
description: One-line description. Use this skill when [triggers].
---
```

## Adding a New Skill

1. Create `skills/<skill-name>/` with at minimum `SKILL.md`
2. Add a `.stow-local-ignore` to exclude repo-only files (README.md, LICENSE.txt, evals/, etc.)
3. Add eval cases in `evals/evals.json`
4. Install with `./scripts/stow-install.sh <skill-name>`
5. Update `README.md` to list the new skill under "Available Skills"
