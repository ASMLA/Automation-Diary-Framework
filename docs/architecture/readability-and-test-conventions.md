# Readability and Test Conventions

## Purpose

Automation code is production code. A test should communicate intent to another engineer before that engineer needs to inspect Page Objects, locators, or implementation details.

Version v0.16.0 defines a shared readability contract for tests added to this framework.

## Test-case naming

Test names describe observable behavior or an expected outcome.

Prefer:

- User Can Complete Valid Checkout
- Application Rejects Invalid Credentials
- Created Record Is Visible In Search Results

Avoid names that expose implementation details such as button clicks, locator types, internal helper names, or step numbers.

## Scenario structure

Tests should read from business intent to expected outcome. When a scenario benefits from explicit phases, use Robot Framework's BDD prefixes:

- `Given` for required state or preconditions;
- `When` for the business action under test;
- `Then` for the observable result;
- `And` for additional steps within the same phase.

The prefixes improve readability without creating a second implementation layer: Robot Framework resolves them to the underlying reusable keyword.

## Responsibility boundaries

### Tests

Describe the scenario and expected behavior.

### Business Keywords

Express domain intent and orchestrate reusable operations.

### Page Objects

Own UI interaction details and locators.

### Technical Keywords

Own browser, synchronization, logging, API, and other technical capabilities.

Tests must not bypass these boundaries by embedding selectors, HTTP implementation details, fixed sleeps, or low-level browser commands in business scenarios.

## Keyword naming

Keyword names should describe intent in plain language. Prefer verbs and outcomes over implementation mechanics.

Prefer:

- Create Customer Through API
- Submit Valid Application
- Verify Application Is Approved

Avoid:

- Click Blue Button
- Call Post Endpoint
- Wait 5 Seconds And Check Text

## Assertions

Assertions belong close to the behavior they validate. A test should make its expected outcome visible without duplicating low-level validation logic.

## Comments and documentation

Use `[Documentation]` to explain purpose, constraints, or non-obvious decisions. Do not use comments to narrate obvious code line by line.

## Data readability

Use meaningful variable names and named data fields. Avoid unexplained positional values and magic strings in scenarios.

## Independence

A readable test is also independently understandable. It must not rely on another test having run first. Preconditions should be established explicitly through setup, builders, APIs, or reusable business capabilities.

## Review checklist

Before merging a new test, verify that:

1. the test name states behavior or outcome;
2. the scenario can be understood without opening locator files;
3. business intent is expressed through reusable keywords;
4. selectors and low-level browser operations are absent from the test;
5. fixed sleeps are absent;
6. test data names explain their purpose;
7. the expected result is visible;
8. the scenario does not depend on execution order;
9. documentation explains only what is not obvious;
10. the test follows the same conventions as the rest of the framework.

## Application-agnostic rule

These conventions are generic. Real HOT, BP WEB, and BHUB scenarios will adopt them only after the generic framework saga is complete.
