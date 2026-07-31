# Common Errors

## Couldn't execute node

Example:

```text
Couldn't execute node. Please ensure you have node.js installed and in PATH.
```

Cause: Node.js is missing or the terminal has not loaded the updated `PATH`.

Resolution:

```bat
node --version
where node
```

Install Node.js LTS, close all terminals, open a new terminal, reactivate `.venv`, and run:

```bat
rfbrowser init
```

## `rfbrowser` is not recognized

Confirm the virtual environment is active and dependencies are installed:

```bash
python -m pip install -r requirements.txt
python -m Browser.entry init
```

## Virtual environment not found

Windows scripts expect `.venv` in the repository root. Run:

```bat
scripts\setup_windows.bat
```

## Connection, DNS, or timeout error

Examples include `ERR_NAME_NOT_RESOLVED`, `ERR_CONNECTION_TIMED_OUT`, or navigation timeout.

Check:

- VPN or corporate network
- Manual access to the URL
- DNS resolution
- Environment availability
- Firewall permissions

## Test opens a login or access page

Current Smoke Tests do not automate authentication. The page-root check may confirm that a page rendered without proving that the expected authenticated home page loaded. Record the behavior and implement a stable authenticated-page assertion only after the real application flow is confirmed.

## Locator not found

Review the real DOM and update the page resource. Prefer a stable locator contract and avoid long DOM-position XPath expressions. If a fallback is necessary, keep candidates separate and ordered.

## Where to investigate

Open `results/log.html` for the failing keyword, locator, screenshot, and complete error message before changing code.
