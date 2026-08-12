# Automation Diary #011 — Avoiding Flaky Tests

**Version:** v0.11.0

## Context

A flaky test produces inconsistent results without a meaningful application change. In UI automation, common causes include timing assumptions, unstable locators, shared data, environment latency, and retries that hide real defects.

## What changed

Version 0.11.0 adds an explicit anti-flakiness capability to the generic framework:

- centralized synchronization timeouts;
- reusable state-based wait keywords;
- a read-only retry contract;
- removal of the remaining hard-coded page-load and locator wait values from the common Page layer;
- framework-level policy tests;
- architecture documentation describing allowed and forbidden retry patterns.

## Engineering decision

Retries are not the default solution for instability. Browser Library and Playwright synchronization should be preferred first. A retry is allowed only for an idempotent/read-only check where eventual consistency is an expected system behavior.

State-changing operations must fail visibly instead of being blindly repeated.

## Why this matters

The framework now gives future application teams one predictable place to configure timing behavior. Tests and Business Keywords remain free from arbitrary sleeps, and Page Objects can synchronize against observable UI states rather than elapsed time.

## Application-agnostic scope

No real HOT, BP WEB, or BHUB synchronization rules are introduced. Those rules will be added only when real applications are onboarded after the generic framework is complete.

## Next

Automation Diary #012 — Integrating Robot Framework with CI/CD.
