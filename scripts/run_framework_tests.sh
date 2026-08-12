#!/usr/bin/env bash
set -euo pipefail

if [[ -f ".venv/bin/activate" ]]; then
  source .venv/bin/activate
fi

robot --outputdir results/framework --include framework tests/framework
