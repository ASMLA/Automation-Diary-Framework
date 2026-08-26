*** Settings ***
Documentation    Framework-level checks for the v0.21 secure configuration contract.
Library          OperatingSystem
Resource         ../../resources/keywords/technical/secrets.resource

*** Test Cases ***
Optional Secret Should Return Safe Default
    Remove Environment Variable    FRAMEWORK_OPTIONAL_SECRET
    ${value}=    Get Optional Secret    FRAMEWORK_OPTIONAL_SECRET
    Should Be Equal    ${value}    ${SECRET_NOT_CONFIGURED}

Required Secret Should Fail When Missing
    Remove Environment Variable    FRAMEWORK_REQUIRED_SECRET
    ${status}    ${message}=    Run Keyword And Ignore Error
    ...    Get Required Secret    FRAMEWORK_REQUIRED_SECRET
    Should Be Equal    ${status}    FAIL
    Should Contain    ${message}    is not configured

Required Secret Should Resolve Runtime Value
    Set Environment Variable    FRAMEWORK_REQUIRED_SECRET    runtime-value
    ${value}=    Get Required Secret    FRAMEWORK_REQUIRED_SECRET
    Should Be Equal    ${value}    runtime-value
    [Teardown]    Remove Environment Variable    FRAMEWORK_REQUIRED_SECRET

Secret Mask Should Not Reveal Value
    ${masked}=    Mask Secret    super-secret-value
    Should Be Equal    ${masked}    ***
    Should Not Contain    ${masked}    super-secret-value

Secret Names Should Follow Environment Convention
    Validate Secret Name    API_TOKEN
    ${status}    ${message}=    Run Keyword And Ignore Error
    ...    Validate Secret Name    invalid-secret-name
    Should Be Equal    ${status}    FAIL
