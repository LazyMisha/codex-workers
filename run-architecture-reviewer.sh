#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$DIR/.env" ]; then
  set -a
  . "$DIR/.env"
  set +a
fi

ARCHITECTURE_REVIEWER_MODEL="${ARCHITECTURE_REVIEWER_MODEL}"
ARCHITECTURE_REVIEWER_MODEL_REASONING_EFFORT="${ARCHITECTURE_REVIEWER_MODEL_REASONING_EFFORT}"

touch reports/architecture-review.md
touch logs/architecture-review.log

echo "Running architecture reviewer with model: $ARCHITECTURE_REVIEWER_MODEL ${ARCHITECTURE_REVIEWER_MODEL_REASONING_EFFORT}"
codex exec \
  -c model_reasoning_effort="$ARCHITECTURE_REVIEWER_MODEL_REASONING_EFFORT" \
  --model "$ARCHITECTURE_REVIEWER_MODEL" \
  "$(cat prompts/architecture-reviewer.md)" > logs/architecture-review.log 2>&1

echo ""
echo "Review created: reports/architecture-review.md"
