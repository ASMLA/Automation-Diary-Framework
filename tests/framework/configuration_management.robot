*** Settings ***
Documentation    Framework-level checks for the v0.19 configuration capability.
Resource         ../../resources/keywords/technical/configuration.resource

*** Test Cases ***
Default Environment Should Be Available
    ${environment}=    Resolve Environment Name
    Should Not Be Empty    ${environment}

Default Browser Should Be Available
    ${browser}=    Resolve Browser Name
    Should Not Be Empty    ${browser}

Headless Configuration Should Resolve To Boolean
    ${headless}=    Resolve Headless Configuration
    Should Be True    isinstance($headless, bool)

API Timeout Should Resolve To Number
    ${timeout}=    Resolve API Timeout
    Should Be True    isinstance($timeout, (int, float))

Optional Configuration Should Return Default
    ${value}=    Get Configuration Value    NON_EXISTENT_FRAMEWORK_SETTING    fallback
    Should Be Equal    ${value}    fallback
