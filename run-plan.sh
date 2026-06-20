#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$DIR/.env" ]; then
  set -a
  . "$DIR/.env"
  set +a
fi

PLANNER_MODEL="${PLANNER_MODEL}"
PLANNER_MODEL_REASONING_EFFORT="${PLANNER_MODEL_REASONING_EFFORT}"

touch reports/plan.md
touch logs/plan.log

echo "Running planner with model: $PLANNER_MODEL $PLANNER_MODEL_REASONING_EFFORT"

codex exec \
  -c model_reasoning_effort="$PLANNER_MODEL_REASONING_EFFORT" \
  --model "$PLANNER_MODEL" \
  "$(cat prompts/planner.md)" > logs/plan.log 2>&1

echo ""
echo "Plan created: reports/plan.md"
