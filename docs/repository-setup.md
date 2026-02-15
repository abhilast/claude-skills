# Repository Setup Guide

## Directory Structure

```
claude-skills/
├── CLAUDE.md                    # Instructions for Claude Code
├── README.md                    # Repository documentation
├── GETTING-STARTED.md           # Quick start guide
├── skills/                      # All skills
│   └── architecture-doc/        # Example skill
│       ├── SKILL.md             # Skill instructions (required)
│       ├── .stow-local-ignore   # Excludes repo-only files from stow
│       ├── README.md            # Skill documentation
│       ├── LICENSE.txt          # License
│       └── evals/
│           └── evals.json       # Test cases
├── scripts/
│   └── stow-install.sh          # Stow-based skill manager
└── docs/
    ├── installation.md          # Installation guide
    └── repository-setup.md      # This file
```

## Adding a New Skill

```bash
# 1. Create skill directory
mkdir skills/new-skill-name

# 2. Create SKILL.md with YAML frontmatter
cat > skills/new-skill-name/SKILL.md << 'EOF'
---
name: new-skill-name
description: One-line description. Use this skill when [triggers].
---

# Skill Name

[Instructions for Claude]
EOF

# 3. Create .stow-local-ignore
cat > skills/new-skill-name/.stow-local-ignore << 'EOF'
README\.md
LICENSE\.txt
evals
\.stow-local-ignore
EOF

# 4. Optionally add README.md, LICENSE.txt, evals/

# 5. Install via stow
./scripts/stow-install.sh new-skill-name

# 6. Test in Claude Code
```

## Updating a Skill

Edit the files in `skills/<name>/` directly. Since stow creates symlinks, changes are immediately visible to Claude Code.

If you add or remove files, re-stow:

```bash
./scripts/stow-install.sh --restow <skill-name>
```

## SKILL.md Template

```yaml
---
name: skill-name
description: One-line description. Use this skill when [triggers].
---

# Skill Name

[Detailed instructions for Claude on how to use this skill]

## When to Use

[Clear triggers and use cases]

## Methodology

[Step-by-step approach]

## Output Format

[What the skill produces]

## Quality Standards

[How to verify good output]
```

## .stow-local-ignore Format

Uses regex patterns (one per line) to exclude files from symlinking:

```
README\.md
LICENSE\.txt
evals
\.stow-local-ignore
```

This ensures only `SKILL.md` gets symlinked into `~/.claude/skills/<name>/`.
