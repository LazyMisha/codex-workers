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

## example of flow output

```bash
Step 1: Run architecture
Running architect with model: gpt-5.5 xhigh

Architecture created: reports/architecture.md
Step 2: Run architecture review
Running architecture reviewer with model: gpt-5.5 xhigh

Review created: reports/architecture-review.md
Step 3: Run fix loop for architecture if needed

Fix architecture loop iteration: 1
Running architecture fixer with model: gpt-5.5 xhigh
Running architecture reviewer again with model: gpt-5.5 xhigh
Approved after fix architecture loop iteration: 1

Approve architecture and continue with plan? Type 'yes': yes
Step 4: Run planner
Running planner with model: gpt-5.5 xhigh

Plan created: reports/plan.md

Approve plan and continue with workers? Type 'yes': yes

Creating package.json

Step 5: Run workers
Running HTML worker with model: gpt-5.4 medium

Running JS worker with model: gpt-5.4 xhigh

Running Tests worker with model: gpt-5.4 medium

Workers finished.

Step 6: Run review
Running reviewer with model: gpt-5.5 xhigh

Review created: reports/review.md

Step 7: Run fix loop if needed
Review approved. No fix loop needed.

Step 8: Create final summary

Flow completed.

Final summary:

# Final Summary

## Task

Build a simple static vanilla JavaScript Todo app that supports adding, removing, completing, and displaying todos in the browser.

## Workers used

| Worker | Files |
|---|---|
| HTML/CSS Worker | `index.html`, `src/styles.css` |
| JavaScript Logic Worker | `src/todos.js`, `src/app.js` |
| Tests Worker | `package.json`, `tests/todos.test.js` |

## Tests

PASSED : 6 | FAILED : 0

## Review result

Approved. The implementation matches the task requirements and architecture rules, with passing tests and no blocking issues. Browser HTTP verification was not completed because the sandbox could not bind a local port.

## Remaining risks briefly

The only noted gap is the environment-limited browser verification step. The code and tests are in place, but full local HTTP rendering was not confirmed in the sandbox.
```
