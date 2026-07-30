# Automation Diary #004 — The Importance of a Clean Project Structure

## Objective

This milestone reorganizes the framework so that each file and directory has one clear responsibility. The goal is not to add more test behavior, but to make the existing behavior easier to locate, understand, maintain, and scale.

## Problem Identified

In v0.3.0, reusable keywords and application-specific keywords were stored at the same directory level:

```text
resources/keywords/
├── common.resource
├── hot_keywords.resource
├── bpweb_keywords.resource
└── bhub_keywords.resource
```

This works for a small framework, but it becomes harder to navigate as more shared utilities and business flows are introduced.

## Structural Decision

The keyword layer is now divided by responsibility:

```text
resources/keywords/
├── common/
│   └── browser_keywords.resource
└── applications/
    ├── hot_keywords.resource
    ├── bpweb_keywords.resource
    └── bhub_keywords.resource
```

### Responsibility of each area

- `resources/keywords/common`: reusable technical behavior shared by multiple applications.
- `resources/keywords/applications`: business and application-specific behavior.
- `resources/pages`: locators and page-level elements only.
- `resources/variables`: environment and execution configuration.
- `data`: external test data.
- `tests`: executable scenarios organized by application or integration flow.
- `scripts`: setup and execution commands.
- `docs`: engineering decisions and Automation Diary history.

## Why This Matters

A clean structure reduces the time needed to answer common maintenance questions:

- Where should a shared browser keyword be added?
- Where should a HOT-specific action be implemented?
- Where are the BP WEB locators?
- Where should environment URLs be changed?
- Where should test data be stored?

When those answers are visible in the directory structure, onboarding becomes easier and accidental coupling is reduced.

## Import Updates

All Robot Framework resource imports were updated to use the new paths. Test behavior remains unchanged.

Example:

```robot
Resource    ../../resources/keywords/common/browser_keywords.resource
Resource    ../../resources/keywords/applications/hot_keywords.resource
```

## Engineering Principle

> Project structure should communicate architecture before a developer opens a file.

## Result

Version v0.4.0 delivers:

- Clear separation between shared and application-specific keywords.
- Explicit ownership for pages, variables, data, tests, scripts, and documentation.
- Updated imports across all test suites and resources.
- A scalable foundation for future locator, documentation, and business-flow milestones.
