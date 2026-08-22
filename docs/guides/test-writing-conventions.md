# Test Writing Conventions

Use this checklist when adding or reviewing Robot Framework scenarios.

## Naming

- Name tests after behavior or outcome.
- Name keywords after business intent.
- Use meaningful variables and named fields.

## Structure

- Keep scenarios short and focused on one behavior.
- Use `Given / When / Then / And` when explicit phases improve readability.
- Keep setup and cleanup outside the main scenario when they are not part of the behavior under test.

## Boundaries

- Tests call Business Keywords.
- Business Keywords orchestrate Page Objects, API capabilities, and data capabilities.
- Page Objects own selectors and UI mechanics.
- Technical resources own browser, synchronization, logging, and transport details.

## Avoid in tests

- CSS/XPath selectors;
- direct browser mechanics;
- direct HTTP mechanics;
- fixed `Sleep` calls;
- credentials or secrets;
- unexplained magic values;
- dependencies on another test.

## Review question

A reviewer should be able to answer "what behavior is being validated?" by reading the test case alone.
