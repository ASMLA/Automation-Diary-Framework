# Automation Diary #021 — Secrets and Secure Test Configuration

**Version:** v0.21.0

## Goal

Introduce a secure runtime configuration capability that keeps credentials, tokens, API keys, and other sensitive values outside version-controlled automation code.

## Added

- Central secret resolver
- Optional and required secret access
- Fail-fast required-secret validation
- Secret-name validation
- Safe masking capability
- Secret-availability diagnostics without value exposure
- Example secret-name contract
- Framework-level security tests
- Secure configuration usage template
- Secure configuration architecture documentation

## Engineering decision

Configuration and secrets are separate concerns.

Normal configuration can be versioned when it is non-sensitive. Secrets must remain outside the repository and be supplied only at runtime through secure mechanisms.

## Result

The framework can now request sensitive runtime values through a centralized contract without hard-coding or logging them.

## Next

Automation Diary #022 — Reporting, Evidence, and Execution Observability
