#!/bin/bash

# Manage Claude Code skills from this repo using GNU Stow
# Each skill is stowed individually into ~/.claude/skills/<skill-name>/
#
# Usage:
#   ./scripts/stow-install.sh <skill>           # install one skill
#   ./scripts/stow-install.sh --all             # install all skills
#   ./scripts/stow-install.sh --remove <skill>  # uninstall one skill
#   ./scripts/stow-install.sh --restow <skill>  # re-stow (sync after changes)
#   ./scripts/stow-install.sh --list            # list available skills

set -e

# Resolve repo paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
STOW_DIR="$REPO_ROOT/skills"
TARGET_DIR="$HOME/.claude/skills"

# Check stow is installed
if ! command -v stow &>/dev/null; then
    echo "Error: GNU Stow is not installed."
    echo "Install with: brew install stow"
    exit 1
fi

# List available skills (dirs containing SKILL.md)
list_skills() {
    for dir in "$STOW_DIR"/*/; do
        skill="$(basename "$dir")"
        if [ -f "$dir/SKILL.md" ]; then
            echo "  $skill"
        fi
    done
}

# Install a single skill
install_skill() {
    local skill="$1"
    local skill_src="$STOW_DIR/$skill"

    if [ ! -d "$skill_src" ]; then
        echo "Error: Skill not found: $skill"
        echo "Available skills:"
        list_skills
        exit 1
    fi

    if [ ! -f "$skill_src/SKILL.md" ]; then
        echo "Error: $skill has no SKILL.md — not a valid skill"
        exit 1
    fi

    mkdir -p "$TARGET_DIR/$skill"
    stow -d "$STOW_DIR" -t "$TARGET_DIR/$skill" "$skill"
    echo "Installed: $skill -> $TARGET_DIR/$skill"
}

# Remove a single skill
remove_skill() {
    local skill="$1"

    if [ ! -d "$TARGET_DIR/$skill" ]; then
        echo "Error: Skill not installed: $skill"
        exit 1
    fi

    stow -D -d "$STOW_DIR" -t "$TARGET_DIR/$skill" "$skill"
    rmdir "$TARGET_DIR/$skill" 2>/dev/null || true
    echo "Removed: $skill"
}

# Restow (sync) a single skill
restow_skill() {
    local skill="$1"

    if [ ! -d "$TARGET_DIR/$skill" ]; then
        echo "Error: Skill not installed: $skill"
        echo "Use './scripts/stow-install.sh $skill' to install it first."
        exit 1
    fi

    stow -R -d "$STOW_DIR" -t "$TARGET_DIR/$skill" "$skill"
    echo "Restowed: $skill"
}

# Parse arguments
if [ $# -eq 0 ]; then
    echo "Usage:"
    echo "  ./scripts/stow-install.sh <skill>           # install one skill"
    echo "  ./scripts/stow-install.sh --all             # install all skills"
    echo "  ./scripts/stow-install.sh --remove <skill>  # uninstall one skill"
    echo "  ./scripts/stow-install.sh --restow <skill>  # re-stow (sync changes)"
    echo "  ./scripts/stow-install.sh --list            # list available skills"
    exit 1
fi

case "$1" in
    --all)
        echo "Installing all skills to $TARGET_DIR"
        for dir in "$STOW_DIR"/*/; do
            skill="$(basename "$dir")"
            if [ -f "$dir/SKILL.md" ]; then
                install_skill "$skill"
            fi
        done
        ;;
    --remove)
        if [ -z "$2" ]; then
            echo "Error: --remove requires a skill name"
            exit 1
        fi
        remove_skill "$2"
        ;;
    --restow)
        if [ -z "$2" ]; then
            echo "Error: --restow requires a skill name"
            exit 1
        fi
        restow_skill "$2"
        ;;
    --list)
        echo "Available skills:"
        list_skills
        ;;
    -*)
        echo "Unknown option: $1"
        exit 1
        ;;
    *)
        install_skill "$1"
        ;;
esac
