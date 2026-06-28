#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$DIR/.env" ]; then
  set -a
  . "$DIR/.env"
  set +a
fi

ARCHITECTURE_FIX_MODEL="${ARCHITECTURE_FIX_MODEL}"
ARCHITECTURE_FIX_MODEL_REASONING_EFFORT="${ARCHITECTURE_FIX_MODEL_REASONING_EFFORT}"

ARCHITECTURE_REVIEWER_MODEL="${ARCHITECTURE_REVIEWER_MODEL}"
ARCHITECTURE_REVIEWER_MODEL_REASONING_EFFORT="${ARCHITECTURE_REVIEWER_MODEL_REASONING_EFFORT}"

MAX_LOOPS="${MAX_LOOPS}"

for i in $(seq 1 "$MAX_LOOPS"); do
  echo ""
  echo "Fix architecture loop iteration: $i"

  if grep -q "Status: APPROVED" reports/architecture-review.md; then
    echo "Architecture review already approved. No fixes needed."
    exit 0
  fi

  echo "Running architecture fixer with model: $ARCHITECTURE_FIX_MODEL ${ARCHITECTURE_FIX_MODEL_REASONING_EFFORT}"
  codex exec \
    -c model_reasoning_effort="$ARCHITECTURE_FIX_MODEL_REASONING_EFFORT" \
    --model "$ARCHITECTURE_FIX_MODEL" \
    "$(cat prompts/architecture-fixer.md)" > "logs/fix-loop-architecture-$i.log" 2>&1

  echo "Running architecture reviewer again with model: $ARCHITECTURE_REVIEWER_MODEL ${ARCHITECTURE_REVIEWER_MODEL_REASONING_EFFORT}"
  codex exec \
    -c model_reasoning_effort="$ARCHITECTURE_REVIEWER_MODEL_REASONING_EFFORT" \
    --model "$ARCHITECTURE_REVIEWER_MODEL" \
    "$(cat prompts/architecture-reviewer.md)" > "logs/architecture-review-loop-$i.log" 2>&1

  if grep -q "Status: APPROVED" reports/architecture-review.md; then
    echo "Approved after fix architecture loop iteration: $i"
    exit 0
  fi
done

echo "Max fix architecture loops reached. Check reports/architecture-review.md manually."
exit 1
