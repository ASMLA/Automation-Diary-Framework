# Execution Guide

## Before running

Confirm:

- The virtual environment is active.
- Node.js is available in `PATH`.
- `rfbrowser init` completed successfully.
- VPN or corporate network access is active when required.
- The homologation URLs can be opened manually.

## Windows

The repository includes supported helper scripts.

Run all Smoke Tests:

```bat
scripts\run_smoke.bat all
```

Run one application:

```bat
scripts\run_smoke.bat hot
scripts\run_smoke.bat bpweb
scripts\run_smoke.bat bhub
```

PowerShell alternative:

```powershell
.\scripts\run_smoke.ps1 -Target all
.\scripts\run_smoke.ps1 -Target hot
```

## Linux and macOS

Activate the virtual environment:

```bash
source .venv/bin/activate
```

Run all Smoke Tests:

```bash
robot -d results -i smoke tests
```

Run one application:

```bash
robot -d results/hot -i smoke -i hot tests/hot
robot -d results/bpweb -i smoke -i bpweb tests/bpweb
robot -d results/bhub -i smoke -i bhub tests/bhub
```

## Browser visibility

The browser behavior is controlled in `resources/variables/environment.resource`. With headless mode disabled, Chromium opens visibly during execution. Headless execution is more appropriate for CI/CD and will be introduced with pipeline work.

## Results

A complete execution generates:

```text
results/
├── log.html
├── report.html
├── output.xml
└── browser/
```

- `report.html`: summary by suite and test.
- `log.html`: keyword-by-keyword details and failures.
- `output.xml`: machine-readable Robot Framework result.
- `browser/`: Browser Library evidence and screenshots when generated.

## Recommended execution order

1. Run one application.
2. Review `results/<application>/log.html`.
3. Resolve access, locator, or environment failures.
4. Run all Smoke Tests.

## Expected outcomes

A successful full execution should report three passing availability tests. A failure can indicate:

- Node.js missing from `PATH`
- Browser Library not initialized
- VPN disconnected
- DNS or environment outage
- Authentication or access page displayed
- Locator no longer matching the real DOM
- Known technical error detected

See [Common Errors](../troubleshooting/common-errors.md).
