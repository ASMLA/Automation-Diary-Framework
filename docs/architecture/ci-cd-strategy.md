# CI/CD Strategy

Version v0.12.0 introduces continuous integration as a framework capability.

## Triggers
- Pushes to `main` and `develop`
- Pull requests targeting `main` or `develop`
- Manual `workflow_dispatch`

## Pipeline
The pipeline separates framework capability tests from browser smoke tests.

### Framework tests
Checkout, configure Python, install dependencies, execute `tests/framework`, and publish Robot Framework reports.

### Smoke tests
Checkout, configure Python and Node.js, install dependencies, initialize Robot Framework Browser/Playwright, execute smoke tests, and publish reports.

## Quality gate
CI provides repeatable feedback in a clean shared environment. Reports are uploaded even after failures so diagnostic evidence is preserved.

## Application-agnostic design
No real application credentials, secrets, locators, or business-specific CI rules are introduced. Real systems can later connect to this pipeline without redesigning the framework.
