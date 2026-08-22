*** Settings ***
Documentation    Application-agnostic example of a readable business scenario.
Resource         ../../resources/keywords/business/templates/readable_business_flow_template.resource
Force Tags       template    readability

*** Test Cases ***
Created Record Should Be Available For Validation
    [Documentation]    The scenario exposes business intent while implementation details remain in reusable layers.
    Given A Valid Record Is Prepared
    When The Record Is Submitted
    Then The Record Should Be Available For Validation
