# Architecture Documentation Generator Skill

A Claude Code skill that generates high-quality ARCHITECTURE.md files for code repositories, following best practices from the Rust ecosystem (specifically matklad's philosophy from rust-analyzer).

## Purpose

This skill bridges the gap between occasional contributors and core developers by providing a mental map of a codebase. It generates documentation that answers:
- "Where's the thing that does X?"
- "What does the thing I'm looking at do?"

## When to Use

- Documenting open-source projects (10k-200k lines of code)
- Onboarding new contributors
- Creating architectural overviews for existing codebases
- Understanding unfamiliar repositories

## What It Generates

A structured ARCHITECTURE.md file containing:

1. **Bird's Eye Overview** - High-level problem statement and approach
2. **Code Map** - Hierarchical module organization and relationships
3. **Architectural Invariants** - Explicit constraints and rules
4. **Boundaries** - Layer and system boundaries
5. **Cross-Cutting Concerns** - Common patterns and utilities

## Key Principles

- **Keep it short** - Readable in 5-10 minutes
- **Focus on stability** - Document things that don't change frequently
- **Structure over implementation** - What and where, not how
- **Navigation-friendly** - Name entities for symbol search, don't link directly

## Example Usage

```
Generate an ARCHITECTURE.md for this repository
```

```
Document the high-level architecture of my microservices project
```

```
I need architecture documentation for a new open-source contributor
```

## Reference Implementation

See rust-analyzer's ARCHITECTURE.md as a gold standard example:
https://github.com/rust-lang/rust-analyzer/blob/master/docs/dev/architecture.md

## Quality Standards

Generated documentation should:
- Be 500-1500 words (concise but comprehensive)
- Match actual directory structure
- Include at least one "absence" invariant
- Name specific types/modules without linking
- Avoid implementation details
- Be revisited periodically, not kept in perfect sync

## Installation

Copy this skill directory to your Claude Code skills location:
```bash
cp -r architecture-doc-skill /path/to/your/skills/
```

## Testing

The skill includes evaluation cases in `evals/evals.json` that test:
- Web application architectures
- Microservices systems
- CLI tools
- Real-time collaboration platforms
- ML pipelines

## License

MIT License - see LICENSE.txt

## Credits

Based on the ARCHITECTURE.md philosophy by matklad:
- Original blog post: https://matklad.github.io/2021/02/06/ARCHITECTURE.md.html
- Reference implementation: rust-analyzer
