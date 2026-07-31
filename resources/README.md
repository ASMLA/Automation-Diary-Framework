# HOT • BP WEB • BHUB Automation Framework

**Project Status:** Documented, Executable Framework Foundation

## About this project

This repository documents the evolution of a real-world web test automation framework built with Robot Framework and Browser Library (Playwright).

The framework currently provides independent Smoke Tests for HOT, BP WEB, and BHUB, reusable business keywords, shared technical browser behavior, separated page resources, external configuration, explicit locator strategy, and practical technical documentation.

## Current executable scope

The active Smoke Tests:

- Open each homologation environment
- Validate the expected URL
- Detect known technical error messages
- Confirm that the initial page root rendered
- Generate HTML/XML reports and browser evidence

Authentication and full business flows remain planned work. Corporate VPN or network access may be required.

## Start here

| Guide | Purpose |
|---|---|
| [Framework Overview](docs/architecture/framework-overview.md) | Architecture, responsibilities, and execution flow |
| [Onboarding Guide](docs/getting-started/onboarding.md) | Prepare Windows, Linux, or macOS |
| [Execution Guide](docs/getting-started/execution.md) | Run all tests or one application and read results |
| [How to Add a Test](docs/guides/adding-tests.md) | Extend the framework without breaking responsibilities |
| [Common Errors](docs/troubleshooting/common-errors.md) | Diagnose Node.js, Browser Library, VPN, and locator failures |

## Quick start — Windows

```bat
scripts\setup_windows.bat
scripts\run_smoke.bat all
```

## Quick start — Linux and macOS

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
rfbrowser init
robot -d results -i smoke tests
```

## Project structure

```text
.
├── data
├── docs
│   ├── architecture
│   ├── automation-diary
│   ├── getting-started
│   ├── guides
│   └── troubleshooting
├── resources
│   ├── keywords
│   │   ├── applications
│   │   └── common
│   ├── pages
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
| 🔄 #006 – Why Documentation Is Part of Automation | Current |
| ⏳ #007 – Lessons Learned After the First Sprint | Planned |

## Episode documentation

- [#001 – Planning Before Coding](docs/automation-diary/001-planning-before-coding.md)
- [#002 – Why I Always Start with Smoke Tests](docs/automation-diary/002-smoke-tests.md)
- [#003 – Building Reusable Keywords Instead of Duplicated Code](docs/automation-diary/003-reusable-keywords.md)
- [#004 – The Importance of a Clean Project Structure](docs/automation-diary/004-clean-project-structure.md)
- [#005 – Choosing the Right Locator Strategy](docs/automation-diary/005-locator-strategy.md)
- [#006 – Why Documentation Is Part of Automation](docs/automation-diary/006-documentation-is-part-of-automation.md)

## Version history

| Version | Episode | Description |
|---|---|---|
| v0.1.0 | #001 | Framework planning and architecture |
| v0.2.0 | #002 | Smoke Test strategy |
| v0.3.0 | #003 | Reusable keywords and DRY refactoring |
| v0.4.0 | #004 | Clean project structure |
| v0.5.0 | #005 | Stable locator strategy |
| v0.6.0 | #006 | Architecture, onboarding, execution, extension, and troubleshooting documentation |

## Philosophy

> Quality starts with good decisions, and documentation makes those decisions repeatable.

## Author

**André Leite**  
Senior QA Automation Engineer


## Automation Diary

| Diary | Status |
|---|---|
| #001 – Planning Before Coding | ✅ |
| #002 – Smoke Tests | ✅ |
| #003 – Reusable Keywords | ✅ |
| #004 – Clean Project Structure | ✅ |
| #005 – Locator Strategy | ✅ |
| #006 – Documentation | ✅ |
| #007 – Lessons Learned After the First Sprint | ✅ Current |

## Current Version

**v0.7.0**

## Current Project Status

Completed:
- Planning
- Smoke Tests
- Reusable Keywords
- Clean Project Structure
- Locator Strategy
- Documentation

Next:
- Authentication
- Business Flows
- CI/CD
- API Automation
- Parallel Execution
