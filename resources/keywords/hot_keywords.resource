*** Settings ***
Library     Browser
Resource    common.resource
Resource    ../variables/environment.resource
Resource    ../pages/hot_page.resource

*** Keywords ***
Access HOT
    Access Application And Validate Health    ${HOT_URL}    hotcorphml.globalhitss.com.br

Validate HOT Initial Page
    Validate Application Initial Page    ${HOT_BODY}

Validate HOT Availability
    [Documentation]    Validates the complete HOT smoke-test business behavior using reusable keywords.
    Access HOT
    Validate HOT Initial Page

Start Demand Creation
    [Arguments]    ${title}
    Wait For Elements State    ${HOT_DEMAND_TITLE}    visible
    Fill Text    ${HOT_DEMAND_TITLE}    ${title}

Save Demand As Draft
    Click    ${HOT_SAVE_DRAFT}

Submit Demand To Next Phase
    Click    ${HOT_SUBMIT}
