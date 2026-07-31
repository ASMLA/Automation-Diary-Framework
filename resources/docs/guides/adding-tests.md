# How to Add a Test

## Goal

Add tests without placing locators, technical browser operations, and business intent in the same file.

## Decision sequence

Before creating code, answer:

1. Which application owns the behavior?
2. Is the behavior shared or application-specific?
3. Does the locator already exist?
4. Is the test data fixed, environment-specific, or scenario-specific?
5. Which tags should identify the suite?

## 1. Add or confirm page locators

Place application locators in:

```text
resources/pages/<application>_page.resource
```

Use the documented priority:

1. Stable automation attribute
2. Accessible role and name
3. Stable `id` or `name`
4. Exact visible text
5. Explicit CSS
6. XPath only as a documented last resort

Do not invent `data-testid` values that are not present in the application.

## 2. Add application behavior

Place readable business or application behavior in:

```text
resources/keywords/applications/<application>_keywords.resource
```

Example:

```robot
Validate Demand Form Is Ready
    Wait For Elements State    ${HOT_DEMAND_TITLE_PRIMARY}    visible
```

## 3. Reuse shared technical behavior

Generic browser behavior belongs in:

```text
resources/keywords/common/browser_keywords.resource
```

Only add a shared keyword when multiple applications genuinely share the same responsibility.

## 4. Add test data

Reusable external data belongs in `data/`. Do not store credentials in the repository. Secrets should later be supplied through environment variables or a secure CI/CD secret store.

## 5. Create the test

Place the suite under the correct application folder:

```text
tests/hot/
tests/bpweb/
tests/bhub/
tests/e2e/
```

Keep the test focused on intent:

```robot
*** Test Cases ***
Demand Form Should Be Ready
    [Tags]    regression    hot
    Validate Demand Form Is Ready
```

## 6. Execute the smallest scope

Run the application suite first, then the broader regression or Smoke Test set.

## 7. Update documentation

When behavior, architecture, setup, or execution changes, update at least one of:

- `README.md`
- `CHANGELOG.md`
- Architecture or getting-started guides
- The current Automation Diary episode

## Review checklist

- Test name explains the expected behavior
- Appropriate tags are present
- No locator is declared inside the test
- No duplicated technical sequence was introduced
- Locator choice follows the strategy
- No credentials or secrets were committed
- Focused test execution completed
- Documentation and changelog updated
