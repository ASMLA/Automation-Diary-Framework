# Automation Diary #005 — Choosing the Right Locator Strategy

## Objective

The goal of this milestone is to make locator decisions explicit, predictable, and maintainable before larger business flows are automated.

A test can be logically correct and still become unreliable when it depends on unstable selectors. Dynamic classes, long XPath expressions, ambiguous text, and DOM position are common causes of flaky UI tests.

## Locator priority

The framework now follows this order of preference:

1. **Stable automation attributes**, such as `data-testid`, `data-qa`, or another contract agreed with development.
2. **Accessible role and name**, when the component exposes a stable semantic identity.
3. **Stable native attributes**, such as a durable `name`, `id`, or input type.
4. **Exact visible text**, only when the product language and wording are controlled.
5. **Explicit CSS**, for stable structural elements such as the application root.
6. **XPath**, only as a documented last resort.

## What changed

- Every current locator now declares its selector engine explicitly.
- Generic `body` selectors were renamed to application page-root locators.
- HOT title-field alternatives were separated into primary and fallback locators.
- A reusable `Get First Visible Locator` keyword now resolves ordered fallback candidates.
- Ambiguous combined CSS selectors were removed.
- Page resource files now document the locator rules beside the selectors.

## Why combined selectors were removed

The previous title locator used two CSS alternatives in a single value:

```robot
input[name="title"], input[id*="title"]
```

Although concise, it hides which locator matched and makes failures harder to diagnose. The new implementation keeps the candidates separate and evaluates them in a defined order.

## Flaky-test prevention rules

- Do not use generated class names.
- Do not anchor locators to DOM position such as `div:nth-child(4)`.
- Do not use long absolute XPath expressions.
- Do not use broad text selectors when multiple elements can match.
- Wait for the element state required by the action.
- Prefer one stable application contract over multiple clever fallbacks.
- Treat fallbacks as temporary and document why they exist.

## Current limitation

The corporate applications must be inspected while authenticated before final `data-testid`, role, or native-attribute locators can be confirmed. The smoke tests continue to use explicit `css=body` roots because no stable application-specific authenticated element has yet been validated.

This is intentional: locator quality must be based on the real DOM, not invented selectors.

## Result

The framework now has a documented locator hierarchy, explicit selector engines, controlled fallback behavior, and a clearer path for replacing provisional selectors with stable application contracts.
