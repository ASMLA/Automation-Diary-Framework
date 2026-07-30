*** Settings ***
Library     Browser
Resource    ../common/browser_keywords.resource
Resource    ../../variables/environment.resource
Resource    ../../pages/bhub_page.resource

*** Keywords ***
Access BHUB
    Access Application And Validate Health    ${BHUB_URL}    bhubhml.globalhitss.com.br

Validate BHUB Initial Page
    Validate Application Initial Page    ${BHUB_BODY}

Validate BHUB Availability
    [Documentation]    Validates the complete BHUB smoke-test business behavior using reusable keywords.
    Access BHUB
    Validate BHUB Initial Page
