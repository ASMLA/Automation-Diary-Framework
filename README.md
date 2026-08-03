# HOT • BP WEB • BHUB Automation Framework

**Project Status:** Phase 2 Started — Maintainability Baseline Established

## About this project

This repository documents the evolution of a real-world web test automation framework built with Robot Framework and Browser Library (Playwright).

The framework currently provides independent Smoke Tests for HOT, BP WEB, and BHUB, reusable business keywords, shared technical behavior, centralized suite lifecycle management, separated page resources, external configuration, an explicit locator strategy, controlled dependencies, and practical technical documentation.

## Current executable scope

The active Smoke Tests:

- Open each homologation environment
- Validate the expected URL
- Detect known technical error messages
- Confirm that the initial page root rendered
- Generate HTML/XML reports and browser evidence
- Perform defensive cleanup without masking the original test result

Authentication and complete business flows remain planned work. Corporate VPN or network access may be required.

## Current project status

**Current version:** `v0.8.0`

### Foundation completed

- ✅ Planning and automation strategy
- ✅ Independent Smoke Tests
- ✅ Reusable technical and business keywords
- ✅ Clean project structure
- ✅ Explicit locator strategy
- ✅ Architecture, onboarding, execution, extension, and troubleshooting documentation
- ✅ First sprint retrospective and roadmap

### Maintainability baseline completed in v0.8.0

- ✅ Central application environment metadata
- ✅ Central technical-error catalog
- ✅ Shared Smoke Test lifecycle resource
- ✅ Defensive evidence and cleanup behavior
- ✅ Project-approved dependency versions
- ✅ Windows, Linux, and macOS setup/run script parity
- ✅ Maintainability guidelines and change-impact map

### Planned next

- 🚧 Page Objects vs Business Keywords
- 🚧 Test-data management
- 🚧 Flaky-test prevention improvements
- 🚧 Authentication and business flows
- 🚧 End-to-End integration
- 🚧 CI/CD

## Start here

| Guide | Purpose |
|---|---|
| [Framework Overview](docs/architecture/framework-overview.md) | Architecture, responsibilities, and execution flow |
| [Maintainability Guidelines](docs/architecture/maintainability-guidelines.md) | Change ownership, dependency policy, and review checklist |
| [Onboarding Guide](docs/getting-started/onboarding.md) | Prepare Windows, Linux, or macOS |
| [Execution Guide](docs/getting-started/execution.md) | Run all tests or one application and read results |
| [How to Add a Test](docs/guides/adding-tests.md) | Extend the framework without breaking responsibilities |
| [Common Errors](docs/troubleshooting/common-errors.md) | Diagnose Node.js, Browser Library, VPN, and locator failures |
| [Project Retrospective](docs/project/project-retrospective.md) | Review Sprint 1 decisions, results, and improvement opportunities |
| [Roadmap](docs/roadmap.md) | Follow the next planned milestones |

## Quick start — Windows

```bat
scripts\setup_windows.bat
scripts\run_smoke.bat all
```

## Quick start — Linux and macOS

```bash
chmod +x scripts/setup_unix.sh scripts/run_smoke.sh
scripts/setup_unix.sh
scripts/run_smoke.sh all
```

## Approved dependencies

```text
robotframework==7.4.2
robotframework-browser==20.2.0
PyYAML==6.0.3
```

The setup scripts install the versions approved by this project. Dependency upgrades are intentional framework changes and must be tested, documented, and versioned.

## Project structure

```text
.
├── data
├── docs
│   ├── architecture
│   ├── automation-diary
│   ├── getting-started
│   ├── guides
│   ├── project
│   └── troubleshooting
├── resources
│   ├── keywords
│   │   ├── applications
│   │   └── common
│   ├── pages
│   ├── suites
│   └── variables
├── results
├── scripts
├── tests
│   ├── bhub
│   ├── bpweb
│   ├── e2e
│   └── hot
├── CHANGELOG.md
├── README.md
└── requirements.txt
```

## Automation Diary

| Episode | Status |
|---|---|
| ✅ #001 – Planning Before Coding | Completed |
| ✅ #002 – Why I Always Start with Smoke Tests | Completed |
| ✅ #003 – Building Reusable Keywords Instead of Duplicated Code | Completed |
| ✅ #004 – The Importance of a Clean Project Structure | Completed |
| ✅ #005 – Choosing the Right Locator Strategy | Completed |
| ✅ #006 – Why Documentation Is Part of Automation | Completed |
| ✅ #007 – Lessons Learned After the First Sprint | Completed |
| 🔄 #008 – Designing Automation for Maintainability | Current |
| ⏳ #009 – Page Objects vs Business Keywords | Next |

## Episode documentation

- [#001 – Planning Before Coding](docs/automation-diary/001-planning-before-coding.md)
- [#002 – Why I Always Start with Smoke Tests](docs/automation-diary/002-smoke-tests.md)
- [#003 – Building Reusable Keywords Instead of Duplicated Code](docs/automation-diary/003-reusable-keywords.md)
- [#004 – The Importance of a Clean Project Structure](docs/automation-diary/004-clean-project-structure.md)
- [#005 – Choosing the Right Locator Strategy](docs/automation-diary/005-locator-strategy.md)
- [#006 – Why Documentation Is Part of Automation](docs/automation-diary/006-documentation-is-part-of-automation.md)
- [#007 – Lessons Learned After the First Sprint](docs/automation-diary/007-lessons-learned.md)
- [#008 – Designing Automation for Maintainability](docs/automation-diary/008-designing-automation-for-maintainability.md)

## Version history

| Version | Episode | Description |
|---|---|---|
| v0.1.0 | #001 | Framework planning and architecture |
| v0.2.0 | #002 | Smoke Test strategy |
| v0.3.0 | #003 | Reusable keywords and DRY refactoring |
| v0.4.0 | #004 | Clean project structure |
| v0.5.0 | #005 | Stable locator strategy |
| v0.6.0 | #006 | Technical documentation and onboarding |
| v0.7.0 | #007 | First sprint retrospective and roadmap |
| v0.8.0 | #008 | Maintainability baseline and controlled change points |

## Philosophy

> Maintainability means that every type of change has one clear home, one understandable impact, and one reliable validation path.

## Author

**André Leite**  
Senior QA Automation Engineer
