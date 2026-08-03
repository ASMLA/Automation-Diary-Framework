#!/usr/bin/env bash
set -euo pipefail

command -v python3 >/dev/null 2>&1 || { echo "[ERROR] python3 was not found in PATH."; exit 1; }
command -v node >/dev/null 2>&1 || { echo "[ERROR] Node.js was not found in PATH."; exit 1; }

if [ ! -d ".venv" ]; then
  python3 -m venv .venv
fi

source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m Browser.entry init chromium

echo "Environment setup completed with the project-approved dependency versions."
