# Page Objects vs Business Keywords

## Purpose

Version `v0.9.0` formalizes the framework boundary between business intent and browser implementation. The framework must be ready to receive real applications later without forcing tests to know selectors, Browser Library commands, or page implementation details.

## Layer model

```text
Tests
  -> Business Keywords
    -> Page Objects
      -> Technical Utilities / Browser Library
        -> Playwright
          -> Browser
```

## Tests

Tests describe expected behavior and assertions. They may call business keywords, but they must not contain CSS, XPath, direct `Click`, `Fill Text`, or browser synchronization logic.

## Business Keywords

Business keywords describe intent and workflow. They orchestrate Page Object operations and application-level rules. They must not contain selectors or direct Browser Library commands.

Examples of future real business intent include `Create Demand`, `Approve Request`, or `Search Customer`. Those names will only be introduced after the generic framework is complete and the real application is mapped.

## Page Objects

Page Objects own UI contracts. They contain locators and UI-level actions such as filling a field, clicking an element, reading text, or waiting for a stable page root.

A UI change should normally be resolved inside the Page Object layer without modifying the business flow or test scenario.

## Technical utilities

Technical utilities own cross-cutting browser behavior that is not part of a specific page or business flow. Examples include browser-session lifecycle, defensive evidence collection, and centrally maintained technical-error validation.

## Compatibility strategy

The repository already contained paths such as `resources/keywords/applications` and `resources/pages/<application>_page.resource`. Version `v0.9.0` keeps those files as compatibility resources while new code uses the explicit layered paths.

This avoids breaking earlier versions while establishing the architecture that future implementations must follow.

## Generic templates

The framework now includes generic templates under:

```text
resources/pages/templates/
resources/keywords/business/templates/
```

They document the contract without inventing real application elements. Real URLs, fields, buttons, texts, and locators will be added only after the generic framework reaches its v1.0 milestone.

## Rules

### Tests may

- describe scenarios;
- call business keywords;
- contain scenario-level assertions and tags.

### Tests must not

- declare locators;
- call Browser Library directly;
- implement reusable business workflows.

### Business Keywords may

- express business intent;
- orchestrate Page Objects;
- compose reusable flows.

### Business Keywords must not

- contain CSS or XPath;
- call `Click`, `Fill Text`, or other Browser Library commands directly.

### Page Objects may

- own locators;
- call Browser Library;
- expose UI operations;
- own page-level waits and element reads.

### Page Objects must not

- decide business rules;
- combine unrelated business processes.

## Change-impact examples

| Change | Primary location |
|---|---|
| Button locator changes | Page Object |
| Field interaction changes | Page Object |
| Business sequence changes | Business Keyword |
| Test expectation changes | Test |
| Browser lifecycle changes | Technical utility |
| Environment URL changes | Environment variables |

## Engineering outcome

The framework now has an explicit contract for where future automation belongs. This is a prerequisite for onboarding real applications without turning the repository into a mix of selectors, workflow rules, and tests in the same files.
