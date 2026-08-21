*** Settings ***
Documentation    Framework-level checks for the v0.15 API + UI architecture.
Resource         ../../resources/keywords/business/templates/api_ui_flow_template.resource

*** Test Cases ***
API UI Business Template Should Preserve Scenario Context
    ${data}=    Create Dictionary    reference=AUTO_015
    ${prepared}=    Prepare Scenario Through API    ${data}
    Should Be Equal    ${prepared}[reference]    AUTO_015
    ${validated}=    Validate Scenario Through API    ${prepared}
    Should Be Equal    ${validated}[reference]    AUTO_015
