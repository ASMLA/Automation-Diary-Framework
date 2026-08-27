# Automation Diary Roadmap

## Current strategy

- ⏳ #024 — Framework Finalization and First Saga Retrospective — Next

Real application onboarding begins only after the generic framework reaches its v1.0 milestone.

## Confirmed sequence

| Episode | Topic | Status / focus |
|---|---|---|
| #008 | Designing Automation for Maintainability | ✅ Completed |
| #009 | Page Objects vs Business Keywords | ✅ Completed |
| #010 | Managing Test Data Efficiently | ✅ Completed |
| #011 | Avoiding Flaky Tests | ✅ Completed |
| #012 | Integrating Robot Framework with CI/CD | ✅ Completed |
| #013 | Scaling an Automation Framework | ✅ Completed |
| #014 | Logging That Actually Helps Debugging | ✅ Completed |
| #015 | API and UI Automation Working Together | ✅ Completed |
| #016 | Writing Tests That Other Engineers Can Understand | ✅ Completed |
| #017 | How I Organize End-to-End Scenarios | 🔄 Current — E2E contracts and orchestration |
| #018 | Measuring Automation Success Beyond Test Coverage | Next — reliability, feedback time, maintenance cost, metrics |

- ⏳ #024 — Framework Finalization and First Saga Retrospective — Next

## Saga 1 outcome

- ⏳ #024 — Framework Finalization and First Saga Retrospective — Next

- real environment configuration;
- real Page Objects and locators;
- real Business Keywords;
- real test data;
- real API clients and schemas when applicable;
- real Smoke, Functional, Integration, and E2E scenarios.

The framework architecture itself should not need to be redesigned for that onboarding.

## Saga 2

The second saga will apply the completed framework to real enterprise systems. That is when authenticated screens, real buttons, fields, texts, APIs, business rules, and cross-system workflows will be mapped and automated.


## Current milestone — #017

Automation Diary #017 — How I Organize End-to-End Scenarios — implemented in v0.17.0. The framework now defines a reusable E2E orchestration contract with explicit Prepare, Act, Transition, Verify, and Cleanup phases. Next: #018 — Measuring Automation Success Beyond Test Coverage.

- #020 — Parallel Execution and Execution Strategy — ✅ v0.20.0

- ✅ #021 — Secrets and Secure Test Configuration — v0.21.0
- ✅ #022 — Reporting, Evidence, and Execution Observability — v0.22.0
