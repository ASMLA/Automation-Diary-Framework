# Automation Diary Framework

**Project Status:** Framework Saga — Parallel Execution Strategy Established

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

`v0.20.0`

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
- ✅ Generic Test Data Management
- ✅ Anti-Flakiness and centralized synchronization
- ✅ CI/CD integration
- ✅ Framework scaling strategy
- ✅ Structured diagnostic logging
- ✅ API + UI integration architecture
- ✅ Shared readability and test-writing conventions
- ✅ End-to-End scenario orchestration
- ✅ Automation effectiveness metrics
- ✅ Environment and Configuration Management
- 🔄 Parallel Execution and Execution Strategy — current milestone

### Planned next

- ⏳ #021 — Secrets and Secure Test Configuration
- ⏳ #022 — Reporting, Evidence, and Execution Observability
- ⏳ #023 — Production-Readiness and Framework Governance
- ⏳ #024 — Framework Finalization and v1.0 Readiness
- ⏳ Real application onboarding after the generic framework is complete

## Start here

| Guide | Purpose |
|---|---|
| [Framework Overview](docs/architecture/framework-overview.md) | Architecture, responsibilities, and execution flow |
| [Page Objects vs Business Keywords](docs/architecture/page-objects-vs-business-keywords.md) | v0.9 layer contracts and change ownership |
| [Maintainability Guidelines](docs/architecture/maintainability-guidelines.md) | Change ownership, dependency policy, and review checklist |
| [Test Data Management](docs/architecture/test-data-management.md) | Builders, generators, validators, templates, and cleanup contracts |
| [Anti-Flakiness Strategy](docs/architecture/anti-flakiness-strategy.md) | Synchronization, timeout, and safe retry policy |
| [CI/CD Strategy](docs/architecture/ci-cd-strategy.md) | Robot Framework execution and validation in CI |
| [Scaling Strategy](docs/architecture/scaling-strategy.md) | Application boundaries, scopes, and scalable onboarding |
| [Logging Strategy](docs/architecture/logging-strategy.md) | Structured diagnostic logging and evidence |
| [API + UI Strategy](docs/architecture/api-ui-strategy.md) | API preparation and UI verification boundaries |
| [Readability and Test Conventions](docs/architecture/readability-and-test-conventions.md) | Shared test-writing contract |
| [End-to-End Scenario Strategy](docs/architecture/end-to-end-scenario-strategy.md) | Prepare, Act, Transition, Verify, Cleanup orchestration |
| [Automation Metrics Strategy](docs/architecture/automation-metrics-strategy.md) | Effectiveness indicators beyond test volume |
| [Environment & Configuration Management](docs/architecture/environment-and-configuration-management.md) | Runtime configuration and environment resolution |
| [Parallel Execution Strategy](docs/architecture/parallel-execution-strategy.md) | Configurable concurrency and test independence |
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
robotframework-pabot==5.2.2
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
| ✅ #010 – Managing Test Data Efficiently | Completed |
| ✅ #011 – Avoiding Flaky Tests | Completed |
| ✅ #012 – Integrating Robot Framework with CI/CD | Completed |
| ✅ #013 – Scaling an Automation Framework | Completed |
| ✅ #014 – Logging That Actually Helps Debugging | Completed |
| ✅ #015 – API and UI Automation Working Together | Completed |
| ✅ #016 – Writing Tests That Other Engineers Can Understand | Completed |
| ✅ #017 – How I Organize End-to-End Scenarios | Completed |
| ✅ #018 – Measuring Automation Success Beyond Test Coverage | Completed |
| ✅ #019 – Environment and Configuration Management | Completed |
| 🔄 #020 – Parallel Execution and Execution Strategy | Current |
| ⏳ #021 – Secrets and Secure Test Configuration | Next |
| ⏳ #022 – Reporting, Evidence, and Execution Observability | Planned |
| ⏳ #023 – Production-Readiness and Framework Governance | Planned |
| ⏳ #024 – Framework Finalization and v1.0 Readiness | Planned |

## Episode documentation

- [#001](docs/automation-diary/001-planning-before-coding.md)
- [#002](docs/automation-diary/002-smoke-tests.md)
- [#003](docs/automation-diary/003-reusable-keywords.md)
- [#004 — The Importance of a Clean Project Structure](docs/automation-diary/004-clean-project-structure.md)
- [#005 — Choosing the Right Locator Strategy](docs/automation-diary/005-locator-strategy.md)
- [#006](docs/automation-diary/006-documentation-is-part-of-automation.md)
- [#007](docs/automation-diary/007-lessons-learned.md)
- [#008](docs/automation-diary/008-designing-automation-for-maintainability.md)
- [#009](docs/automation-diary/009-page-objects-vs-business-keywords.md)
- [#010 — Managing Test Data Efficiently](docs/automation-diary/010-managing-test-data-efficiently.md)
- [#011 — Avoiding Flaky Tests](docs/automation-diary/011-avoiding-flaky-tests.md)
- [#012 — Integrating Robot Framework with CI/CD](docs/automation-diary/012-integrating-robot-framework-with-ci-cd.md)
- [#013 — Scaling an Automation Framework](docs/automation-diary/013-scaling-an-automation-framework.md)
- [#014 — Logging That Actually Helps Debugging](docs/automation-diary/014-logging-that-actually-helps-debugging.md)
- [#015 — API and UI Automation Working Together](docs/automation-diary/015-api-and-ui-automation-working-together.md)
- [#016 — Writing Tests That Other Engineers Can Understand](docs/automation-diary/016-writing-tests-that-other-engineers-can-understand.md)
- [#017 — How I Organize End-to-End Scenarios](docs/automation-diary/017-how-i-organize-end-to-end-scenarios.md)
- [#018 — Measuring Automation Success Beyond Test Coverage](docs/automation-diary/018-measuring-automation-success-beyond-test-coverage.md)
- [#019 — Environment and Configuration Management](docs/automation-diary/019-environment-and-configuration-management.md)
- [#020 — Parallel Execution and Execution Strategy](docs/automation-diary/020-parallel-execution-and-execution-strategy.md)

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
| v0.11.0 | #011 | Anti-flakiness and synchronization strategy |
| v0.12.0 | #012 | CI/CD integration |
| v0.13.0 | #013 | Framework scaling strategy |
| v0.14.0 | #014 | Structured diagnostic logging |
| v0.15.0 | #015 | API + UI integration architecture |
| v0.16.0 | #016 | Readable tests and shared writing conventions |
| v0.17.0 | #017 | End-to-End scenario orchestration contract |
| v0.18.0 | #018 | Automation effectiveness metrics beyond raw test coverage |
| v0.19.0 | #019 | Environment and configuration management |
| v0.20.0 | #020 | Parallel execution and execution strategy |

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

> Reliable automation comes from explicit architecture: reusable behavior, isolated test data, deterministic synchronization, observable execution, external configuration, secure runtime values, and independent scenarios.

## Author

**André Leite**  
Senior QA Automation Engineer


## Continuous Integration (v0.12.0)

The framework now includes `.github/workflows/robot-framework-ci.yml`.
It automatically runs framework capability tests and smoke tests in GitHub Actions, initializes Browser/Playwright, and publishes Robot Framework reports as artifacts. The workflow remains application-agnostic and is ready for future real-system onboarding.


## Scaling Strategy (v0.13.0)

The framework now defines explicit application boundaries, test-scope classification, tags, test independence, and a reusable onboarding contract. See `docs/architecture/scaling-strategy.md`.


## Structured Logging (v0.14.0)

The framework now provides a shared diagnostic logging capability.

Instead of adding arbitrary `Log` statements to test scenarios, reusable technical keywords provide structured INFO, DEBUG, WARN, and ERROR messages, test lifecycle logs, and diagnostic context.

Example:

`[AUTOMATION] | test=Example | Test started`

Sensitive values must never be logged.

See `docs/architecture/logging-strategy.md`.


## API + UI Integration (v0.15.0)

The framework now includes an application-agnostic contract for combining API and UI automation.

APIs can prepare state and validate backend results, while Page Objects remain responsible for genuine browser behavior. Business Keywords coordinate both layers without exposing HTTP or locator details to test scenarios.

See `docs/architecture/api-ui-strategy.md`.


## Readable Tests and Conventions (v0.16.0)

The framework now defines a shared readability contract for Robot Framework scenarios. Tests should communicate behavior and expected outcomes without exposing selectors, HTTP mechanics, fixed waits, or other low-level implementation details.

A generic `Given / When / Then` template demonstrates how business intent remains in the scenario while reusable Business Keywords keep implementation below the test layer.

See `docs/architecture/readability-and-test-conventions.md` and `docs/guides/test-writing-conventions.md`.


## End-to-End Scenario Orchestration (v0.17.0)

The framework now defines a reusable contract for organizing critical integrated journeys through explicit **Prepare → Act → Transition → Verify → Cleanup** phases.

E2E scenarios orchestrate Business Keywords and reusable framework capabilities instead of duplicating Page Objects, raw API calls, selectors, waits, or technical retry logic. Cross-application transitions remain visible at the scenario level while each application retains ownership of its implementation.

See `docs/architecture/end-to-end-scenario-strategy.md`.


## Automation Metrics (v0.18.0)

The framework now includes a generic metrics capability for measuring automation effectiveness beyond raw test coverage.

Supported indicators include pass rate, failure rate, flaky-test rate, automation stability, defect-detection contribution, and estimated execution savings.

See `docs/architecture/automation-metrics-strategy.md`.


## Environment & Configuration Management (v0.19.0)

The framework now provides a central configuration layer for resolving environment-dependent values without hard-coding them inside test scenarios.

Supported generic configuration includes environment name, browser, headless execution, API timeout, defaults, and required-value validation.

Real secrets are intentionally excluded from repository configuration and will later be injected through secure runtime or CI mechanisms.

See `docs/architecture/environment-and-configuration-management.md`.


## Parallel Execution (v0.20.0)

The framework now includes a configurable parallel execution capability powered by Pabot.

Parallelism is intentionally separated from test design. Tests must remain independent, own their setup and cleanup, and avoid shared mutable state before they are considered safe for concurrent execution.

Cross-platform runners:

- `scripts/run_parallel.bat`
- `scripts/run_parallel.ps1`
- `scripts/run_parallel.sh`

Key runtime configuration:

- `PARALLEL_PROCESSES`
- `EXECUTION_SCOPE`
- `PARALLEL_OUTPUT_DIR`

See `docs/architecture/parallel-execution-strategy.md`.
