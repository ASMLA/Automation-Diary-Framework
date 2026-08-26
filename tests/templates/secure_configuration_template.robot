*** Settings ***
Documentation    Generic example showing safe runtime secret consumption.
Resource         ../../resources/keywords/technical/secrets.resource
Force Tags       template    security

*** Test Cases ***
Secure Configuration Usage Template
    ${configured}=    Log Secret Availability    EXAMPLE_RUNTIME_SECRET
    Should Be True    isinstance($configured, bool)
