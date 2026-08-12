# Test Data Management Architecture

## Purpose

Version `v0.10.0` introduces a generic Test Data Management capability that is independent from HOT, BP WEB, BHUB, or any future application.

The goal is to ensure that test scenarios do not become responsible for inventing, validating, tracking, and cleaning their own data.

## Architecture

```text
Declarative data
  data/templates
  data/static
  data/environments
        |
        v
Executable data services
  Generator -> Builder -> Validator -> Cleanup Registry
        |
        v
Business Keywords / Tests
```

## Responsibilities

### Templates

YAML files define reusable default shapes and reference values. They should not contain production secrets or environment credentials.

### Generators

Generators create values that must be unique or traceable at runtime. The initial capability provides:

- UUID-based unique tokens;
- safe `example.test` email addresses;
- compact timestamps;
- ISO timestamps;
- `AUTO_` prefixed test identifiers.

No Faker-style external dependency is required for the initial implementation.

### Builders

Builders combine generated values, defaults, and explicit overrides into a complete test-data object.

The generic builder intentionally knows nothing about a real application's API or UI. Future application adapters will consume builder output.

### Validators

Validators enforce preconditions before a business scenario starts. They check required keys, empty values, automation traceability, and safe generated domains.

Failing before application interaction makes data problems easier to diagnose than allowing an invalid mass to fail several steps later.

### Cleanup Registry

The framework now provides an in-memory cleanup registry. Generated IDs can be registered when data is created, retrieved by future cleanup adapters, and cleared after teardown.

The generic framework does not delete records from a real system. That implementation belongs to application-specific adapters in Saga 2.

## Data categories

The framework recognizes four categories:

1. **Static data** — stable reference values such as profiles and statuses.
2. **Generated data** — unique identifiers, emails, timestamps, and values created for each execution.
3. **Template data** — reusable object shapes and defaults.
4. **Environment data** — policies and environment-specific non-secret configuration.

## Data safety rules

- Never embed production credentials in YAML.
- Generated identifiers should be traceable.
- Default generated emails must use non-production domains.
- A test must be able to validate its data before interacting with an application.
- Cleanup responsibility must be registered when disposable data is created.
- Parallel execution must not depend on shared mutable business records.

## Framework validation

The capability is tested independently in:

```text
tests/framework/test_data_management.robot
```

Run it with:

```text
scripts/run_framework_tests.bat
scripts/run_framework_tests.ps1
scripts/run_framework_tests.sh
```

This design allows the framework itself to be tested before any real application is onboarded.

## Future application onboarding

After Saga 1 reaches the generic framework milestone, a real application can add adapters such as:

```text
Create Application Record From Test Data
Delete Application Record By Test Identifier
Find Application Record By Test Identifier
```

Those adapters will consume the same builder/validator contracts rather than redefining the architecture.
