# Environment and Configuration Management

## Purpose

Version v0.19.0 establishes a consistent strategy for managing environment-dependent configuration without hard-coding values inside test scenarios.

## Principles

### Configuration is external

Tests should describe behavior, not environment details.

Values such as environment name, browser, headless mode, timeouts, API endpoints, and future credentials should be resolved through configuration capabilities.

### Defaults must be explicit

The framework provides safe defaults for local execution while allowing CI or future environments to override them through environment variables.

### Secrets are not configuration files

Passwords, tokens, private keys, and sensitive credentials must never be committed to the repository.

Future real systems should receive secrets through protected CI secret stores or secure runtime injection.

### Environment-specific values stay out of tests

Tests should not contain direct references such as:

- hard-coded HML URLs
- developer-specific paths
- machine-specific settings
- embedded credentials

### Fail early for required configuration

When a value is mandatory, the framework should fail during setup rather than much later inside a business scenario.

## Configuration flow

Runtime / CI Environment Variables
↓
Technical Configuration Layer
↓
Business / API / UI Capabilities
↓
Tests

## Supported generic configuration

The framework now defines reusable resolution for:

- environment name
- browser
- headless execution
- API timeout
- required configuration validation

## Application-agnostic design

No HOT, BP WEB, or BHUB-specific environment secrets or endpoints are introduced in this milestone.
