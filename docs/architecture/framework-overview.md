# Framework Overview

## Purpose

This repository is evolving into a generic, maintainable automation framework built with Robot Framework and Browser Library (Playwright). The first saga focuses on engineering the framework itself. Real application onboarding will happen after the framework reaches its v1.0 milestone.

The current executable examples still validate HOT, BP WEB, and BHUB availability because they were used to prove the foundation, but version `v0.9.0` formalizes a generic architecture that is not coupled to those applications.

## Architecture

```text
Test suite
  -> shared suite lifecycle
  -> Business Keyword
    -> Page Object
      -> Browser Library / technical utility
        -> Playwright
          -> browser
            -> HTML report, log, XML output, screenshots
```

## Architectural responsibilities

| Area | Responsibility |
|---|---|
| `tests/` | Scenarios, tags, expected behavior, scenario-level assertions |
| `resources/keywords/business/` | Business intent and reusable workflow orchestration |
| `resources/pages/` | Locators, UI operations, page-level waits, element reads |
| `resources/keywords/technical/` | Cross-cutting browser and technical behavior |
| `resources/suites/` | Shared suite setup and teardown contracts |
| `resources/variables/` | Environment and execution configuration |
| `data/` | External test data |
| `scripts/` | Supported setup and execution helpers |
| `docs/` | Architecture, onboarding, execution, engineering history |
| `results/` | Generated evidence and reports |

## Business Keywords vs Page Objects

Business Keywords answer: **what is the user or business process trying to do?**

Page Objects answer: **how does the UI perform that interaction?**

A Business Keyword must not contain selectors or direct Browser Library commands. A Page Object may contain Browser Library commands, but it must not decide business rules.

## Compatibility

Paths used before v0.9.0 remain as compatibility resources. New development must use the explicit `business`, `technical`, and `pages` layers.

## Generic framework strategy

Until the end of the first saga, new screens, URLs, buttons, texts, and application-specific locators will not be invented. The framework will provide templates and contracts. Real application mapping starts only after the generic framework is complete.

## Current executable scope

The existing Smoke Tests still:

1. Open HOT, BP WEB, or BHUB.
2. Validate the expected environment URL.
3. Detect known technical errors.
4. Confirm that the initial page root is visible.
5. Capture evidence.
6. Close the browser defensively.

## Design principles

- Tests communicate business intent.
- Business Keywords do not know selectors.
- Page Objects own UI implementation.
- Technical utilities own cross-cutting browser behavior.
- Configuration has one authoritative location.
- Shared behavior is implemented once.
- Locators follow an explicit stability hierarchy.
- Dependency versions are controlled.
- Documentation evolves with code.
- Real application details are introduced only when the framework is ready to onboard them.

## Test Data Management layer — v0.10.0

The framework now provides application-independent test-data services under `resources/data/` and declarative YAML under `data/`.

Business tests should consume prepared data objects rather than generating random values inline. Builders compose data, generators create traceable runtime values, validators fail fast on invalid preconditions, and the cleanup registry tracks disposable records for future application-specific deletion adapters.

This layer is intentionally generic during Saga 1.
