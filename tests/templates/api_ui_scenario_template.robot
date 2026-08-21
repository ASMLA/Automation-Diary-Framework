*** Settings ***
Documentation    Application-agnostic template for combining API setup with UI validation.
Resource         ../../resources/keywords/business/templates/api_ui_flow_template.resource
Force Tags       template    api    ui    integration

*** Test Cases ***
API And UI Scenario Template
    ${data}=    Create Dictionary    reference=AUTO_TEMPLATE
    ${prepared}=    Prepare Scenario Through API    ${data}
    Should Be Equal    ${prepared}[reference]    AUTO_TEMPLATE
    ${validated}=    Validate Scenario Through API    ${prepared}
    Should Be Equal    ${validated}[reference]    AUTO_TEMPLATE
