# Onboarding Guide

## Who this guide is for

Use this guide when preparing the framework on a new workstation or when onboarding a new contributor.

## Required access

Before installing tools, confirm that you can access the HOT, BP WEB, and BHUB homologation environments. Depending on company policy, this may require:

- Corporate VPN or network access
- Valid application credentials
- DNS and firewall permissions
- Repository access

## Required software

- Git
- Python 3.10 or newer
- Node.js LTS
- npm, installed with Node.js
- A terminal with access to the project directory

Verify the tools:

```bash
git --version
python --version
node --version
npm --version
```

On Windows, `py --version` may be used when `python` is not available as a command.

## Clone or update the repository

```bash
git clone <repository-url>
cd Automation-Diary-Framework
```

For an existing local copy:

```bash
git switch main
git pull origin main
```

## Python virtual environment

The project uses `.venv` so dependencies remain isolated from the global Python installation.

### Windows

```bat
python -m venv .venv
.venv\Scripts\activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
rfbrowser init
```

### Linux and macOS

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
rfbrowser init
```

`rfbrowser init` installs the Node dependencies and Playwright browser binaries required by Robot Framework Browser.

## Validate the installation

```bash
python --version
node --version
robot --version
rfbrowser --version
```

Then run one focused Smoke Test before running the whole suite. See [Execution Guide](execution.md).

## First-day checklist

- Repository cloned and `main` updated
- Python virtual environment created
- Python dependencies installed
- Node.js available in `PATH`
- Browser Library initialized
- VPN or corporate network connected
- One application opens manually in a browser
- One targeted Smoke Test executed
- `results/log.html` reviewed
