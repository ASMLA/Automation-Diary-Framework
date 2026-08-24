*** Settings ***
Documentation    Generic example of consuming framework configuration.
Resource         ../../resources/keywords/technical/configuration.resource
Force Tags       template    configuration

*** Test Cases ***
Configuration Usage Template
    ${environment}=    Resolve Environment Name
    ${browser}=    Resolve Browser Name
    ${headless}=    Resolve Headless Configuration
    Log    Environment=${environment}; Browser=${browser}; Headless=${headless}
