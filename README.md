# Automation Diary Framework

**Project Status:** Phase 2 — Anti-Flakiness Strategy Established

## About this project

This repository documents the evolution of a generic, production-oriented test automation framework built with:

- Robot Framework
- Browser Library (Playwright)
- Page Object architecture
- Business Keywords
- Shared technical utilities
- External configuration and test data
- Cross-platform setup and execution
- Versioned documentation
- CI/CD and API capabilities planned through the first saga

The first Automation Diary saga focuses on building the framework itself. Real application onboarding will begin only after the generic framework reaches its v1.0 milestone.

The existing HOT, BP WEB, and BHUB Smoke Tests remain as executable examples that prove the framework foundation, but new application-specific screens, buttons, fields, and business rules will not be invented during this saga.

## Current version

`v0.11.0`

## Current executable scope

The active Smoke Tests currently:

- open each configured homologation environment;
- validate the expected URL;
- detect known technical error messages;
- confirm that the initial page root rendered;
- generate HTML/XML reports and browser evidence;
- perform defensive cleanup without masking the original test result.

Authentication and complete business flows remain future application-onboarding work. Corporate VPN or network access may be required for the current executable examples.

## Architecture — v0.9.0

Version `v0.9.0` formalizes the framework contract:

```text
Tests
  -> Business Keywords
    -> Page Objects
      -> Technical Utilities / Browser Library
        -> Playwright
          -> Browser
```

### Tests

Own scenarios, tags, expected behavior, and scenario-level assertions.

Tests must not contain locators or direct Browser Library commands.

### Business Keywords

Own business intent and workflow orchestration.

Business Keywords must not contain CSS, XPath, or direct `Click` / `Fill Text` calls.

### Page Objects

Own locators and UI-level operations.

A UI change should normally be resolved inside this layer without changing the business flow.

### Technical Utilities

Own cross-cutting browser concerns such as session lifecycle, defensive cleanup, and technical-error validation.


## Test Data Management — v0.10.0

Version `v0.10.0` adds an application-agnostic Test Data Management capability. The framework now separates test data into two concerns:

- `data/` owns declarative YAML templates, static reference values, and environment data policies;
- `resources/data/` owns executable generation, building, validation, and cleanup orchestration.

The generic flow is:

```text
Data Template / Defaults
  -> Generator
    -> Builder
      -> Validator
        -> Business Test
          -> Cleanup Registry
```

The framework intentionally does not create HOT, BP WEB, or BHUB records yet. Real application creation and deletion adapters belong to the second saga, after the generic framework is complete.

### Framework-level validation

The new Test Data Management capability can be validated independently from any browser or application:

```bat
scripts\run_framework_tests.bat
```

```powershell
.\scripts\run_framework_tests.ps1
```

```bash
scripts/run_framework_tests.sh
```

These tests validate traceable generated identifiers, safe non-production emails, controlled overrides, required-field validation, and cleanup registration.

## Anti-Flakiness Strategy — v0.11.0

Version `v0.11.0` adds a central synchronization policy. The framework prefers Playwright/Browser Library auto-waiting and observable state-based waits over fixed sleeps. Retry behavior is deliberately restricted to idempotent, read-only checks where eventual consistency is expected. State-changing operations must not be blindly retried.

Timing policy lives in `resources/variables/resilience.resource`, while reusable synchronization behavior lives in `resources/keywords/technical/synchronization.resource`. Framework-level tests verify that this policy remains explicit and free from fixed `Sleep` calls.

## Current project status

### Foundation completed

- ✅ Planning and automation strategy
- ✅ Independent Smoke Tests
- ✅ Reusable keywords and DRY refactoring
- ✅ Clean project structure
- ✅ Explicit locator strategy
- ✅ Architecture, onboarding, execution, extension, and troubleshooting documentation
- ✅ First sprint retrospective and roadmap
- ✅ Maintainability baseline and controlled dependencies
- ✅ Explicit Page Object vs Business Keyword architecture
- ✅ Generic Test Data Management architecture with builders, generators, validators, and cleanup registry

### Planned next

- ✅ Generic test-data management architecture
- ✅ Flaky-test prevention strategy and centralized synchronization
- 🚧 CI/CD integration
- 🚧 Scaling and parallel execution
- 🚧 Logging and reporting improvements
- 🚧 API + UI architecture
- 🚧 End-to-End orchestration
- 🚧 Quality metrics and production-readiness capabilities through #024

## Start here

| Guide | Purpose |
|---|---|
| [Framework Overview](docs/architecture/framework-overview.md) | Architecture, responsibilities, and execution flow |
| [Page Objects vs Business Keywords](docs/architecture/page-objects-vs-business-keywords.md) | v0.9 layer contracts and change ownership |
| [Maintainability Guidelines](docs/architecture/maintainability-guidelines.md) | Change ownership, dependency policy, and review checklist |
| [Test Data Management](docs/architecture/test-data-management.md) | Builders, generators, validators, templates, and cleanup contracts |
| [Anti-Flakiness Strategy](docs/architecture/anti-flakiness-strategy.md) | Synchronization, timeout, and safe retry policy |
| [Onboarding Guide](docs/getting-started/onboarding.md) | Prepare Windows, Linux, or macOS |
| [Execution Guide](docs/getting-started/execution.md) | Run all tests or one application and read results |
| [How to Add a Test](docs/guides/adding-tests.md) | Extend the framework without mixing responsibilities |
| [Common Errors](docs/troubleshooting/common-errors.md) | Diagnose Node.js, Browser Library, VPN, and locator failures |
| [Project Retrospective](docs/project/project-retrospective.md) | Review Sprint 1 decisions, results, and improvement opportunities |
| [Roadmap](docs/roadmap.md) | Follow the first saga through #024 and the future real-application saga |

## Quick start — Windows

```bat
scripts\setup_windows.bat
scripts\run_smoke.bat all
```

## Quick start — Linux and macOS

```bash
chmod +x scripts/setup_unix.sh scripts/run_smoke.sh
scripts/setup_unix.sh
scripts/run_smoke.sh all
```

## Approved dependencies

```text
robotframework==7.4.2
robotframework-browser==20.2.0
PyYAML==6.0.3
```

The setup scripts install project-approved versions. Dependency upgrades are intentional framework changes and must be tested, documented, and versioned.

## Project structure

```text
.
├── data
│   ├── environments
│   ├── static
│   └── templates
├── docs
│   ├── architecture
│   ├── automation-diary
│   ├── getting-started
│   ├── guides
│   ├── project
│   └── troubleshooting
├── resources
│   ├── data
│   │   ├── builders
│   │   ├── cleanup
│   │   ├── generators
│   │   └── validators
│   ├── keywords
│   │   ├── applications        # compatibility paths from earlier versions
│   │   ├── business
│   │   │   ├── applications   # current executable example adapters
│   │   │   ├── common
│   │   │   └── templates      # generic onboarding contract
│   │   ├── common              # compatibility path
│   │   └── technical
│   ├── pages
│   │   ├── applications        # current executable example page objects
│   │   ├── common
│   │   └── templates           # generic page-object contract
│   ├── suites
│   └── variables
├── results
├── scripts
├── tests
│   ├── bhub
│   ├── bpweb
│   ├── e2e
│   ├── hot
│   └── framework          # application-independent capability tests
├── CHANGELOG.md
├── README.md
└── requirements.txt
```

## Compatibility policy

Version `v0.9.0` introduces explicit layered paths without breaking the paths used by previous episodes.

Earlier files under:

```text
resources/keywords/applications/
resources/keywords/common/
resources/pages/<application>_page.resource
```

remain as compatibility resources. New code must use the `business`, `technical`, and explicit Page Object paths.

## Automation Diary

| Episode | Status |
|---|---|
| ✅ #001 – Planning Before Coding | Completed |
| ✅ #002 – Why I Always Start with Smoke Tests | Completed |
| ✅ #003 – Building Reusable Keywords Instead of Duplicated Code | Completed |
| ✅ #004 – The Importance of a Clean Project Structure | Completed |
| ✅ #005 – Choosing the Right Locator Strategy | Completed |
| ✅ #006 – Why Documentation Is Part of Automation | Completed |
| ✅ #007 – Lessons Learned After the First Sprint | Completed |
| ✅ #008 – Designing Automation for Maintainability | Completed |
| ✅ #009 – Page Objects vs Business Keywords | Completed |
| 🔄 #010 – Managing Test Data Efficiently | Current |
| ⏳ #011 – Avoiding Flaky Tests | Next |

## Episode documentation

- [#001 – Planning Before Coding](docs/automation-diary/001-planning-before-coding.md)
- [#002 – Why I Always Start with Smoke Tests](docs/automation-diary/002-smoke-tests.md)
- [#003 – Building Reusable Keywords Instead of Duplicated Code](docs/automation-diary/003-reusable-keywords.md)
- [#004 – The Importance of a Clean Project Structure](docs/automation-diary/004-clean-project-structure.md)
- [#005 – Choosing the Right Locator Strategy](docs/automation-diary/005-locator-strategy.md)
- [#006 – Why Documentation Is Part of Automation](docs/automation-diary/006-documentation-is-part-of-automation.md)
- [#007 – Lessons Learned After the First Sprint](docs/automation-diary/007-lessons-learned.md)
- [#008 – Designing Automation for Maintainability](docs/automation-diary/008-designing-automation-for-maintainability.md)
- [#009 – Page Objects vs Business Keywords](docs/automation-diary/009-page-objects-vs-business-keywords.md)
- [#010 – Managing Test Data Efficiently](docs/automation-diary/010-managing-test-data-efficiently.md)

## Version history

| Version | Episode | Description |
|---|---|---|
| v0.1.0 | #001 | Framework planning and architecture |
| v0.2.0 | #002 | Smoke Test strategy |
| v0.3.0 | #003 | Reusable keywords and DRY refactoring |
| v0.4.0 | #004 | Clean project structure |
| v0.5.0 | #005 | Stable locator strategy |
| v0.6.0 | #006 | Technical documentation and onboarding |
| v0.7.0 | #007 | First sprint retrospective and roadmap |
| v0.8.0 | #008 | Maintainability baseline and controlled change points |
| v0.9.0 | #009 | Page Object and Business Keyword responsibility boundaries |
| v0.10.0 | #010 | Generic Test Data Management capability |

## First-saga goal

The first saga continues through Automation Diary #024.

At that point, the framework should be a complete generic automation platform ready to receive real systems by adding application-specific:

- environment configuration;
- Page Objects and locators;
- Business Keywords;
- test data;
- API clients and schemas;
- Smoke, Functional, Integration, and End-to-End scenarios.

The second saga will focus on applying the finished framework to real enterprise applications.

## Philosophy

> Reliable automation requires reliable test data. Data creation, validation, traceability, and cleanup should be engineered as framework capabilities rather than repeated inside test cases.

## Author

**André Leite**  
Senior QA Automation Engineer


## Continuous Integration (v0.12.0)

The framework now includes `.github/workflows/robot-framework-ci.yml`.
It automatically runs framework capability tests and smoke tests in GitHub Actions, initializes Browser/Playwright, and publishes Robot Framework reports as artifacts. The workflow remains application-agnostic and is ready for future real-system onboarding.
