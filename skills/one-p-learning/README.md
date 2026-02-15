# First Principles Learning Skill

A Claude Code skill that teaches any topic through first principles decomposition — breaking subjects into foundational atoms and building understanding bottom-up, interactively.

## Purpose

Traditional explanations start with the answer and work backwards. This skill starts with the *problem* and builds forward, so the learner feels they could have invented the concept. Works for any topic: programming, cryptography, music theory, economics, physics.

## When to Use

- Learning a new topic from scratch
- Wanting a deeper understanding of something you use but don't fully grasp
- Explaining technical concepts to others (use as a teaching template)
- Preparing for interviews or presentations on unfamiliar subjects

## How It Works

1. **Clarifies scope** — Narrows broad topics, asks one calibration question
2. **Maps a learning path** — Presents a numbered section roadmap scaled to topic complexity
3. **Teaches one section at a time** — Each section: grounding question, first-principles explanation, bold mental model, application quiz
4. **Quizzes with hook questions** — Every quiz ends with a question you can't answer yet, pulling you into the next section
5. **Adapts on wrong answers** — Uses different analogies, visuals, or worked examples instead of repeating
6. **Handles interruptions** — Jumping ahead, tangential questions, pausing mid-session
7. **Final assembly** — Connects all building blocks, revisits the opening question, lists all mental models

## Example Usage

```
Teach me Bitcoin from first principles
```

```
Explain HTTP — I already know URLs and curl, skip the basics
```

```
I want to learn music theory. I play guitar but don't know any theory.
```

```
Help me understand C pointers from scratch
```

## Key Features

- **Dynamic section count** — 4-8 for simple topics, 8-12 for medium, 12-18 for complex
- **Application-based quizzes** — Scenario, predict-output, find-the-flaw, design questions (never "What is X?")
- **Hook questions** — Each quiz ends with a teaser for the next section
- **Adaptive re-explanation** — Different analogy, ASCII diagram, worked example, different domain (max 2 retries)
- **Works for any subject** — Technical and non-technical topics use the same method
- **Pause and resume** — Stop mid-session and pick up later with a summary

## Installation

```bash
./scripts/stow-install.sh one-p-learning
```

## Testing

The skill includes evaluation cases in `evals/evals.json` that test:
- Complex technical topics (Bitcoin, Kubernetes)
- Topics with prior knowledge (HTTP with curl experience)
- Simpler focused topics (C pointers)
- Non-technical topics (music theory)
- Skip requests (Kubernetes with Docker knowledge)

## License

MIT License - see LICENSE.txt
