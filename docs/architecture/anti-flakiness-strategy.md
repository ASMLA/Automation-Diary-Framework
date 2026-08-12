# Anti-Flakiness Strategy

## Purpose

Version 0.11.0 establishes a framework-wide synchronization and retry policy. The goal is not to hide failures by retrying everything. The goal is to remove timing assumptions and make failures deterministic and diagnosable.

## Principles

1. Prefer Browser Library / Playwright auto-waiting.
2. Use state-based waits instead of fixed sleeps.
3. Keep timeout values in one central policy resource.
4. Retry only idempotent, read-only verification when eventual consistency is expected.
5. Never blindly retry create, update, approve, submit, payment, delete, or other state-changing actions.
6. Preserve the original failure and collect evidence defensively.
7. Treat repeated retries as a signal to investigate the system or test design, not as a permanent fix.

## Central policy

`resources/variables/resilience.resource` owns default, short, long, and read-retry timing values.

`resources/keywords/technical/synchronization.resource` owns reusable synchronization behavior.

## Synchronization flow

```text
Test
  -> Business Keyword
    -> Page Object
      -> Synchronization Keyword
        -> Browser Library / Playwright auto-wait
```

## Retry policy

Allowed examples:

- checking whether an asynchronously generated status becomes visible;
- reading a value that is eventually consistent;
- verifying a non-mutating health condition.

Forbidden blind-retry examples:

- creating a record;
- submitting a form;
- approving a request;
- charging or paying;
- deleting a record.

Repeating state-changing actions can create duplicate data and false positives.

## Anti-patterns

- `Sleep 5s` because a page is sometimes slow;
- increasing every timeout globally after one failure;
- retrying an entire test until it passes;
- catching errors without preserving the original cause;
- using retries to compensate for unstable locators.

## Application onboarding

Real applications may define specific synchronization rules later, but they must consume this central policy instead of introducing arbitrary sleeps and retries throughout the test suite.
