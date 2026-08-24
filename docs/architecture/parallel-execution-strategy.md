# Parallel Execution and Execution Strategy

## Purpose

Version v0.20.0 introduces a controlled parallel-execution strategy for the automation platform.

Parallelism is treated as an execution capability, not as a shortcut that allows tests to share state or depend on execution order.

## Core principles

### Tests must remain independent

Parallel execution exposes hidden dependencies quickly.

A test must not rely on:

- another test running first;
- shared mutable variables;
- a record created by a previous scenario;
- a fixed execution order;
- a browser session owned by another test.

Required state should be created through setup, builders, APIs, or future application-specific adapters.

### Parallelism must be configurable

The framework resolves the number of parallel workers through configuration rather than hard-coding it into tests.

Generic variables include:

- `PARALLEL_PROCESSES`
- `EXECUTION_SCOPE`
- `PARALLEL_OUTPUT_DIR`

### Execution scope matters

Not every suite should always run in parallel.

The framework distinguishes execution scope from concurrency.

Examples:

- framework capability tests;
- smoke tests;
- complete test tree;
- future application-specific scopes.

### Resource contention must be designed explicitly

Future real systems may contain shared accounts, records, queues, files, or limited environments.

Those resources must be isolated, generated uniquely, pooled, or explicitly serialized.

Parallel execution must never create false failures by competing for the same test state.

### Parallel is not always faster

More workers can increase contention, infrastructure load, browser consumption, and diagnostic complexity.

The process count should match the CI runner, environment capacity, and test characteristics.

## Execution engine

Robot Framework Pabot is used as the generic parallel runner.

The framework keeps the runner behind cross-platform scripts so engineers do not need to memorize command-line options.

## Cross-platform commands

Windows:

`set PARALLEL_PROCESSES=4 && scripts\run_parallel.bat`

PowerShell:

`$env:PARALLEL_PROCESSES="4"; .\scripts\run_parallel.ps1`

Linux/macOS:

`PARALLEL_PROCESSES=4 scripts/run_parallel.sh`

## CI strategy

Parallel execution can be enabled selectively in CI after a suite has demonstrated independence and safe data isolation.

The framework does not assume that every future test is automatically safe to parallelize.

## Application-agnostic design

No HOT, BP WEB, or BHUB concurrency limits, test accounts, shared resources, or environment constraints are introduced in Saga 1.
