# Automation Diary Framework

**Project Status:** Framework Saga — 21 of 24 milestones completed
**Current Version:** `v0.21.0`\
**Next Milestone:** `#022 — Reporting, Evidence, and Execution Observability`

## About This Project

This repository documents the evolution of a generic,
production-oriented test automation framework built with:

-   Robot Framework
-   Browser Library (Playwright)
-   Page Object architecture
-   Business Keywords
-   Shared technical utilities
-   External configuration and test data
-   Cross-platform setup and execution
-   CI/CD
-   API + UI integration
-   Parallel execution
-   Versioned technical documentation

The first Automation Diary saga focuses on building the framework
itself. Real application onboarding begins only after the generic
framework reaches its v1.0 readiness milestone.

The existing HOT, BP WEB, and BHUB Smoke Tests remain as executable
examples that prove the framework foundation. New application-specific
screens, buttons, fields, locators, and business rules are intentionally
deferred until the generic framework is complete.

## Current Project Status

### Foundation Completed

-   ✅ #001 --- Planning and automation strategy
-   ✅ #002 --- Independent Smoke Tests
-   ✅ #003 --- Reusable keywords and DRY refactoring
-   ✅ #004 --- Clean project structure
-   ✅ #005 --- Explicit locator strategy
-   ✅ #006 --- Technical documentation and onboarding
-   ✅ #007 --- First sprint retrospective and roadmap
-   ✅ #008 --- Maintainability baseline and controlled dependencies
-   ✅ #009 --- Page Object vs Business Keyword architecture
-   ✅ #010 --- Generic Test Data Management
-   ✅ #011 --- Anti-Flakiness and centralized synchronization
-   ✅ #012 --- CI/CD integration
-   ✅ #013 --- Framework scaling strategy
-   ✅ #014 --- Structured diagnostic logging
-   ✅ #015 --- API + UI integration architecture
-   ✅ #016 --- Shared readability and test-writing conventions
-   ✅ #017 --- End-to-End scenario orchestration
-   ✅ #018 --- Automation effectiveness metrics
-   ✅ #019 --- Environment and Configuration Management
-   ✅ #020 --- Parallel Execution and Execution Strategy

### Current Executable Scope

The active Smoke Tests currently:

-   open each configured homologation environment;
-   validate the expected URL;
-   detect known technical error messages;
-   confirm that the initial page root rendered;
-   generate HTML/XML reports and browser evidence;
-   perform defensive cleanup without masking the original test result.

Authentication and complete business flows remain future
application-onboarding work. Corporate VPN or network access may be
required for the current executable examples.

## Framework Architecture

The framework follows a layered architecture in which each layer has a
clear responsibility:

``` text
Tests
  -> Business Keywords
    -> Page Objects
      -> Technical Utilities / Browser Library
        -> Playwright
          -> Browser
```

### Tests

Own scenarios, tags, expected behavior, and scenario-level assertions.

Tests must not contain locators or direct Browser Library commands.

### Business Keywords

Own business intent and workflow orchestration.

Business Keywords must not contain CSS, XPath, or direct `Click` /
`Fill Text` calls.

### Page Objects

Own locators and UI-level operations.

A UI change should normally be resolved inside this layer without
changing the business flow.

### Technical Utilities

Own cross-cutting technical concerns such as browser lifecycle,
synchronization, logging, configuration, metrics, execution strategy,
defensive cleanup, and technical-error validation.

The layered architecture was formalized in `v0.9.0` and has continued
evolving through subsequent milestones.

## Framework Capabilities

  -------------------------------------------------------------------------------------------------------------------------------
  Capability                              Introduced Technical Documentation
  --------------------- ---------------------------- ----------------------------------------------------------------------------
  Framework planning                          v0.1.0 [Framework Overview](docs/architecture/framework-overview.md)
  and architecture                                   

  Smoke Test strategy                         v0.2.0 [Execution Guide](docs/getting-started/execution.md)

  Reusable keywords                           v0.3.0 [How to Add a Test](docs/guides/adding-tests.md)

  Clean project                               v0.4.0 [Framework Overview](docs/architecture/framework-overview.md)
  structure                                          

  Locator strategy                            v0.5.0 [Framework Overview](docs/architecture/framework-overview.md)

  Documentation and                           v0.6.0 [Onboarding Guide](docs/getting-started/onboarding.md)
  onboarding                                         

  Maintainability                             v0.8.0 [Maintainability
                                                     Guidelines](docs/architecture/maintainability-guidelines.md)

  Page Objects vs                             v0.9.0 [Architecture
  Business Keywords                                  Contract](docs/architecture/page-objects-vs-business-keywords.md)

  Test Data Management                       v0.10.0 [Test Data Management](docs/architecture/test-data-management.md)

  Anti-Flakiness                             v0.11.0 [Anti-Flakiness Strategy](docs/architecture/anti-flakiness-strategy.md)

  CI/CD                                      v0.12.0 [CI/CD Strategy](docs/architecture/ci-cd-strategy.md)

  Framework Scaling                          v0.13.0 [Scaling Strategy](docs/architecture/scaling-strategy.md)

  Structured Logging                         v0.14.0 [Logging Strategy](docs/architecture/logging-strategy.md)

  API + UI Integration                       v0.15.0 [API + UI Strategy](docs/architecture/api-ui-strategy.md)

  Readable Tests                             v0.16.0 [Readability and Test
                                                     Conventions](docs/architecture/readability-and-test-conventions.md)

  E2E Orchestration                          v0.17.0 [E2E Scenario Strategy](docs/architecture/end-to-end-scenario-strategy.md)

  Automation Metrics                         v0.18.0 [Automation Metrics
                                                     Strategy](docs/architecture/automation-metrics-strategy.md)

  Environment                                v0.19.0 [Environment & Configuration
  Configuration                                      Management](docs/architecture/environment-and-configuration-management.md)

  Parallel Execution                         v0.20.0 [Parallel Execution
                                                     Strategy](docs/architecture/parallel-execution-strategy.md)
  -------------------------------------------------------------------------------------------------------------------------------

## Getting Started

### Approved Dependencies

``` text
robotframework==7.4.2
robotframework-browser==20.2.0
PyYAML==6.0.3
robotframework-pabot==5.2.2
```

The setup scripts install project-approved versions. Dependency upgrades
are intentional framework changes and must be tested, documented, and
versioned.

### Quick Start --- Windows

``` bat
scripts\setup_windows.bat
scripts\run_smoke.bat all
```

### Quick Start --- Linux and macOS

``` bash
chmod +x scripts/setup_unix.sh scripts/run_smoke.sh
scripts/setup_unix.sh
scripts/run_smoke.sh all
```

For detailed environment preparation, see the [Onboarding
Guide](docs/getting-started/onboarding.md).

## Running Tests

### Framework Capability Tests

Framework-level validation can run independently from real applications:

``` bat
scripts\run_framework_tests.bat
```

``` powershell
.\scripts\run_framework_tests.ps1
```

``` bash
scripts/run_framework_tests.sh
```

These tests validate application-independent framework capabilities such
as test-data contracts, synchronization policy, logging, configuration,
metrics, architecture conventions, and execution strategy.

### Smoke Tests

``` bat
scripts\run_smoke.bat all
```

``` powershell
.\scripts\run_smoke.ps1 all
```

``` bash
scripts/run_smoke.sh all
```

### Parallel Execution

Parallel execution is powered by Pabot and remains intentionally
separated from test design. Tests must remain independent, own their
setup and cleanup, and avoid shared mutable state before being
considered safe for concurrent execution.

Cross-platform runners:

-   `scripts/run_parallel.bat`
-   `scripts/run_parallel.ps1`
-   `scripts/run_parallel.sh`

Runtime configuration:

-   `PARALLEL_PROCESSES`
-   `EXECUTION_SCOPE`
-   `PARALLEL_OUTPUT_DIR`

See the [Parallel Execution
Strategy](docs/architecture/parallel-execution-strategy.md) for the
complete execution contract.

## Configuration and Test Data

### Environment Configuration

Environment-dependent values are resolved through the framework
configuration layer rather than being hard-coded inside test scenarios.

Generic configuration includes:

-   environment name;
-   browser;
-   headless execution;
-   API timeout;
-   defaults;
-   required-value validation.

See [Environment & Configuration
Management](docs/architecture/environment-and-configuration-management.md).

### Test Data Management

The framework separates test data into two concerns:

-   `data/` owns declarative YAML templates, static reference values,
    and environment data policies;
-   `resources/data/` owns executable generation, building, validation,
    and cleanup orchestration.

The generic flow is:

``` text
Data Template / Defaults
  -> Generator
    -> Builder
      -> Validator
        -> Business Test
          -> Cleanup Registry
```

The framework intentionally does not create HOT, BP WEB, or BHUB
business records yet. Real application creation and deletion adapters
belong to the application-onboarding phase after the generic framework
is complete.

### Secure Runtime Values

Sensitive runtime values are resolved through the centralized secure configuration capability.

Real passwords, tokens, API keys, private credentials, and session secrets are never committed to the repository. Local execution supplies them through environment variables, while CI environments can inject them through protected secret stores.

See [Secrets and Secure Test Configuration](docs/architecture/secrets-and-secure-configuration.md).

## Project Structure

``` text
.
├── .github
│   └── workflows
├── data
│   ├── environments
│   ├── static
│   └── templates
├── docs
│   ├── architecture
│   ├── automation-diary
│   ├── getting-started
│   ├── guides
│   ├── project
│   └── troubleshooting
├── resources
│   ├── api
│   ├── data
│   │   ├── builders
│   │   ├── cleanup
│   │   ├── generators
│   │   └── validators
│   ├── keywords
│   │   ├── applications
│   │   ├── business
│   │   │   ├── applications
│   │   │   ├── common
│   │   │   └── templates
│   │   ├── common
│   │   └── technical
│   ├── pages
│   │   ├── applications
│   │   ├── common
│   │   └── templates
│   ├── suites
│   ├── templates
│   └── variables
├── results
├── scripts
├── tests
│   ├── bhub
│   ├── bpweb
│   ├── e2e
│   ├── framework
│   └── hot
├── CHANGELOG.md
├── README.md
└── requirements.txt
```

## Compatibility Policy

The explicit layered architecture introduced compatibility paths without
breaking files used by earlier episodes.

Earlier resources under:

``` text
resources/keywords/applications/
resources/keywords/common/
resources/pages/<application>_page.resource
```

remain available for compatibility. New framework code should use the
explicit `business`, `technical`, and Page Object paths.

## Documentation

  ----------------------------------------------------------------------------------------------------------------
  Guide                                                                        Purpose
  ---------------------------------------------------------------------------- -----------------------------------
  [Framework Overview](docs/architecture/framework-overview.md)                Architecture, responsibilities, and
                                                                               execution flow

  [Page Objects vs Business                                                    Layer contracts and change
  Keywords](docs/architecture/page-objects-vs-business-keywords.md)            ownership

  [Maintainability                                                             Change ownership, dependency
  Guidelines](docs/architecture/maintainability-guidelines.md)                 policy, and review checklist

  [Test Data Management](docs/architecture/test-data-management.md)            Builders, generators, validators,
                                                                               templates, and cleanup contracts

  [Anti-Flakiness Strategy](docs/architecture/anti-flakiness-strategy.md)      Synchronization, timeout, and safe
                                                                               retry policy

  [CI/CD Strategy](docs/architecture/ci-cd-strategy.md)                        Robot Framework execution and
                                                                               validation in CI

  [Scaling Strategy](docs/architecture/scaling-strategy.md)                    Application boundaries, scopes, and
                                                                               scalable onboarding

  [Logging Strategy](docs/architecture/logging-strategy.md)                    Structured diagnostic logging and
                                                                               evidence

  [API + UI Strategy](docs/architecture/api-ui-strategy.md)                    API preparation and UI verification
                                                                               boundaries

  [Readability and Test                                                        Shared test-writing contract
  Conventions](docs/architecture/readability-and-test-conventions.md)          

  [E2E Scenario Strategy](docs/architecture/end-to-end-scenario-strategy.md)   Prepare, Act, Transition, Verify,
                                                                               Cleanup orchestration

  [Automation Metrics                                                          Effectiveness indicators beyond
  Strategy](docs/architecture/automation-metrics-strategy.md)                  test volume

  [Environment & Configuration                                                 Runtime configuration and
  Management](docs/architecture/environment-and-configuration-management.md)   environment resolution

  [Parallel Execution                                                          Configurable concurrency and test
  Strategy](docs/architecture/parallel-execution-strategy.md)                  independence

  [Onboarding Guide](docs/getting-started/onboarding.md)                       Prepare Windows, Linux, or macOS

  [Execution Guide](docs/getting-started/execution.md)                         Run tests and interpret results

  [How to Add a Test](docs/guides/adding-tests.md)                             Extend the framework without mixing
                                                                               responsibilities

  [Common Errors](docs/troubleshooting/common-errors.md)                       Diagnose Node.js, Browser Library,
                                                                               VPN, and locator failures

  [Project Retrospective](docs/project/project-retrospective.md)               Review early framework decisions
                                                                               and lessons

  [Roadmap](docs/roadmap.md)                                                   Follow the first saga through #024
  ----------------------------------------------------------------------------------------------------------------

## Automation Diary

  -------------------------------------------------------------------------
  Episode                                     Version Status
  ---------------------- ---------------------------- ---------------------
  #001 --- Planning                            v0.1.0 ✅ Completed
  Before Coding                                       

  #002 --- Why I Always                        v0.2.0 ✅ Completed
  Start with Smoke Tests                              

  #003 --- Building                            v0.3.0 ✅ Completed
  Reusable Keywords                                   
  Instead of Duplicated                               
  Code                                                

  #004 --- The                                 v0.4.0 ✅ Completed
  Importance of a Clean                               
  Project Structure                                   

  #005 --- Choosing the                        v0.5.0 ✅ Completed
  Right Locator Strategy                              

  #006 --- Why                                 v0.6.0 ✅ Completed
  Documentation Is Part                               
  of Automation                                       

  #007 --- Lessons                             v0.7.0 ✅ Completed
  Learned After the                                   
  First Sprint                                        

  #008 --- Designing                           v0.8.0 ✅ Completed
  Automation for                                      
  Maintainability                                     

  #009 --- Page Objects                        v0.9.0 ✅ Completed
  vs Business Keywords                                

  #010 --- Managing Test                      v0.10.0 ✅ Completed
  Data Efficiently                                    

  #011 --- Avoiding                           v0.11.0 ✅ Completed
  Flaky Tests                                         

  #012 --- Integrating                        v0.12.0 ✅ Completed
  Robot Framework with                                
  CI/CD                                               

  #013 --- Scaling an                         v0.13.0 ✅ Completed
  Automation Framework                                

  #014 --- Logging That                       v0.14.0 ✅ Completed
  Actually Helps                                      
  Debugging                                           

  #015 --- API and UI                         v0.15.0 ✅ Completed
  Automation Working                                  
  Together                                            

  #016 --- Writing Tests                      v0.16.0 ✅ Completed
  That Other Engineers                                
  Can Understand                                      

  #017 --- How I                              v0.17.0 ✅ Completed
  Organize End-to-End                                 
  Scenarios                                           

  #018 --- Measuring                          v0.18.0 ✅ Completed
  Automation Success                                  
  Beyond Test Coverage                                

  #019 --- Environment                        v0.19.0 ✅ Completed
  and Configuration                                   
  Management                                          

  #020 --- Parallel                           v0.20.0 ✅ Completed
  Execution and                                       
  Execution Strategy                                  

  #021 --- Secrets and                            --- ⏳ Next
  Secure Test                                         
  Configuration                                       

  #022 --- Reporting,                             --- ⏳ Planned
  Evidence, and                                       
  Execution                                           
  Observability                                       

  #023 ---                                        --- ⏳ Planned
  Production-Readiness                                
  and Framework                                       
  Governance                                          

  #024 --- Framework                              --- ⏳ Planned
  Finalization and v1.0                               
  Readiness                                           
  -------------------------------------------------------------------------

### Episode Documentation

-   [#001 --- Planning Before
    Coding](docs/automation-diary/001-planning-before-coding.md)
-   [#002 --- Why I Always Start with Smoke
    Tests](docs/automation-diary/002-smoke-tests.md)
-   [#003 --- Building Reusable Keywords Instead of Duplicated
    Code](docs/automation-diary/003-reusable-keywords.md)
-   [#004 --- The Importance of a Clean Project
    Structure](docs/automation-diary/004-clean-project-structure.md)
-   [#005 --- Choosing the Right Locator
    Strategy](docs/automation-diary/005-locator-strategy.md)
-   [#006 --- Why Documentation Is Part of
    Automation](docs/automation-diary/006-documentation-is-part-of-automation.md)
-   [#007 --- Lessons Learned After the First
    Sprint](docs/automation-diary/007-lessons-learned.md)
-   [#008 --- Designing Automation for
    Maintainability](docs/automation-diary/008-designing-automation-for-maintainability.md)
-   [#009 --- Page Objects vs Business
    Keywords](docs/automation-diary/009-page-objects-vs-business-keywords.md)
-   [#010 --- Managing Test Data
    Efficiently](docs/automation-diary/010-managing-test-data-efficiently.md)
-   [#011 --- Avoiding Flaky
    Tests](docs/automation-diary/011-avoiding-flaky-tests.md)
-   [#012 --- Integrating Robot Framework with
    CI/CD](docs/automation-diary/012-integrating-robot-framework-with-ci-cd.md)
-   [#013 --- Scaling an Automation
    Framework](docs/automation-diary/013-scaling-an-automation-framework.md)
-   [#014 --- Logging That Actually Helps
    Debugging](docs/automation-diary/014-logging-that-actually-helps-debugging.md)
-   [#015 --- API and UI Automation Working
    Together](docs/automation-diary/015-api-and-ui-automation-working-together.md)
-   [#016 --- Writing Tests That Other Engineers Can
    Understand](docs/automation-diary/016-writing-tests-that-other-engineers-can-understand.md)
-   [#017 --- How I Organize End-to-End
    Scenarios](docs/automation-diary/017-how-i-organize-end-to-end-scenarios.md)
-   [#018 --- Measuring Automation Success Beyond Test
    Coverage](docs/automation-diary/018-measuring-automation-success-beyond-test-coverage.md)
-   [#019 --- Environment and Configuration
    Management](docs/automation-diary/019-environment-and-configuration-management.md)
-   [#020 --- Parallel Execution and Execution
    Strategy](docs/automation-diary/020-parallel-execution-and-execution-strategy.md)

## Roadmap

The first framework-building saga continues through Automation Diary
#024.

### Next Milestones

-   ⏳ #021 --- Secrets and Secure Test Configuration
-   ⏳ #022 --- Reporting, Evidence, and Execution Observability
-   ⏳ #023 --- Production-Readiness and Framework Governance
-   ⏳ #024 --- Framework Finalization and v1.0 Readiness

After #024, the next saga will focus on applying the completed generic
framework to real enterprise applications by adding
application-specific:

-   environment configuration;
-   Page Objects and locators;
-   Business Keywords;
-   test data;
-   API clients and schemas;
-   Smoke, Functional, Integration, and End-to-End scenarios.

## Version History

  -----------------------------------------------------------------------
  Version                 Episode                 Description
  ----------------------- ----------------------- -----------------------
  v0.1.0                  #001                    Framework planning and
                                                  architecture

  v0.2.0                  #002                    Smoke Test strategy

  v0.3.0                  #003                    Reusable keywords and
                                                  DRY refactoring

  v0.4.0                  #004                    Clean project structure

  v0.5.0                  #005                    Stable locator strategy

  v0.6.0                  #006                    Technical documentation
                                                  and onboarding

  v0.7.0                  #007                    First sprint
                                                  retrospective and
                                                  roadmap

  v0.8.0                  #008                    Maintainability
                                                  baseline and controlled
                                                  change points

  v0.9.0                  #009                    Page Object and
                                                  Business Keyword
                                                  responsibility
                                                  boundaries

  v0.10.0                 #010                    Generic Test Data
                                                  Management capability

  v0.11.0                 #011                    Anti-flakiness and
                                                  synchronization
                                                  strategy

  v0.12.0                 #012                    CI/CD integration

  v0.13.0                 #013                    Framework scaling
                                                  strategy

  v0.14.0                 #014                    Structured diagnostic
                                                  logging

  v0.15.0                 #015                    API + UI integration
                                                  architecture

  v0.16.0                 #016                    Readable tests and
                                                  shared writing
                                                  conventions

  v0.17.0                 #017                    End-to-End scenario
                                                  orchestration contract

  v0.18.0                 #018                    Automation
                                                  effectiveness metrics
                                                  beyond raw test
                                                  coverage

  v0.19.0                 #019                    Environment and
                                                  configuration
                                                  management

  v0.20.0                 #020                    Parallel execution and
                                                  execution strategy
  -----------------------------------------------------------------------

## Philosophy

> Reliable automation comes from explicit architecture: reusable
> behavior, isolated test data, deterministic synchronization,
> observable execution, external configuration, secure runtime values,
> and independent scenarios.

## Author

**André Leite**\
Senior QA Automation Engineer
