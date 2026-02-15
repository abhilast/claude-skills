# Claude Skills

Personally authored Claude Code skills for platform engineering, infrastructure, and development workflows.

Skills are symlinked into `~/.claude/skills/` using [GNU Stow](https://www.gnu.org/software/stow/), so edits in this repo are immediately live. Other skills in `~/.claude/skills/` from other sources are not affected.

## Available Skills

### [architecture-doc](./skills/architecture-doc/)

Generate comprehensive ARCHITECTURE.md files following rust-analyzer/matklad conventions.

**Use when:** Creating architecture docs, onboarding contributors, understanding codebases

### [one-p-learning](./skills/one-p-learning/)

Teach any topic through first principles decomposition — bottom-up, interactive, with adaptive quizzes.

**Use when:** Learning new topics, explaining from first principles, building deep understanding of any subject

## Quick Start

```bash
# Prerequisites
brew install stow

# Clone and install
git clone <repo-url>
cd claude-skills
./scripts/stow-install.sh --all
```

## Managing Skills

```bash
# Install one skill
./scripts/stow-install.sh architecture-doc

# Install all skills
./scripts/stow-install.sh --all

# Re-stow after changes
./scripts/stow-install.sh --restow architecture-doc

# Remove a skill
./scripts/stow-install.sh --remove architecture-doc

# List available skills
./scripts/stow-install.sh --list
```

## Updating

```bash
git pull
# Symlinks mean changes are already live — no re-install needed.
# If you added/removed files, re-stow:
./scripts/stow-install.sh --restow architecture-doc
```

## Repository Structure

```
claude-skills/
├── skills/           # All Claude Code skills
├── scripts/          # stow-install.sh
└── docs/             # Shared documentation
```

## Adding a New Skill

```bash
mkdir skills/new-skill
# Create skills/new-skill/SKILL.md (required)
# Create skills/new-skill/.stow-local-ignore
# Optionally add README.md, LICENSE.txt, evals/
./scripts/stow-install.sh new-skill
```

## License

Each skill has its own LICENSE.txt file. Most are MIT licensed unless otherwise specified.
