@echo off
setlocal

where python >nul 2>&1 || (
    echo [ERROR] Python was not found in PATH.
    exit /b 1
)

where node >nul 2>&1 || (
    echo [ERROR] Node.js was not found in PATH. Install a supported LTS version before continuing.
    exit /b 1
)

if not exist .venv\Scripts\activate.bat (
    python -m venv .venv
    if errorlevel 1 exit /b 1
)

call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
python -m Browser.entry init chromium

if errorlevel 1 exit /b 1

echo Environment setup completed with the project-approved dependency versions.
