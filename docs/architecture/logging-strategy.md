# Logging That Actually Helps Debugging

## Purpose

Version v0.14.0 introduces a shared logging strategy focused on diagnosis rather than log volume.

The objective is to make failures easier to investigate locally and in CI without spreading inconsistent `Log` statements throughout tests.

## Principles

### Structured messages

Framework logs use a predictable prefix and optional context:

`[AUTOMATION] | test=Example | Test started`

This makes execution output easier to scan and later easier to integrate with centralized observability tools.

### Log by responsibility

Tests should describe scenarios. Technical logging belongs in reusable framework resources.

Business Keywords may provide meaningful business context, while technical resources produce execution diagnostics.

### Prefer useful context

Useful diagnostic information can include:

- test name;
- execution status;
- generated automation identifier;
- application or capability;
- environment;
- operation being performed.

Sensitive values such as passwords, tokens, session cookies, and secrets must never be logged.

### Levels have meaning

- INFO: important execution milestones
- DEBUG: technical diagnostic detail
- WARN: recoverable or suspicious behavior
- ERROR: conditions relevant to failure investigation

### Evidence and logs complement each other

Logs explain what the framework was doing.
Screenshots and reports show what the application or execution environment looked like.

Neither should replace the other.

## CI strategy

Robot Framework logs and reports continue to be published as CI artifacts. Structured framework messages make those artifacts more useful when a failure occurs outside a developer workstation.

## Application-agnostic design

No real HOT, BP WEB, or BHUB business events are introduced. Future applications can add business context while consuming the same logging capability.
