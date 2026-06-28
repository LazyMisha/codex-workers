#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ -f "$DIR/.env" ]; then
  set -a
  . "$DIR/.env"
  set +a
fi

rm -rf reports logs
mkdir reports logs

echo "Step 1: Run architecture"
./run-architecture.sh

echo "Step 2: Run architecture review"
./run-architecture-reviewer.sh

echo "Step 3: Run fix loop for architecture if needed"
if grep -q "Status: APPROVED" reports/architecture-review.md; then
  echo "Architecture review passed. No fix loop needed."
else
  ./run-fix-loop-architecture.sh
fi

echo ""
read -p "Approve architecture and continue with plan? Type 'yes': " ARCH_APPROVAL
if [ "$ARCH_APPROVAL" != "yes" ]; then
  echo "Stopped. Architecture was not approved."
  exit 0
fi

echo "Step 4: Run planner"
./run-plan.sh

echo ""
read -p "Approve plan and continue with workers? Type 'yes': " APPROVAL

if [ "$APPROVAL" != "yes" ]; then
  echo "Stopped. Plan was not approved."
  exit 0
fi

if [ ! -f package.json ]; then
  echo ""
  echo "Creating package.json"
  project_name="$(basename "$PWD")"
  cat > package.json <<EOF
{
  "name": "$project_name",
  "version": "1.0.0",
  "private": true
}
EOF
fi

echo ""
echo "Step 5: Run workers"
./run-workers.sh

echo ""
echo "Step 6: Run review"
./run-review.sh

echo ""
echo "Step 7: Run fix loop if needed"

if grep -q "Status: APPROVED" reports/review.md; then
  echo "Review approved. No fix loop needed."
else
  ./run-fix-loop.sh
fi

echo ""
echo "Step 8: Create final summary"

SUMMARY_MODEL="${SUMMARY_MODEL}"
SUMMARY_MODEL_REASONING_EFFORT="${SUMMARY_MODEL_REASONING_EFFORT}"

codex exec \
  -c model_reasoning_effort="$SUMMARY_MODEL_REASONING_EFFORT" \
  --model "$SUMMARY_MODEL" \
  "$(cat prompts/summary.md)" > logs/summary.log 2>&1

echo ""
echo "Flow completed."
echo ""
echo "Final summary:"
echo ""
cat reports/final-summary.md
