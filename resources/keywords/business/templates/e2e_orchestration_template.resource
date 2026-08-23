*** Settings ***
Documentation    Generic E2E orchestration contract. Application-specific implementations should compose existing business capabilities.

*** Keywords ***
Prepare End To End Scenario
    [Documentation]    Prepares only the state required by the business journey.
    Set Test Variable    ${E2E_RECORD_REFERENCE}    AUTO_E2E_TEMPLATE
    Set Test Variable    ${E2E_TRANSITION_COMPLETED}    ${False}

Execute Primary Business Action
    [Documentation]    Represents the business action that starts the integrated journey.
    Should Be Equal    ${E2E_RECORD_REFERENCE}    AUTO_E2E_TEMPLATE

Execute Cross Boundary Transition
    [Documentation]    Represents a meaningful transition between applications, services, or business states.
    Set Test Variable    ${E2E_TRANSITION_COMPLETED}    ${True}

Verify End To End Business Outcome
    [Documentation]    Validates the observable outcome after the integrated journey completes.
    Should Be True    ${E2E_TRANSITION_COMPLETED}

Cleanup End To End Scenario
    [Documentation]    Provides an explicit cleanup boundary for data created by the journey.
    Set Test Variable    ${E2E_RECORD_REFERENCE}    ${None}
