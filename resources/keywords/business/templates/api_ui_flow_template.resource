*** Settings ***
Documentation    Generic contract showing how API setup can support a UI business scenario.
Resource         ../../technical/logging.resource

*** Keywords ***
Prepare Scenario Through API
    [Documentation]    Template business keyword. Real application adapters will create the required state through API.
    [Arguments]    ${scenario_data}
    Log Framework Info    Preparing scenario state through API    capability=api-ui
    RETURN    ${scenario_data}

Validate Scenario Through API
    [Documentation]    Template business keyword. Real application adapters will validate backend state after UI execution.
    [Arguments]    ${scenario_reference}
    Log Framework Info    Validating scenario state through API    capability=api-ui
    RETURN    ${scenario_reference}
