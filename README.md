# HOT • BP WEB • BHUB Automation Framework

**Project Status:** Stable and Explicit Locator Strategy

---

# About this Project

Every automation project starts before the first line of code.

This repository documents the evolution of a real-world test automation framework built with:

- Robot Framework
- Browser Library (Playwright)
- Page Object Model
- Reusable Keywords
- External Test Data
- CI/CD
- Scalable Project Architecture

The goal is not only to automate tests, but to build a framework that is:

- Easy to maintain
- Easy to understand
- Reusable
- Scalable
- Ready to evolve with the application

Each milestone in this repository reflects a real engineering decision made during the development of the framework.

---

# Current Phase

The framework foundation, Smoke Test strategy, reusable keyword layer, and clean project structure are established. The current milestone defines how stable locators are selected, documented, and resolved.

Current objectives:

- Validate HOT availability
- Validate BP WEB availability
- Validate BHUB availability
- Execute fast health checks
- Detect environment issues before regression testing
- Reduce duplicated automation behavior
- Keep tests focused on readable business intent
- Separate shared keywords from application-specific behavior
- Make pages, variables, data, resources, and tests easy to locate
- Use explicit selector engines and a documented locator priority
- Reduce flaky behavior caused by ambiguous or unstable selectors

Smoke tests provide the first layer of confidence before executing larger automation suites.

---

# Automation Diary

This repository evolves together with my **Automation Diary** series on LinkedIn.

Each publication represents a real milestone in the evolution of this framework.

| Episode | Status |
|----------|--------|
| ✅ #001 – Planning Before Coding | Completed |
| ✅ #002 – Why I Always Start with Smoke Tests | Completed |
| ✅ #003 – Building Reusable Keywords Instead of Duplicated Code | Completed |
| ✅ #004 – The Importance of a Clean Project Structure | Completed |
| 🔄 #005 – Choosing the Right Locator Strategy | Current |
| ⏳ #006 – Why Documentation Is Part of Automation | Planned |
| ⏳ #007 – Lessons Learned After the First Sprint | Planned |

---

# Automation Diary Documentation

| Documentation | Description |
|---------------|-------------|
| 📘 [#001 – Planning Before Coding](docs/automation-diary/001-planning-before-coding.md) | Framework planning and architecture decisions |
| 📘 [#002 – Why I Always Start with Smoke Tests](docs/automation-diary/002-smoke-tests.md) | Smoke testing strategy and first executable milestone |
| 📘 [#003 – Building Reusable Keywords Instead of Duplicated Code](docs/automation-diary/003-reusable-keywords.md) | DRY refactoring and reusable business keywords |
| 📘 [#004 – The Importance of a Clean Project Structure](docs/automation-diary/004-clean-project-structure.md) | Separation of responsibilities and scalable folder organization |
| 📘 [#005 – Choosing the Right Locator Strategy](docs/automation-diary/005-locator-strategy.md) | Locator hierarchy, explicit selector engines, and flaky-test prevention |
| 📄 #006 – Why Documentation Is Part of Automation | Coming Soon |
| 📄 #007 – Lessons Learned After the First Sprint | Coming Soon |

---

# Project Structure

```text
.
├── data
├── docs
│   └── automation-diary
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

---

# Roadmap

- ✅ Project Planning
- ✅ Framework Foundation
- ✅ Smoke Test Strategy
- ✅ Reusable Keywords
- ✅ Clean Project Structure
- ✅ Locator Strategy
- ⏳ Documentation
- ⏳ HOT Business Flows
- ⏳ BP WEB Business Flows
- ⏳ BHUB Business Flows
- ⏳ End-to-End Integration
- ⏳ CI/CD Pipeline
- ⏳ Stable v1.0

---

# Latest Milestone

## Automation Diary #005

### Choosing the Right Locator Strategy

Implemented:

- Explicit `css` and `text` selector engines
- Documented locator priority from stable attributes to last-resort XPath
- Application page-root locator naming
- Ordered primary and fallback locators for the HOT demand title field
- Reusable fallback resolution through `Get First Visible Locator`
- Flaky-test prevention guidance based on real DOM contracts

---

# Version History

| Version | Automation Diary | Description |
|----------|------------------|-------------|
| v0.1.0 | #001 | Framework planning and architecture |
| v0.2.0 | #002 | Smoke Test strategy |
| v0.3.0 | #003 | Reusable keywords and DRY refactoring |
| v0.4.0 | #004 | Clean project structure and separation of responsibilities |
| v0.5.0 | #005 | Explicit locator strategy and controlled fallback resolution |

---

# Philosophy

> Quality starts with good decisions, not just good code.

This repository demonstrates not only automated tests, but also the engineering decisions behind building a maintainable, scalable, and production-ready automation framework.

---

# Author

**André Leite**

Senior QA Automation Engineer

---

## Current Automation Diary Progress

✅ #001 → Planning Before Coding

✅ #002 → Why I Always Start with Smoke Tests

✅ #003 → Building Reusable Keywords Instead of Duplicated Code

✅ #004 → The Importance of a Clean Project Structure

🔄 #005 → Choosing the Right Locator Strategy
