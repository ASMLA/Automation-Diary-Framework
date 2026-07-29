*** Settings ***
Library     Browser
Resource    common.resource
Resource    ../variables/environment.resource
Resource    ../pages/bpweb_page.resource

*** Keywords ***
Access BP WEB
    Open Application    ${BPWEB_URL}
    Validate Current URL    bpwebhml.globalhitss.com.br
    Validate Page Has No Known Technical Error

Validate BP WEB Initial Page
    Wait For Elements State    ${BPWEB_BODY}    visible

Open Group Menu
    Click    ${BPWEB_GROUP_MENU}

Add New Simulation
    Click    ${BPWEB_ADD_SIMULATION}
