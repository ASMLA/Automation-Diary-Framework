# Automation Diary #008 — Designing Automation for Maintainability

## Designing Automation for Maintainability

## Context

Sprint 1 created a clean and documented foundation. The first milestone of the next phase tests whether that foundation can absorb change without spreading implementation details across the repository.

## Maintenance risks identified

- Expected URL fragments were duplicated inside application keyword files.
- Technical error messages were embedded directly in one shared keyword.
- Test suites depended directly on low-level browser lifecycle keywords.
- Teardown could produce an additional error when browser startup failed.
- Dependency installation used unconstrained package versions.
- Windows had setup and execution helpers, while Linux and macOS depended on manual command sequences.

## Changes introduced

- Centralized application URL fragments in the environment resource.
- Added a central technical-error catalog.
- Added a shared Smoke Test lifecycle resource.
- Refactored test suites to use `Prepare Smoke Test` and `Finish Smoke Test`.
- Made screenshot and browser cleanup defensive.
- Pinned project-approved Python dependency versions.
- Added Unix setup and Smoke Test runner scripts.
- Added a maintainability guide and change-impact map.

## Engineering decision

Maintainability is not achieved by creating the greatest number of abstractions. It is achieved by giving each type of change one clear home while keeping tests readable.

The application wrappers remain intentionally small. They preserve business language while shared resources own technical implementation.

## Result

A future environment, technical-error, lifecycle, or dependency change can now be made in one explicit location with a smaller review surface.

## Next milestone

Automation Diary #009 — Page Objects vs Business Keywords
