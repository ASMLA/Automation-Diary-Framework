@echo off
setlocal

if exist .venv\Scripts\activate.bat call .venv\Scripts\activate.bat

robot --outputdir results\framework --include framework tests\framework

endlocal
