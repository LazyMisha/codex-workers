#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$DIR/.env" ]; then
  set -a
  . "$DIR/.env"
  set +a
fi

ARCHITECT_MODEL="${ARCHITECT_MODEL}"
ARCHITECT_MODEL_REASONING_EFFORT="${ARCHITECT_MODEL_REASONING_EFFORT}"

touch reports/architecture.md
touch logs/architecture.log

echo "Running architect with model: $ARCHITECT_MODEL $ARCHITECT_MODEL_REASONING_EFFORT"

codex exec \
  -c model_reasoning_effort="$ARCHITECT_MODEL_REASONING_EFFORT" \
  --model "$ARCHITECT_MODEL" \
  "$(cat prompts/architect.md)" > logs/architecture.log 2>&1

echo ""
echo "Architecture created: reports/architecture.md"
