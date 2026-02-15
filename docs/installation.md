# Installation Guide

## Prerequisites

- Claude Code installed and configured
- [GNU Stow](https://www.gnu.org/software/stow/) — `brew install stow`
- Git

## Quick Installation

```bash
git clone <repo-url>
cd claude-skills
./scripts/stow-install.sh --all
```

This symlinks each skill's `SKILL.md` into `~/.claude/skills/<skill-name>/`.

## Install a Specific Skill

```bash
./scripts/stow-install.sh architecture-doc
```

## Verifying Installation

```bash
# Check symlinks
ls -la ~/.claude/skills/architecture-doc/

# Read the skill file through the symlink
cat ~/.claude/skills/architecture-doc/SKILL.md
```

## Updating Skills

Since skills are symlinked, pulling the repo updates them automatically:

```bash
git pull
```

If you added or removed files within a skill directory, re-stow:

```bash
./scripts/stow-install.sh --restow architecture-doc
```

## Uninstalling

### Remove a Specific Skill

```bash
./scripts/stow-install.sh --remove architecture-doc
```

### Manual Removal

```bash
rm ~/.claude/skills/architecture-doc/SKILL.md
rmdir ~/.claude/skills/architecture-doc
```

## How It Works

GNU Stow creates symlinks from the repo into `~/.claude/skills/`. Each skill is an independent stow package:

```
~/.claude/skills/architecture-doc/SKILL.md -> /path/to/repo/skills/architecture-doc/SKILL.md
```

A `.stow-local-ignore` file in each skill directory excludes repo-only files (README.md, LICENSE.txt, evals/) from being symlinked.

Skills from other sources in `~/.claude/skills/` are not affected — stow only manages symlinks it created.

## Troubleshooting

### Stow Not Found

```bash
brew install stow
```

### Stow Conflict Error

Stow reports a conflict when a file already exists at the target path. This protects against overwriting skills from other sources. Either remove the conflicting file first, or check if the skill is already installed from another source.

### Skill Not Loading in Claude Code

1. Verify the symlink: `ls -la ~/.claude/skills/<skill-name>/SKILL.md`
2. Check SKILL.md has valid YAML frontmatter
3. Restart Claude Code
