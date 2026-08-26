# Secrets and Secure Test Configuration

## Purpose

Version v0.21.0 establishes a secure runtime configuration contract for credentials, tokens, API keys, and other values that must never be committed to the repository.

## Configuration vs secrets

Normal configuration answers questions such as which environment is active, which browser should run, or which timeout should be used.

Secure configuration answers a different question:

**Which values must exist only at runtime and must never be stored in source control?**

## Core rules

1. Secrets never live in test scenarios.
2. Secrets never live in Page Objects.
3. Secrets never live in committed YAML values.
4. Runtime code requests secrets by name.
5. Required secrets fail fast when absent.
6. Secret values must never be written to logs.
7. Local execution supplies secrets through environment variables.
8. CI supplies secrets through protected secret stores.
9. Example files document secret names only.
10. Framework tests validate the contract without requiring real credentials.

## Runtime flow

Local execution:

Environment Variable → Secret Resolver → Framework Capability → Business/Test Execution

CI execution:

CI Secret Store → Environment Variable → Secret Resolver → Robot Framework

## Logging

The framework may log whether a named secret is configured, but must never log its value.

## GitHub Actions

Real application workflows may later expose repository or environment secrets as runtime environment variables:

```yaml
env:
  APP_PASSWORD: ${{ secrets.APP_PASSWORD }}
```

Framework capability tests must not require actual repository secrets to pass.

## Application-agnostic design

No HOT, BP WEB, or BHUB credentials, usernames, passwords, tokens, or private endpoints are introduced in Saga 1.
