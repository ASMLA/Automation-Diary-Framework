param(
    [ValidateSet("all", "hot", "bpweb", "bhub")]
    [string]$Target = "all"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path ".\.venv\Scripts\Activate.ps1")) {
    throw "Virtual environment not found. Run scripts\setup_windows.bat first."
}

. .\.venv\Scripts\Activate.ps1

switch ($Target) {
    "all"   { robot -d results -i smoke tests }
    "hot"   { robot -d results/hot -i smoke -i hot tests/hot }
    "bpweb" { robot -d results/bpweb -i smoke -i bpweb tests/bpweb }
    "bhub"  { robot -d results/bhub -i smoke -i bhub tests/bhub }
}

exit $LASTEXITCODE
