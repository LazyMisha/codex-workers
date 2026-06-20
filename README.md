# Codex Workers

An automated agentic workflow using Codex CLI to build simple frontend apps.

It splits work across specialized workers (planner, HTML, JS, tests, review, fix, summary), each using a different model to balance quality and cost.

## Requirements

- [Codex CLI](https://github.com/openai/codex)

## Setup

```bash
cp .env.example .env
# edit .env if you want to change models
```

## Run the full flow

```bash
./run-flow.sh
```

## Project task

See `task.md` for the current app requirements.
