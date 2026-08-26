# Reporting, Evidence, and Execution Observability

## Purpose

Version v0.22.0 establishes a framework-level strategy for reporting, evidence, and execution observability.

A test result should answer more than whether a scenario passed or failed. Engineers also need enough context to identify what executed, where evidence was produced, and how to start diagnosis.

## Core principles

- Every execution should be traceable through a unique execution identifier.
- Evidence file names and directories should be deterministic.
- Reports and diagnostic evidence have different responsibilities.
- Observability must never expose secrets.
- CI artifacts should remain useful after the job ends.

## Generic flow

Test Execution
→ Execution ID
→ Structured Logs
→ Robot Framework Report
→ Evidence Directory
→ CI Artifact

## Current generic capability

The framework now supports evidence-root resolution, report-root resolution, execution evidence directories, deterministic evidence names, execution metadata, and structured observability logging.

## Application-agnostic design

No HOT, BP WEB, or BHUB-specific screenshots, payloads, traces, or private diagnostics are introduced in Saga 1.
