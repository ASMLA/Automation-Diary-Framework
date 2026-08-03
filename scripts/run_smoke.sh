#!/usr/bin/env bash
set -euo pipefail

if [ ! -f ".venv/bin/activate" ]; then
  echo "[ERROR] Virtual environment not found. Run scripts/setup_unix.sh first."
  exit 1
fi

source .venv/bin/activate
TARGET="${1:-all}"

case "$TARGET" in
  all) robot -d results -i smoke tests ;;
  hot) robot -d results/hot -i smoke -i hot tests/hot ;;
  bpweb) robot -d results/bpweb -i smoke -i bpweb tests/bpweb ;;
  bhub) robot -d results/bhub -i smoke -i bhub tests/bhub ;;
  *) echo "[ERROR] Invalid target: $TARGET"; echo "Usage: scripts/run_smoke.sh [all|hot|bpweb|bhub]"; exit 2 ;;
esac
