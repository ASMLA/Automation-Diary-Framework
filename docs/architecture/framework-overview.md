# Framework Overview

## Purpose

This repository is a maintainable web test automation framework for HOT, BP WEB, and BHUB. It uses Robot Framework with Browser Library, which runs browser automation through Playwright.

The current executable scope is environment availability validation through Smoke Tests. Business and end-to-end suites remain templates until their authenticated workflows and stable application contracts are confirmed.

## Execution flow

```text
Test suite
  -> shared suite lifecycle
    -> application business keyword
    -> shared browser keyword
      -> page locator and environment variables
        -> Browser Library / Playwright
          -> HTML report, execution log, XML output, and screenshots
```

Example:

```text
HOT Should Be Available
  -> Validate HOT Availability
    -> Access Application And Validate Health
    -> Validate Application Initial Page
```

## Architectural responsibilities

| Area | Responsibility |
|---|---|
| `tests/` | Executable scenarios and suite-level setup/teardown |
| `resources/suites/` | Shared suite setup and teardown contracts |
| `resources/keywords/applications/` | Application-specific and business-readable behavior |
| `resources/keywords/common/` | Shared technical browser behavior |
| `resources/pages/` | Locators and page-level element contracts |
| `resources/variables/` | URLs, URL fragments, browser settings, timeouts, and validation catalogs |
| `data/` | External test data |
| `scripts/` | Supported execution helpers |
| `docs/` | Architecture, onboarding, execution, contribution guidance, and engineering history |
| `results/` | Generated reports and evidence; not source code |

## Design principles

- Tests communicate business intent.
- Technical details are hidden behind reusable keywords.
- Page resources own locators.
- Environment resources own configuration.
- Shared behavior is implemented once.
- Locators follow an explicit stability hierarchy.
- Documentation changes together with code.
- Dependency versions are explicit and approved by the project.
- Suite lifecycle behavior is centralized and defensive.

## Current scope

The Smoke Tests currently:

1. Open HOT, BP WEB, or BHUB.
2. Validate the expected environment URL.
3. Detect known technical error messages.
4. Confirm that the initial page root is visible.
5. Capture execution evidence.
6. Close the browser.

## Current limitations

- Authentication is not automated yet.
- Business-flow templates are not active tests.
- Corporate network or VPN access may be required.
- A generic page root proves page rendering, not complete business readiness.
- Stable application-specific locators must be confirmed against the authenticated DOM.
