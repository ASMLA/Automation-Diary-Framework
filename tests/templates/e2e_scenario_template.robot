*** Settings ***
Documentation    Application-agnostic E2E scenario template organized by business phases.
Resource         ../../resources/keywords/business/templates/e2e_orchestration_template.resource
Test Setup       Prepare End To End Scenario
Test Teardown    Cleanup End To End Scenario
Force Tags       template    e2e

*** Test Cases ***
Critical Business Journey Should Complete Across Boundaries
    [Documentation]    The scenario exposes orchestration and expected behavior without leaking technical implementation.
    Given The End To End Scenario Is Ready
    When The Primary Business Action Is Executed
    And The Cross Boundary Transition Is Completed
    Then The End To End Business Outcome Should Be Available

*** Keywords ***
The End To End Scenario Is Ready
    Should Be Equal    ${E2E_RECORD_REFERENCE}    AUTO_E2E_TEMPLATE

The Primary Business Action Is Executed
    Execute Primary Business Action

The Cross Boundary Transition Is Completed
    Execute Cross Boundary Transition

The End To End Business Outcome Should Be Available
    Verify End To End Business Outcome
