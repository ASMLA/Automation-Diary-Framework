# End-to-End Scenario Strategy

## Purpose

End-to-End (E2E) automation validates a business journey across the boundaries that matter to the user. It is not a request to automate every possible step through the browser.

The framework treats E2E scenarios as orchestration contracts built on top of reusable Business Keywords, Page Objects, API capabilities, data builders, synchronization, and cleanup.

## Core principles

1. **Validate a business journey, not a collection of clicks.**
2. **Keep orchestration in the E2E layer.** Lower layers own implementation details.
3. **Prepare state through the fastest reliable capability.** Prefer builders or APIs when UI setup is not part of the behavior being validated.
4. **Use the UI only where user-visible behavior matters.**
5. **Validate important transitions explicitly.** Do not rely on the next step to prove the previous one worked.
6. **Keep scenarios independent.** An E2E test must not depend on another test running first.
7. **Own cleanup.** Test-created state should be traceable and removable whenever the target system permits it.
8. **Keep E2E suites intentionally small.** Broad permutations belong in lower-cost functional/API layers.

## Scenario contract

A maintainable E2E scenario follows five phases:

```text
Prepare
  -> Act
    -> Transition
      -> Verify
        -> Cleanup
```

### Prepare

Create or resolve the minimum state required by the journey. Use test-data builders, APIs, or application-specific setup capabilities when available.

### Act

Perform the user or system action that begins the business journey.

### Transition

Cross a meaningful application, service, or state boundary. This phase makes integrated behavior explicit instead of hiding it inside a long keyword.

### Verify

Assert the business outcome at the most appropriate layer. UI behavior can be validated in the UI; backend state can be validated through an API or other integration capability.

### Cleanup

Remove or neutralize test-created state without masking the original test result.

## Architecture

```text
E2E Scenario
  -> E2E Orchestration Keywords
    -> Business Keywords
      -> Page Objects / API Capabilities / Data Capabilities
        -> Technical Keywords
          -> Browser / HTTP / Infrastructure
```

The E2E scenario must not contain selectors, raw HTTP calls, fixed waits, credentials, or low-level retry logic.

## Cross-application journeys

When a journey crosses applications, each application keeps ownership of its own Page Objects and Business Keywords. The E2E orchestration layer coordinates them.

For example:

```text
Prepare record
  -> Submit in Application A
    -> Process in Application B
      -> Validate resulting state
        -> Cleanup
```

The orchestration keyword may know that Application A and Application B participate in the journey. It should not absorb their locators or technical implementation.

## What belongs in E2E

Good E2E candidates include critical journeys whose value comes from proving that multiple capabilities work together, such as creation-to-processing, submission-to-approval, or UI-to-backend state transitions.

E2E is not the preferred layer for exhaustive field combinations, validation matrices, isolated component behavior, or API contract permutations. Those are cheaper and easier to diagnose in lower layers.

## Failure diagnostics

A failed E2E scenario should reveal the phase and business transition that failed. Structured logging and readable keyword names should make the failure understandable before an engineer inspects implementation details.

## Application onboarding

This milestone defines the generic contract only. Real HOT, BP WEB, and BHUB journeys will be implemented after the framework saga reaches its completed platform milestone. At that point, the generic orchestration contract can be populated with validated application-specific keywords and data.
