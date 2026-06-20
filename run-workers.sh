#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$DIR/.env" ]; then
  set -a
  . "$DIR/.env"
  set +a
fi

HTML_MODEL="${HTML_MODEL}"
HTML_MODEL_REASONING_EFFORT="${HTML_MODEL_REASONING_EFFORT}"

JS_MODEL="${JS_MODEL}"
JS_MODEL_REASONING_EFFORT="${JS_MODEL_REASONING_EFFORT}"

TEST_MODEL="${TEST_MODEL}"
TEST_MODEL_REASONING_EFFORT="${TEST_MODEL_REASONING_EFFORT}"

touch logs/worker-html.log
touch logs/worker-js.log
touch logs/worker-tests.log

echo "Running HTML worker with model: $HTML_MODEL $HTML_MODEL_REASONING_EFFORT"
codex exec \
  -c model_reasoning_effort="$HTML_MODEL_REASONING_EFFORT" \
  --model "$HTML_MODEL" \
  "$(cat prompts/worker-html.md)" > logs/worker-html.log 2>&1

echo ""
echo "Running JS worker with model: $JS_MODEL $JS_MODEL_REASONING_EFFORT"
codex exec \
  -c model_reasoning_effort="$JS_MODEL_REASONING_EFFORT" \
  --model "$JS_MODEL" \
  "$(cat prompts/worker-js.md)" > logs/worker-js.log 2>&1

echo ""
echo "Running Tests worker with model: $TEST_MODEL $TEST_MODEL_REASONING_EFFORT"
codex exec \
  -c model_reasoning_effort="$TEST_MODEL_REASONING_EFFORT" \
  --model "$TEST_MODEL" \
  "$(cat prompts/worker-tests.md)" > logs/worker-tests.log 2>&1

echo ""
echo "Workers finished."
