@echo off
setlocal

if not exist .venv\Scripts\activate.bat (
    echo [ERROR] Virtual environment not found. Run scripts\setup_windows.bat first.
    exit /b 1
)

call .venv\Scripts\activate.bat

set TARGET=%~1
if "%TARGET%"=="" set TARGET=all

if /I "%TARGET%"=="all" (
    robot -d results -i smoke tests
    exit /b %ERRORLEVEL%
)

if /I "%TARGET%"=="hot" (
    robot -d results/hot -i smoke -i hot tests/hot
    exit /b %ERRORLEVEL%
)

if /I "%TARGET%"=="bpweb" (
    robot -d results/bpweb -i smoke -i bpweb tests/bpweb
    exit /b %ERRORLEVEL%
)

if /I "%TARGET%"=="bhub" (
    robot -d results/bhub -i smoke -i bhub tests/bhub
    exit /b %ERRORLEVEL%
)

echo [ERROR] Invalid target: %TARGET%
echo Usage: scripts\run_smoke.bat [all^|hot^|bpweb^|bhub]
exit /b 2
