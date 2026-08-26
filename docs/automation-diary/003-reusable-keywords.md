# Automation Diary #003 — Building Reusable Keywords Instead of Duplicated Code

## Building Reusable Keywords Instead of Duplicated Code

### Summary
The third milestone refactors repeated smoke-test behavior into reusable technical and business keywords while preserving the existing project structure.

### Problem
HOT, BP WEB, and BHUB repeated the same sequence to:

- Open the application
- Validate the expected environment URL
- Check the page for known technical errors
- Confirm that the initial page element is visible

The smoke tests also repeated the same two-step business flow: access the application and validate its initial page.

### Changes

- Added `Access Application And Validate Health` to centralize shared application health checks.
- Added `Validate Application Initial Page` to reuse the initial-page visibility validation.
- Added application-level business keywords:
  - `Validate HOT Availability`
  - `Validate BP WEB Availability`
  - `Validate BHUB Availability`
- Refactored the three smoke tests to call one readable business keyword each.
- Preserved application-specific keywords as wrappers around the shared behavior.

### Engineering Decision
The framework now separates reusable technical behavior from readable business intent.

The common resource owns generic browser and health-check behavior. Application keyword files keep the language of each system. Tests describe the expected business outcome without duplicating implementation details.

This follows the DRY principle without creating a new folder structure or introducing unrelated architectural changes.

### Before

```robot
Access HOT
Validate HOT Initial Page
```

### After

```robot
Validate HOT Availability
```

The same reusable pattern is applied to BP WEB and BHUB.

### Benefits

- Less duplicated code
- Shorter and more readable smoke tests
- One place to maintain shared health-check behavior
- Consistent validation across all three applications
- Easier expansion when new applications are added

### Next Milestone
Automation Diary #004 — The Importance of a Clean Project Structure
