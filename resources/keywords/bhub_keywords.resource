*** Settings ***
Library     Browser
Resource    common.resource
Resource    ../variables/environment.resource
Resource    ../pages/bhub_page.resource

*** Keywords ***
Access BHUB
    Open Application    ${BHUB_URL}
    Validate Current URL    bhubhml.globalhitss.com.br
    Validate Page Has No Known Technical Error

Validate BHUB Initial Page
    Wait For Elements State    ${BHUB_BODY}    visible
