*** Settings ***
Library     Browser
Resource    common.resource
Resource    ../variables/environment.resource
Resource    ../pages/bpweb_page.resource

*** Keywords ***
Access BP WEB
    Access Application And Validate Health    ${BPWEB_URL}    bpwebhml.globalhitss.com.br

Validate BP WEB Initial Page
    Validate Application Initial Page    ${BPWEB_BODY}

Validate BP WEB Availability
    [Documentation]    Validates the complete BP WEB smoke-test business behavior using reusable keywords.
    Access BP WEB
    Validate BP WEB Initial Page

Open Group Menu
    Click    ${BPWEB_GROUP_MENU}

Add New Simulation
    Click    ${BPWEB_ADD_SIMULATION}
