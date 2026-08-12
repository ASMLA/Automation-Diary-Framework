*** Settings ***
Documentation    Framework-level checks for the v0.11 anti-flakiness policy. No browser or real application is required.
Library          OperatingSystem
Resource         ../../resources/variables/resilience.resource

*** Test Cases ***
Central Timeout Policy Should Be Defined
    Should Not Be Empty    ${DEFAULT_UI_TIMEOUT}
    Should Not Be Empty    ${SHORT_UI_TIMEOUT}
    Should Not Be Empty    ${LONG_UI_TIMEOUT}
    Should Not Be Empty    ${READ_RETRY_TIMEOUT}
    Should Not Be Empty    ${READ_RETRY_INTERVAL}

Synchronization Resource Should Not Use Fixed Sleep
    ${content}=    Get File    ${CURDIR}${/}..${/}..${/}resources${/}keywords${/}technical${/}synchronization.resource
    Should Not Contain    ${content}    Sleep

Retry Policy Should Be Explicitly Read Only
    ${content}=    Get File    ${CURDIR}${/}..${/}..${/}resources${/}keywords${/}technical${/}synchronization.resource
    Should Contain    ${content}    Retry Read Only Check
    Should Contain    ${content}    Never wrap create/update/delete actions
