# Codex Workers

An automated agentic workflow using Codex CLI to build simple frontend apps.

It splits work across specialized workers (planner, HTML, JS, tests, review, fix, summary), each using a different model to balance quality and cost.

## Requirements

- [Codex CLI](https://github.com/openai/codex)
- `OPENAI_API_KEY` exported or placed in `.env`

## Setup

```bash
cp .env.example .env
# edit .env if you want to change models
```

## Run the full flow

```bash
./run-flow.sh
```

Steps:

1. `run-plan.sh` — generates an implementation plan.
2. You approve the plan.
3. `run-workers.sh` — writes `src/index.html`, `src/utils.js`, `src/app.js`, and tests.
4. `run-review.sh` — reviews the output.
5. `run-fix-loop.sh` — fixes any issues found, up to `MAX_LOOPS` iterations.
6. Summarizes the result into `reports/final-summary.md`.

## Project task

See `task.md` for the current app requirements.
