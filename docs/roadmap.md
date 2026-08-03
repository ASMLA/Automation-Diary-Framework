# Automation Diary Roadmap

## Current status

Sprint 1 is complete, and Phase 2 started at version `v0.8.0`.

The first seven milestones established the project foundation. Starting with #008, the series follows the real evolution of the framework.

## Confirmed next topics

| Episode | Topic | Focus |
|---|---|---|
| #008 | Designing Automation for Maintainability | ✅ Current — centralized lifecycle, configuration, validation, and dependency control |
| #009 | Page Objects vs Business Keywords | Responsibility boundaries between locators, technical actions, and business intent |
| #010 | Managing Test Data Efficiently | External data, environment differences, and reusable test inputs |
| #011 | Avoiding Flaky Tests | Synchronization, isolation, locator contracts, and failure diagnosis |
| #012 | Integrating Robot Framework with CI/CD | Automated execution and feedback pipelines |
| #013 | Scaling an Automation Framework | Growth without losing consistency or readability |
| #014 | Logging That Actually Helps Debugging | Evidence, diagnostics, and actionable failures |
| #015 | API and UI Automation Working Together | Combined coverage across service and browser layers |
| #016 | Writing Tests That Other Engineers Can Understand | Readability, conventions, and reviewability |
| #017 | How I Organize End-to-End Scenarios | Cross-system flows and responsibility boundaries |
| #018 | Measuring Automation Success Beyond Test Coverage | Reliability, feedback time, maintenance cost, and defect detection |

## Functional priorities

The exact implementation order after #007 will follow real project needs. Likely priorities include:

- Authentication
- HOT business flows
- BP WEB business flows
- BHUB validations
- End-to-End integration
- Environment and test-data management
- CI/CD
- API automation
- Parallel execution

## Roadmap rule

From #008 onward, topics must be justified by a real project change. The LinkedIn publication explains the engineering decision, while the GitHub repository demonstrates the implementation.
