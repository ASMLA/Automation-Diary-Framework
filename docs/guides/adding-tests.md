# How to Add a Test

## Goal

Add tests without mixing scenario intent, business rules, page implementation, and technical browser behavior.

## Required flow

```text
Test
  -> Business Keyword
    -> Page Object
      -> Browser Library / technical utility
```

## 1. Decide the scenario

The test file owns the scenario name, tags, expected result, and scenario-level assertions. It must not contain selectors or direct Browser Library commands.

## 2. Add or reuse a Business Keyword

Business behavior belongs under:

```text
resources/keywords/business/
```

Use `applications/` for an onboarded application and `templates/` only as architectural examples.

Business Keywords must describe intent and orchestrate Page Object operations. Do not add CSS, XPath, `Click`, `Fill Text`, or low-level waits here.

## 3. Add or reuse a Page Object

UI contracts belong under:

```text
resources/pages/
```

Page Objects own:

- locators;
- field interactions;
- buttons and links;
- page-level waits;
- element reads.

Locator priority remains:

1. Stable automation attribute
2. Accessible role and name
3. Stable `id` or `name`
4. Exact visible text
5. Explicit CSS
6. XPath only as a documented last resort

Do not invent `data-testid` values that do not exist in the real application.

## 4. Use technical utilities only for cross-cutting behavior

Shared technical behavior belongs under:

```text
resources/keywords/technical/
```

Examples include browser-session lifecycle and technical-error validation. Do not move business rules into this layer.

## 5. Add test data

Reusable external data belongs in `data/`. Credentials must never be committed. The dedicated test-data management architecture will be introduced in Automation Diary #010.

## 6. Create the test

Keep the test focused on intent:

```robot
*** Test Cases ***
Example Business Behavior Should Succeed
    Execute Example Business Action
```

The framework templates demonstrate the structure without representing a real system.

## 7. Execute the smallest scope

Run the focused suite first, then the broader Smoke or regression scope.

## 8. Update documentation

When architecture, behavior, setup, or execution changes, update the relevant README, CHANGELOG, architecture guide, and Automation Diary document.

## Review checklist

- Test describes behavior, not UI implementation
- Test contains no locator
- Test contains no direct Browser Library command
- Business Keyword contains no locator
- Business Keyword contains no direct `Click` or `Fill Text`
- Page Object owns the UI interaction
- Technical utilities remain cross-cutting only
- Locator follows the project strategy
- No credentials or secrets were committed
- Focused execution was completed
- Documentation and changelog were updated


## Test data ownership — v0.10.0

Do not generate random values directly inside business tests. Use the framework Test Data Management layer:

- `resources/data/generators/` for runtime unique values;
- `resources/data/builders/` for complete data objects;
- `resources/data/validators/` for precondition validation;
- `resources/data/cleanup/` for disposable-data tracking;
- `data/` for declarative templates, references, and environment policies.

Application-specific creation/deletion adapters must be added only when a real system is onboarded.
