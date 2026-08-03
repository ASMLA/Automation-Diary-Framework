# Maintainability Guidelines

## Purpose

Maintainability means that a change has one obvious implementation point, a predictable impact, and a clear validation path.

## Rules applied in v0.8.0

### 1. Centralize configuration

Application URLs and their expected URL fragments belong to `resources/variables/environment.resource`. Application keyword files consume these values instead of repeating environment strings.

### 2. Centralize validation catalogs

Known technical error messages belong to `resources/variables/validation.resource`. Adding a new monitored error requires one change instead of editing every application flow.

### 3. Centralize suite lifecycle behavior

`resources/suites/smoke_suite.resource` owns the Smoke Test setup and teardown contract. Test files describe scenarios and do not need to know how browser evidence and cleanup are implemented.

### 4. Keep teardown defensive

Evidence collection and browser cleanup must not replace the original failure with a second teardown failure. Cleanup therefore attempts screenshot and browser closure safely.

### 5. Pin approved dependencies

`requirements.txt` contains project-approved versions. Setup scripts reproduce the same Python dependency set instead of silently installing whatever version happens to be newest.

### 6. Preserve readable business intent

Tests continue to call application-level business keywords such as `Validate HOT Availability`. Shared technical behavior remains hidden behind resources.

## Change-impact map

| Change | Primary file |
|---|---|
| Environment URL | `resources/variables/environment.resource` |
| Known technical error | `resources/variables/validation.resource` |
| Browser lifecycle | `resources/suites/smoke_suite.resource` or shared browser keywords |
| Application behavior | `resources/keywords/applications/` |
| Locator | `resources/pages/` |
| Test scenario | `tests/` |
| Dependency version | `requirements.txt` |

## Maintainability review checklist

- Is the behavior implemented in only one authoritative place?
- Does the test describe intent instead of browser mechanics?
- Is configuration separated from behavior?
- Will a failed setup still produce understandable cleanup behavior?
- Can another engineer identify the change location without searching the entire repository?
- Are dependency changes explicit and versioned?
