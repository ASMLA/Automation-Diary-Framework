# Automation Diary Framework

**Project Status:** Saga 1 completed — 24 of 24 milestones  
**Current Version:** `v0.24.0`  
**Framework Status:** Generic framework baseline completed  
**Next Phase:** Saga 2 — Real Application Onboarding

## About This Project

This repository documents the incremental construction of a production-oriented test automation framework built with Robot Framework and Browser Library (Playwright). Saga 1 intentionally built the reusable engineering foundation before introducing complete application-specific flows.

The framework now provides a stable baseline for onboarding real applications while preserving clear architectural boundaries, reusable capabilities, secure configuration, observable execution, CI/CD validation, and governance.

HOT, BP WEB, and BHUB smoke tests remain executable examples of the foundation. Authentication, complete business flows, real application locators, and application-specific integrations belong to Saga 2.

## Saga 1 — Completed

All 24 milestones are complete:

| # | Milestone | Version | Status |
|---|---|---|---|
| 001 | Planning Before Coding | v0.1.0 | ✅ Completed |
| 002 | Smoke Tests | v0.2.0 | ✅ Completed |
| 003 | Reusable Keywords | v0.3.0 | ✅ Completed |
| 004 | Clean Project Structure | v0.4.0 | ✅ Completed |
| 005 | Locator Strategy | v0.5.0 | ✅ Completed |
| 006 | Documentation Is Part of Automation | v0.6.0 | ✅ Completed |
| 007 | Lessons Learned After the First Sprint | v0.7.0 | ✅ Completed |
| 008 | Designing Automation for Maintainability | v0.8.0 | ✅ Completed |
| 009 | Page Objects vs Business Keywords | v0.9.0 | ✅ Completed |
| 010 | Managing Test Data Efficiently | v0.10.0 | ✅ Completed |
| 011 | Avoiding Flaky Tests | v0.11.0 | ✅ Completed |
| 012 | Integrating Robot Framework with CI/CD | v0.12.0 | ✅ Completed |
| 013 | Scaling an Automation Framework | v0.13.0 | ✅ Completed |
| 014 | Logging That Actually Helps Debugging | v0.14.0 | ✅ Completed |
| 015 | API and UI Automation Working Together | v0.15.0 | ✅ Completed |
| 016 | Writing Tests That Other Engineers Can Understand | v0.16.0 | ✅ Completed |
| 017 | How I Organize End-to-End Scenarios | v0.17.0 | ✅ Completed |
| 018 | Measuring Automation Success Beyond Test Coverage | v0.18.0 | ✅ Completed |
| 019 | Environment and Configuration Management | v0.19.0 | ✅ Completed |
| 020 | Parallel Execution and Execution Strategy | v0.20.0 | ✅ Completed |
| 021 | Secrets and Secure Test Configuration | v0.21.0 | ✅ Completed |
| 022 | Reporting, Evidence, and Execution Observability | v0.22.0 | ✅ Completed |
| 023 | Production-Readiness and Framework Governance | v0.23.0 | ✅ Completed |
| 024 | Framework Finalization and First Saga Retrospective | v0.24.0 | ✅ Completed |

## Final Framework Architecture

```text
Tests
  -> Business Keywords
    -> Page Objects
      -> Technical Capabilities
        -> Browser / API Libraries
          -> Applications
```

### Tests
Own scenarios, tags, expected behavior, and scenario-level assertions. Tests must not contain locators or direct browser implementation details.

### Business Keywords
Own business intent and workflow orchestration. They coordinate Page Objects, API capabilities, test data, and other reusable framework services without exposing low-level mechanics to scenarios.

### Page Objects
Own locators and UI-level operations. UI changes should normally be isolated in this layer.

### Technical Capabilities
Own cross-cutting infrastructure such as browser lifecycle, synchronization, configuration, secrets, logging, metrics, observability, execution strategy, and governance.

## Cross-Cutting Capabilities

| Capability | Version | Documentation |
|---|---:|---|
| Maintainability | v0.8.0 | [Maintainability Guidelines](docs/architecture/maintainability-guidelines.md) |
| Page Objects + Business Keywords | v0.9.0 | [Architecture Contract](docs/architecture/page-objects-vs-business-keywords.md) |
| Test Data Management | v0.10.0 | [Test Data Management](docs/architecture/test-data-management.md) |
| Anti-Flakiness | v0.11.0 | [Anti-Flakiness Strategy](docs/architecture/anti-flakiness-strategy.md) |
| CI/CD | v0.12.0 | [CI/CD Strategy](docs/architecture/ci-cd-strategy.md) |
| Scaling | v0.13.0 | [Scaling Strategy](docs/architecture/scaling-strategy.md) |
| Structured Logging | v0.14.0 | [Logging Strategy](docs/architecture/logging-strategy.md) |
| API + UI | v0.15.0 | [API + UI Strategy](docs/architecture/api-ui-strategy.md) |
| Readability | v0.16.0 | [Readability Conventions](docs/architecture/readability-and-test-conventions.md) |
| E2E Orchestration | v0.17.0 | [E2E Strategy](docs/architecture/end-to-end-scenario-strategy.md) |
| Automation Metrics | v0.18.0 | [Metrics Strategy](docs/architecture/automation-metrics-strategy.md) |
| Environment Configuration | v0.19.0 | [Configuration Management](docs/architecture/environment-and-configuration-management.md) |
| Parallel Execution | v0.20.0 | [Parallel Execution Strategy](docs/architecture/parallel-execution-strategy.md) |
| Secure Configuration | v0.21.0 | [Secrets and Secure Configuration](docs/architecture/secrets-and-secure-configuration.md) |
| Reporting & Observability | v0.22.0 | [Reporting, Evidence and Observability](docs/architecture/reporting-evidence-and-observability.md) |
| Production Readiness & Governance | v0.23.0 | [Production Readiness and Governance](docs/architecture/production-readiness-and-framework-governance.md) |
| Final Baseline | v0.24.0 | [Framework Final Baseline](docs/architecture/framework-final-baseline.md) |

## Current Executable Scope

The current smoke examples can open configured homologation environments, validate expected URLs, detect known technical errors, confirm initial rendering, generate Robot Framework evidence, and perform defensive cleanup.

Framework capability tests validate application-independent contracts without requiring real application business flows. Corporate VPN or authorized network access may still be required for application smoke examples.

## Getting Started

### Approved Dependencies

```text
robotframework==7.4.2
robotframework-browser==20.2.0
PyYAML==6.0.3
robotframework-requests
robotframework-pabot==5.2.2
```

Dependency upgrades are intentional framework changes and must be tested, documented, and versioned.

### Windows

```bat
scripts\setup_windows.bat
scripts\run_framework_tests.bat
scripts\run_smoke.bat all
```

### Linux / macOS

```bash
chmod +x scripts/setup_unix.sh scripts/run_framework_tests.sh scripts/run_smoke.sh
scripts/setup_unix.sh
scripts/run_framework_tests.sh
scripts/run_smoke.sh all
```

For detailed setup, see [Onboarding](docs/getting-started/onboarding.md) and [Execution](docs/getting-started/execution.md).

## Running Tests

### Framework Capability Tests

```bat
scripts\run_framework_tests.bat
```

```powershell
.\scripts\run_framework_tests.ps1
```

```bash
scripts/run_framework_tests.sh
```

### Parallel Framework Execution

```bat
scripts\run_parallel.bat framework
```

See [Parallel Execution Strategy](docs/architecture/parallel-execution-strategy.md).

## CI/CD

`.github/workflows/robot-framework-ci.yml` executes framework capability tests, smoke validation, and parallel framework validation in GitHub Actions. Reports are published as artifacts. CI remains a release-quality gate.

See [CI/CD Strategy](docs/architecture/ci-cd-strategy.md).

## Secure Configuration

Secrets are resolved at runtime and must never be committed to source control. The repository contains examples of secret names and configuration contracts only.

See [Secrets and Secure Configuration](docs/architecture/secrets-and-secure-configuration.md).

## Reporting and Observability

Execution metadata, deterministic evidence naming, report roots, and observability helpers support traceable debugging without leaking sensitive values.

See [Reporting, Evidence and Execution Observability](docs/architecture/reporting-evidence-and-observability.md).

## Production Readiness and Governance

The framework defines readiness criteria around pass rate, flakiness, documentation synchronization, CI health, and secret protection. Application onboarding must preserve the established architecture rather than bypass it.

See [Production Readiness and Framework Governance](docs/architecture/production-readiness-and-framework-governance.md).

## Repository Structure

```text
.github/                 CI workflows
data/                    Declarative test data and environment examples
docs/
  architecture/          Architecture decisions and capability strategies
  automation-diary/      Episode-by-episode evolution
  getting-started/       Setup and execution guidance
  guides/                Contribution and test-writing guidance
  project/               Retrospectives and project-level records
resources/
  api/                    API capabilities
  data/                   Test-data builders, generators, validators and cleanup
  keywords/
    business/             Business intent and orchestration
    technical/            Cross-cutting technical capabilities
  pages/                  Page Objects and templates
  variables/              Shared configuration and policy values
scripts/                  Cross-platform setup and execution helpers
tests/
  framework/              Application-independent capability tests
  templates/              Reusable scenario templates
  hot/ bpweb/ bhub/       Current executable application examples
```

## Documentation Map

- [Framework Final Baseline](docs/architecture/framework-final-baseline.md)
- [Saga 1 Final Retrospective](docs/project/saga-1-final-retrospective.md)
- [Automation Diary #024](docs/automation-diary/024-framework-finalization-and-first-saga-retrospective.md)
- [Roadmap](docs/roadmap.md)
- [Changelog](CHANGELOG.md)
- [Onboarding](docs/getting-started/onboarding.md)
- [Execution](docs/getting-started/execution.md)
- [Adding Tests](docs/guides/adding-tests.md)
- [Test Writing Conventions](docs/guides/test-writing-conventions.md)
- [Troubleshooting](docs/troubleshooting/common-errors.md)

## Next Phase — Saga 2

Saga 2 applies this completed generic framework to real systems. The next work will map application boundaries and introduce real authentication, locators, Page Objects, Business Keywords, test-data adapters, API integrations, smoke/regression suites, and integrated E2E journeys.

The intent is to **use** the Saga 1 architecture, not redesign it during onboarding.

## Author

**André Leite**  
Senior QA Automation Engineer
