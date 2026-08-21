# Changelog

## v0.15.0

### Added

- Generic API client layer
- Shared API configuration
- API + UI business-flow template
- API + UI scenario template
- Framework-level API/UI architecture test
- API/UI architecture documentation
- Automation Diary #015 documentation

### Changed

- README and roadmap updated for v0.15.0


## v0.14.0

### Added

- Shared structured logging strategy
- Central logging configuration
- Reusable INFO, DEBUG, WARN, and ERROR logging keywords
- Test lifecycle logging helpers
- Diagnostic-context logging
- Framework-level logging tests
- Logging architecture documentation
- Automation Diary #014 documentation

### Changed

- README and roadmap updated for v0.14.0


## v0.13.0

### Added
- Scaling architecture and application-boundary strategy
- Scalable suite and application onboarding templates
- Tagging/selective-execution guidance
- Test independence and framework-core protection rules
- Automation Diary #013 documentation

### Changed
- README and roadmap updated for v0.13.0


## v0.12.0

### Added
- GitHub Actions CI workflow
- Automated framework capability tests
- Automated smoke tests
- Python and Node.js CI setup
- Robot Framework Browser initialization
- Report artifacts
- CI/CD architecture and Diary #012 documentation

### Changed
- Framework validation now supports shared CI execution
- README and roadmap updated


All notable changes to this project will be documented in this file.

## [0.11.0] - 2026-08-12

### Added

- Central anti-flakiness timing policy in `resources/variables/resilience.resource`.
- Reusable state-based synchronization keywords.
- Explicit read-only retry contract for expected eventual-consistency checks.
- Framework-level anti-flakiness policy tests.
- Anti-Flakiness Strategy architecture guide.
- Automation Diary #011 documentation.

### Changed

- Common Page Object operations now consume centralized synchronization keywords.
- Browser session timeout now uses the central resilience policy.
- Hard-coded common page wait values replaced by named timeout policies.
- README and roadmap advanced to v0.11.0.

### Preserved

- Existing Smoke Test behavior.
- Test Data Management capability from v0.10.0.
- Page Object vs Business Keyword boundaries.
- No real application-specific waits or retry rules were invented.

## [0.10.0] - 2026-08-07

### Added

- Generic Test Data Management architecture under `resources/data/`.
- Runtime generators for UUID-based tokens, safe test emails, timestamps, and traceable `AUTO_` identifiers.
- Generic data builder with explicit field overrides.
- Required-field, traceability, and non-production email validators.
- In-memory cleanup registry for future application-specific deletion adapters.
- Declarative YAML areas for templates, static reference data, and environment data policies.
- Framework-level automated tests for the Test Data Management capability.
- Cross-platform scripts for running application-independent framework tests.
- Test Data Management architecture guide.
- Automation Diary #010 documentation.

### Changed

- README updated to version `v0.10.0` with the generic data flow and framework-test commands.
- Framework overview updated with Test Data Management responsibilities.
- Roadmap advanced to Automation Diary #010.

### Preserved

- Existing Smoke Test behavior.
- Page Object vs Business Keyword boundaries introduced in v0.9.0.
- No real HOT, BP WEB, or BHUB test-data creation or deletion was introduced.

## [0.9.0] - 2026-08-07

### Added

- Explicit `resources/keywords/business/` layer for business intent and workflow orchestration.
- Explicit `resources/keywords/technical/` layer for cross-cutting browser behavior.
- Explicit `resources/pages/common/` and `resources/pages/applications/` Page Object structure.
- Generic Page Object and Business Keyword templates for future real-application onboarding.
- Shared business-level application-availability orchestration.
- Architecture guide defining Page Object vs Business Keyword responsibilities.
- Automation Diary #009 documentation.

### Changed

- Active Smoke and template suites now import the Business Keyword layer directly.
- Existing HOT and BP WEB UI interactions were delegated from business resources to Page Objects.
- Shared application page operations were centralized in `base_page.resource`.
- Suite lifecycle now imports the technical browser layer explicitly.
- Framework overview, contribution guide, roadmap, and README updated for the v0.9 architecture.

### Compatibility

- Previous application-keyword, common-keyword, and top-level page-resource paths remain as compatibility resources.
- Existing Smoke Test behavior is preserved.
- No new real application screens, fields, buttons, or business rules were invented in this milestone.

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
