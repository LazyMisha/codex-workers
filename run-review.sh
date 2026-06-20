#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$DIR/.env" ]; then
  set -a
  . "$DIR/.env"
  set +a
fi

REVIEW_MODEL="${REVIEW_MODEL}"
REVIEW_MODEL_REASONING_EFFORT="${REVIEW_MODEL_REASONING_EFFORT:-xhigh}"

touch reports/review.md
touch logs/review.log

echo "Running reviewer with model: $REVIEW_MODEL ${REVIEW_MODEL_REASONING_EFFORT}"
codex exec \
  -c model_reasoning_effort="$REVIEW_MODEL_REASONING_EFFORT" \
  --model "$REVIEW_MODEL" \
  "$(cat prompts/reviewer.md)" > logs/review.log 2>&1

echo ""
echo "Review created: reports/review.md"
