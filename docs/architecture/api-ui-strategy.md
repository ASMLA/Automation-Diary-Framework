# API and UI Automation Working Together

## Purpose

Version v0.15.0 introduces the framework contract for combining API automation with UI automation.

The goal is not to replace UI testing with API testing. The goal is to use the right layer for the right responsibility.

## Core pattern

A common integrated scenario can follow this structure:

1. Prepare test state through an API.
2. Open the UI only for the behavior that must be validated through the browser.
3. Perform the user interaction.
4. Validate resulting state through the API when that provides faster and more precise feedback.
5. Clean up through an API or future data adapter.

## Why this matters

Using the UI for every preparation and validation step makes tests slower and more fragile.

Using APIs for setup and backend verification can reduce unnecessary browser interaction while preserving genuine UI coverage.

## Architecture

```text
Test
  |
  +--> Business Keyword
         |
         +--> API adapter / API client
         |
         +--> Page Object / UI
         |
         +--> API verification
```

## Boundaries

- API clients handle HTTP mechanics.
- Business Keywords describe why an API or UI action is performed.
- Page Objects remain responsible for UI implementation.
- Test scenarios describe expected behavior.
- Test data remains managed by the Test Data Management capability.

## Security

Authentication tokens, secrets, cookies, and credentials must never be hard-coded or written to logs.

Future real applications should provide protected secrets through environment variables or CI secret storage.

## Application-agnostic design

No real endpoints, credentials, payloads, or business rules are introduced in this milestone.

The framework now provides the reusable structure that real application adapters will consume later.
