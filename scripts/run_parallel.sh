#!/usr/bin/env bash
set -euo pipefail

PARALLEL_PROCESSES="${PARALLEL_PROCESSES:-2}"
EXECUTION_SCOPE="${EXECUTION_SCOPE:-framework}"
PARALLEL_OUTPUT_DIR="${PARALLEL_OUTPUT_DIR:-reports/parallel}"

echo "Running Robot Framework in parallel"
echo "Processes: ${PARALLEL_PROCESSES}"
echo "Scope: ${EXECUTION_SCOPE}"
echo "Output: ${PARALLEL_OUTPUT_DIR}"

case "${EXECUTION_SCOPE}" in
  framework)
    pabot --processes "${PARALLEL_PROCESSES}" --outputdir "${PARALLEL_OUTPUT_DIR}" tests/framework
    ;;
  smoke)
    pabot --processes "${PARALLEL_PROCESSES}" --outputdir "${PARALLEL_OUTPUT_DIR}" --include smoke tests
    ;;
  *)
    pabot --processes "${PARALLEL_PROCESSES}" --outputdir "${PARALLEL_OUTPUT_DIR}" tests
    ;;
esac
