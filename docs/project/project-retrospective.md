# Project Retrospective

## Sprint 1 — Framework Foundation

## Sprint goal

Build a maintainable automation foundation for HOT, BP WEB, and BHUB before investing in complete business-flow coverage.

## Result

The sprint delivered a documented and executable framework foundation with clear responsibilities, reusable behavior, independent Smoke Tests, an explicit locator strategy, and cross-platform setup guidance.

## Engineering decisions

| Decision | Reason | Outcome |
|---|---|---|
| Plan before automating business flows | Reduce architectural rework | Clear roadmap and framework boundaries |
| Start with Smoke Tests | Obtain fast environment feedback | Independent health checks for all three systems |
| Centralize reusable behavior | Apply DRY and improve consistency | Shared technical and business keywords |
| Organize by responsibility | Reduce navigation and onboarding cost | Clear directories for pages, keywords, variables, data, tests, scripts, and docs |
| Define locator priorities | Reduce flaky-test risk | Explicit selector engines and controlled fallback resolution |
| Treat documentation as part of delivery | Reduce dependence on tribal knowledge | Onboarding, execution, troubleshooting, and contribution guides |
| Use feature branches and Pull Requests | Preserve a stable main branch | Traceable version history for each episode |

## What worked well

- Small milestones kept changes reviewable.
- Versioned episodes made architectural evolution traceable.
- The Git workflow protected the main branch.
- The README became a useful project entry point.
- Real installation issues were converted into troubleshooting documentation.

## Challenges

- Corporate environments require VPN or authorized network access.
- Authentication and real business flows are not yet implemented.
- Some locator contracts still depend on confirming the authenticated DOM.
- Local setup requires both Python and Node.js because Browser Library uses Playwright.

## Improvement opportunities

- Add automated checks for broken resource imports.
- Add documentation-link validation.
- Introduce environment configuration through secure runtime variables.
- Define business-flow acceptance criteria before implementation.
- Add CI execution once access constraints are understood.

## Sprint conclusion

Sprint 1 achieved its intended goal: create a foundation that can grow without forcing every future feature to redesign the framework.

The next phase should preserve these boundaries while adding real business functionality.
