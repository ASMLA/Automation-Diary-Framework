# Automation Diary #016 — Writing Tests That Other Engineers Can Understand

**Version:** v0.16.0

## Goal

Define a shared readability contract so automated tests communicate business behavior clearly to engineers who did not write them.

## Added

- Readability and test-convention architecture guide
- Practical test-writing conventions guide
- Readable Robot Framework scenario template
- Generic readable Business Keyword template
- Framework-level convention checks
- Automation Diary #016 documentation

## Engineering decision

A test should explain what behavior is being validated without requiring the reader to inspect selectors, HTTP mechanics, waits, or implementation helpers.

Tests describe scenarios. Business Keywords describe intent. Page Objects and technical resources keep implementation details below that readable layer.

## Conventions

The framework now explicitly favors:

- behavior-oriented test names;
- meaningful keyword and variable names;
- `Given / When / Then / And` when they improve scenario flow;
- visible expected outcomes;
- short scenarios with one clear responsibility;
- documentation for purpose and non-obvious decisions rather than line-by-line narration.

Tests should not contain locators, fixed sleeps, low-level browser mechanics, direct HTTP mechanics, secrets, unexplained magic values, or dependencies on previous tests.

## Application strategy

The readability contract remains application-agnostic. Real application scenarios will adopt it after Saga 1 is complete.

## Next

Automation Diary #017 — How I Organize End-to-End Scenarios
