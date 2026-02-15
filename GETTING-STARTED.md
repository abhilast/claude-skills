# Getting Started

## Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/) — `brew install stow`
- Claude Code installed and configured

## Install Skills

```bash
# Install all skills (symlinks into ~/.claude/skills/)
./scripts/stow-install.sh --all

# Or install a specific skill
./scripts/stow-install.sh architecture-doc
```

## Verify Installation

```bash
# Check that the symlink was created
ls -la ~/.claude/skills/architecture-doc/SKILL.md
```

The symlink should point back to this repo.

## Test It

In Claude Code, try:

```
Generate an ARCHITECTURE.md for this repository
```

## What's Inside

### Architecture Documentation Skill

Generates professional ARCHITECTURE.md files following rust-analyzer best practices:
- Bird's eye overview
- Hierarchical code map
- Architectural invariants
- Layer boundaries
- Cross-cutting concerns

## Managing Skills

```bash
# Re-stow after adding/removing files in a skill
./scripts/stow-install.sh --restow architecture-doc

# Remove a skill
./scripts/stow-install.sh --remove architecture-doc

# List available skills
./scripts/stow-install.sh --list
```

## Adding a New Skill

```bash
mkdir skills/my-new-skill

# Create SKILL.md with YAML frontmatter (required)
# Create .stow-local-ignore to exclude repo-only files

# Install it
./scripts/stow-install.sh my-new-skill
```

## Troubleshooting

### Skill Not Found in Claude Code

1. Verify symlink exists: `ls -la ~/.claude/skills/<skill-name>/SKILL.md`
2. Check that SKILL.md has valid YAML frontmatter
3. Restart Claude Code

### Stow Conflict

If stow reports a conflict, a file already exists at the target path from another source. Either remove the conflicting file or choose a different skill name.
