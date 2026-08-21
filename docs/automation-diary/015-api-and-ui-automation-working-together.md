# Automation Diary #015 — API and UI Automation Working Together

**Version:** v0.15.0

## Goal

Introduce the architectural contract for using API and UI automation together without mixing responsibilities.

## Added

- Generic API client layer
- Shared API configuration
- API + UI business-flow template
- API + UI scenario template
- Framework-level architecture test
- API/UI architecture documentation

## Engineering decision

The browser should validate behavior that genuinely belongs to the UI.

APIs can efficiently prepare data, establish state, validate backend results, and later perform cleanup.

The framework keeps those responsibilities separated while allowing them to work together in the same business scenario.

## Application strategy

No real endpoints or system-specific API behavior are introduced during Saga 1.

## Next

Automation Diary #016 — Writing Tests That Other Engineers Can Understand
