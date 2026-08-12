# Automation Diary Roadmap

## Current strategy

The first Automation Diary saga builds the generic automation framework through episode #024. The goal is to reach a complete platform with defined patterns for Web, API, Smoke, Functional, Integration, E2E, data, reporting, CI/CD, parallel execution, containers, documentation, and metrics.

Real application onboarding begins only after the generic framework reaches its v1.0 milestone.

## Confirmed sequence

| Episode | Topic | Status / focus |
|---|---|---|
| #008 | Designing Automation for Maintainability | ✅ Completed |
| #009 | Page Objects vs Business Keywords | ✅ Completed |
| #010 | Managing Test Data Efficiently | 🔄 Current — generic builders, generators, validators, cleanup contracts, and framework tests |
| #011 | Avoiding Flaky Tests | Next — Synchronization, isolation, retries, and failure diagnosis |
| #012 | Integrating Robot Framework with CI/CD | Automated execution and feedback pipelines |
| #013 | Scaling an Automation Framework | Growth without losing consistency |
| #014 | Logging That Actually Helps Debugging | Diagnostics and actionable failures |
| #015 | API and UI Automation Working Together | Generic service/browser integration architecture |
| #016 | Writing Tests That Other Engineers Can Understand | Readability and conventions |
| #017 | How I Organize End-to-End Scenarios | E2E contracts and orchestration |
| #018 | Measuring Automation Success Beyond Test Coverage | Reliability, feedback time, maintenance cost, metrics |

Episodes #019 through #024 will complete the remaining production-readiness capabilities required for the generic framework v1.0, including the final integration of execution, environment/secrets strategy, parallelization/containerization, quality gates, and stable release readiness. Their exact titles will be finalized as the preceding architecture is implemented.

## Saga 1 outcome

At the end of #024, the framework should be ready for a real application to be onboarded by adding:

- real environment configuration;
- real Page Objects and locators;
- real Business Keywords;
- real test data;
- real API clients and schemas when applicable;
- real Smoke, Functional, Integration, and E2E scenarios.

The framework architecture itself should not need to be redesigned for that onboarding.

## Saga 2

The second saga will apply the completed framework to real enterprise systems. That is when authenticated screens, real buttons, fields, texts, APIs, business rules, and cross-system workflows will be mapped and automated.
