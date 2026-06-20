#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$DIR/.env" ]; then
  set -a
  . "$DIR/.env"
  set +a
fi

FIX_MODEL="${FIX_MODEL}"
FIX_MODEL_REASONING_EFFORT="${FIX_MODEL_REASONING_EFFORT}"

REVIEW_MODEL="${REVIEW_MODEL}"
REVIEW_MODEL_REASONING_EFFORT="${REVIEW_MODEL_REASONING_EFFORT}"

MAX_LOOPS="${MAX_LOOPS}"

for i in $(seq 1 "$MAX_LOOPS"); do
  echo ""
  echo "Fix loop iteration: $i"

  if grep -q "Status: APPROVED" reports/review.md; then
    echo "Review already approved. No fixes needed."
    exit 0
  fi

  echo "Running fixer with model: $FIX_MODEL ${FIX_MODEL_REASONING_EFFORT}"
  codex exec \
    -c model_reasoning_effort="$FIX_MODEL_REASONING_EFFORT" \
    --model "$FIX_MODEL" \
    "$(cat prompts/fixer.md)" > "logs/fix-loop-$i.log" 2>&1

  echo "Running reviewer again with model: $REVIEW_MODEL ${REVIEW_MODEL_REASONING_EFFORT}"
  codex exec \
    -c model_reasoning_effort="$REVIEW_MODEL_REASONING_EFFORT" \
    --model "$REVIEW_MODEL" \
    "$(cat prompts/reviewer.md)" > "logs/review-loop-$i.log" 2>&1

  if grep -q "Status: APPROVED" reports/review.md; then
    echo "Approved after fix loop iteration: $i"
    exit 0
  fi
done

echo "Max fix loops reached. Check reports/review.md manually."
exit 1
