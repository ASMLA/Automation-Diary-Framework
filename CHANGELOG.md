# Changelog

All notable changes to this project will be documented in this file.

## [0.8.0] - 2026-08-03

### Added

- Shared `resources/suites/smoke_suite.resource` lifecycle contract.
- Central `resources/variables/validation.resource` technical-error catalog.
- URL-fragment variables for HOT, BP WEB, and BHUB.
- Defensive evidence and browser cleanup behavior.
- Linux and macOS setup and Smoke Test runner scripts.
- Maintainability guidelines and change-impact map.
- Automation Diary #008 documentation.

### Changed

- Smoke and template suites now depend on shared lifecycle keywords instead of low-level browser setup directly.
- Application access keywords now consume centralized URL-fragment variables.
- Technical error validation now iterates over one centrally maintained catalog.
- Python dependencies are pinned to project-approved versions.
- Windows setup validates Python and Node.js before installation and initializes Chromium explicitly.
- README and architecture documentation updated for v0.8.0.

### Preserved

- Existing Smoke Test business behavior.
- Application-level business keywords.
- Locator strategy and page-resource ownership.
- Sprint 1 documentation and version history.

## [0.7.0] - 2026-07-31

### Added

- Automation Diary #007 documentation with the first sprint lessons learned.
- Project retrospective covering engineering decisions, outcomes, challenges, and improvement opportunities.
- Roadmap for the next development phase.
- Current project status and Sprint 1 summary in the README.

### Changed

- README updated to version `v0.7.0`.
- Automation Diary #006 marked as completed and #007 marked as current.
- Version history expanded through `v0.7.0`.
- Documentation navigation expanded with links to the retrospective and roadmap.

### Preserved

- Existing Smoke Test behavior.
- Locator strategy introduced in v0.5.0.
- Reusable keyword layers and clean project structure.
- Architecture, onboarding, execution, contribution, and troubleshooting documentation introduced in v0.6.0.

## [0.6.0] - 2026-07-30

### Added

- Framework architecture and execution-flow documentation.
- Cross-platform onboarding instructions for Windows, Linux, and macOS.
- Execution guide for full and application-specific Smoke Tests.
- Contribution guide explaining how to add tests without mixing responsibilities.
- Troubleshooting guide for Node.js, Browser Library, VPN, environment, and locator failures.
- Automation Diary #006 documentation.

### Changed

- README converted into a concise project entry point with links to detailed technical guides.
- Documentation structure expanded into architecture, getting-started, guides, and troubleshooting areas.

### Preserved

- Existing Smoke Test behavior.
- Locator strategy introduced in v0.5.0.
- Clean architecture and reusable keyword layers from previous milestones.

## [0.5.0] - 2026-07-30

### Added

- Documented locator priority for stable automation attributes, accessible roles, native attributes, exact text, CSS, and last-resort XPath.
- Reusable `Get First Visible Locator` keyword for ordered primary-to-fallback resolution.
- Automation Diary #005 documentation about locator strategy and flaky-test prevention.

### Changed

- Declared selector engines explicitly in all page resources.
- Renamed generic body locators to application page-root locators.
- Replaced the combined HOT title CSS selector with separate primary and fallback locators.
- Updated README with the locator-strategy milestone.

### Preserved

- Existing Smoke Test behavior and clean project structure.
- Business keyword layer introduced in v0.3.0.

## [0.4.0] - 2026-07-30

### Changed

- Reorganized shared technical keywords under `resources/keywords/common`.
- Reorganized application-specific keywords under `resources/keywords/applications`.
- Renamed `common.resource` to `browser_keywords.resource` to communicate its responsibility.
- Updated all resource imports across HOT, BP WEB, BHUB, and E2E suites.
- Updated README with the clean project structure milestone.

### Added

- Automation Diary #004 documentation.
- Explicit responsibility map for pages, keywords, variables, data, tests, scripts, and documentation.

### Preserved

- Existing Smoke Test and template behavior.
- Reusable business keywords introduced in v0.3.0.

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
