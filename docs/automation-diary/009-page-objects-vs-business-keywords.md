# Automation Diary #009 — Page Objects vs Business Keywords

## Page Objects vs Business Keywords

### Version

`v0.9.0`

## Context

The framework already had reusable keywords, page resources, locator strategy, and centralized lifecycle behavior. However, the responsibility boundary between UI implementation and business intent still needed to be explicit and enforceable.

## Engineering decision

Version `v0.9.0` formalizes the architecture as:

```text
Tests -> Business Keywords -> Page Objects -> Browser Library -> Playwright
```

Business Keywords communicate intent. Page Objects communicate how the UI is operated.

## Implementation

This milestone adds explicit directories for:

- `resources/keywords/business/`
- `resources/keywords/technical/`
- `resources/pages/common/`
- `resources/pages/applications/`
- `resources/pages/templates/`

Existing application smoke behavior is preserved, but new tests now import the business layer directly.

Low-level application UI interactions that previously existed inside application keywords were delegated to Page Object resources.

Generic templates were added so future applications can be onboarded without inventing real locators today.

## Compatibility

Previous resource paths remain available as compatibility resources. This protects earlier framework consumers while directing all new development to the v0.9 layered architecture.

## Why no new real application elements were added

The purpose of the first Automation Diary saga is to complete the generic framework. Real application URLs, authenticated screens, fields, buttons, rules, and stable locators will be mapped in the next saga after the framework reaches v1.0.

## Benefits

- clearer responsibility boundaries;
- easier UI maintenance;
- business-readable tests;
- lower coupling between tests and selectors;
- a repeatable onboarding contract for future systems;
- a migration path that does not break existing Smoke Tests.

## Next milestone

Automation Diary #010 — Managing Test Data Efficiently.
