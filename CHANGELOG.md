# Changelog

All notable changes to this project will be documented in this file.

## [0.3.0] - 2026-07-30

### Added

- Reusable `Access Application And Validate Health` keyword for shared environment health checks.
- Reusable `Validate Application Initial Page` keyword for initial-page visibility validation.
- Business-level availability keywords for HOT, BP WEB, and BHUB.
- Automation Diary #003 documentation about DRY refactoring and reusable keywords.

### Changed

- HOT, BP WEB, and BHUB access keywords now reuse the same technical health-check behavior.
- Smoke tests now express business intent through one application-level availability keyword.
- README now reflects the reusable-keyword milestone and version `v0.3.0`.

## [0.2.0] - 2026-07-29

### Added

- Independent smoke suites for HOT, BP WEB, and BHUB.
- `critical` classification for the first health-check scenarios.
- PowerShell smoke runner with targeted execution by application.
- Application-specific result directories for targeted executions.

### Changed

- Batch smoke runner now accepts `all`, `hot`, `bpweb`, or `bhub`.
- Test names, keywords, documentation, comments, and scripts are now fully written in English.
- README now documents the smoke-test strategy and Automation Diary progression.

## [0.1.0] - 2026-07-28

### Added

- Initial Robot Framework and Browser Library project structure.
- Initial project planning and architecture.
- Initial templates for HOT demand and HOT–BP WEB integration flows.
