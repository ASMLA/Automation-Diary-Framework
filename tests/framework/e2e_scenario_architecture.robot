*** Settings ***
Documentation    Framework-level checks for the v0.17 E2E orchestration contract.
Library          OperatingSystem

*** Variables ***
${E2E_TEMPLATE}    ${CURDIR}${/}..${/}templates${/}e2e_scenario_template.robot
${E2E_ORCHESTRATION}    ${CURDIR}${/}..${/}..${/}resources${/}keywords${/}business${/}templates${/}e2e_orchestration_template.resource

*** Test Cases ***
E2E Template Should Expose Business Journey Phases
    ${content}=    Get File    ${E2E_TEMPLATE}
    Should Contain    ${content}    Given The End To End Scenario Is Ready
    Should Contain    ${content}    When The Primary Business Action Is Executed
    Should Contain    ${content}    And The Cross Boundary Transition Is Completed
    Should Contain    ${content}    Then The End To End Business Outcome Should Be Available

E2E Template Should Own Setup And Cleanup
    ${content}=    Get File    ${E2E_TEMPLATE}
    Should Contain    ${content}    Test Setup       Prepare End To End Scenario
    Should Contain    ${content}    Test Teardown    Cleanup End To End Scenario

E2E Template Should Not Expose Low Level Implementation
    ${content}=    Get File    ${E2E_TEMPLATE}
    Should Not Contain    ${content}    xpath=
    Should Not Contain    ${content}    css=
    Should Not Contain    ${content}    Sleep
    Should Not Contain    ${content}    POST On Session
    Should Not Contain    ${content}    GET On Session

E2E Orchestration Should Define Explicit Transition And Verification
    ${content}=    Get File    ${E2E_ORCHESTRATION}
    Should Contain    ${content}    Execute Cross Boundary Transition
    Should Contain    ${content}    Verify End To End Business Outcome
    Should Contain    ${content}    Cleanup End To End Scenario
