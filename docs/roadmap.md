# Automation Diary Roadmap

## Current strategy

The first Automation Diary saga builds the generic automation framework through episode #024. The goal is to reach a complete platform with defined patterns for Web, API, Smoke, Functional, Integration, E2E, data, reporting, CI/CD, parallel execution, containers, documentation, metrics, secure configuration, observability, governance, and release readiness.

Real application onboarding begins only after the generic framework reaches its v1.0 milestone.

## Confirmed sequence

| Episode | Topic | Status | Version |
|---|---|---|---|
| #001 | Planning Before Coding | ✅ Completed | v0.1.0 |
| #002 | Why I Always Start with Smoke Tests | ✅ Completed | v0.2.0 |
| #003 | Building Reusable Keywords Instead of Duplicated Code | ✅ Completed | v0.3.0 |
| #004 | The Importance of a Clean Project Structure | ✅ Completed | v0.4.0 |
| #005 | Choosing the Right Locator Strategy | ✅ Completed | v0.5.0 |
| #006 | Why Documentation Is Part of Automation | ✅ Completed | v0.6.0 |
| #007 | Lessons Learned After the First Sprint | ✅ Completed | v0.7.0 |
| #008 | Designing Automation for Maintainability | ✅ Completed | v0.8.0 |
| #009 | Page Objects vs Business Keywords | ✅ Completed | v0.9.0 |
| #010 | Managing Test Data Efficiently | ✅ Completed | v0.10.0 |
| #011 | Avoiding Flaky Tests | ✅ Completed | v0.11.0 |
| #012 | Integrating Robot Framework with CI/CD | ✅ Completed | v0.12.0 |
| #013 | Scaling an Automation Framework | ✅ Completed | v0.13.0 |
| #014 | Logging That Actually Helps Debugging | ✅ Completed | v0.14.0 |
| #015 | API and UI Automation Working Together | ✅ Completed | v0.15.0 |
| #016 | Writing Tests That Other Engineers Can Understand | ✅ Completed | v0.16.0 |
| #017 | How I Organize End-to-End Scenarios | ✅ Completed | v0.17.0 |
| #018 | Measuring Automation Success Beyond Test Coverage | ✅ Completed | v0.18.0 |
| #019 | Environment and Configuration Management | ✅ Completed | v0.19.0 |
| #020 | Parallel Execution and Execution Strategy | ✅ Completed | v0.20.0 |
| #021 | Secrets and Secure Test Configuration | ⏳ Next | Planned |
| #022 | Reporting, Evidence, and Execution Observability | ⏳ Planned | Planned |
| #023 | Production-Readiness and Framework Governance | ⏳ Planned | Planned |
| #024 | Framework Finalization and v1.0 Readiness | ⏳ Planned | v1.0 target |

## Current milestone

Automation Diary #020 — Parallel Execution and Execution Strategy — is completed in `v0.20.0`.

Next: **#021 — Secrets and Secure Test Configuration**.

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
