@echo off
setlocal

if "%PARALLEL_PROCESSES%"=="" set PARALLEL_PROCESSES=2
if "%EXECUTION_SCOPE%"=="" set EXECUTION_SCOPE=framework
if "%PARALLEL_OUTPUT_DIR%"=="" set PARALLEL_OUTPUT_DIR=reports\parallel

echo Running Robot Framework in parallel
echo Processes: %PARALLEL_PROCESSES%
echo Scope: %EXECUTION_SCOPE%
echo Output: %PARALLEL_OUTPUT_DIR%

if /I "%EXECUTION_SCOPE%"=="framework" (
    pabot --processes %PARALLEL_PROCESSES% --outputdir "%PARALLEL_OUTPUT_DIR%" tests\framework
) else if /I "%EXECUTION_SCOPE%"=="smoke" (
    pabot --processes %PARALLEL_PROCESSES% --outputdir "%PARALLEL_OUTPUT_DIR%" --include smoke tests
) else (
    pabot --processes %PARALLEL_PROCESSES% --outputdir "%PARALLEL_OUTPUT_DIR%" tests
)

exit /b %ERRORLEVEL%
