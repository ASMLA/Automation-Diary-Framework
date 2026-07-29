*** Settings ***
Library     Browser
Resource    common.resource
Resource    ../variables/environment.resource
Resource    ../pages/hot_page.resource

*** Keywords ***
Access HOT
    Open Application    ${HOT_URL}
    Validate Current URL    hotcorphml.globalhitss.com.br
    Validate Page Has No Known Technical Error

Validate HOT Initial Page
    Wait For Elements State    ${HOT_BODY}    visible

Start Demand Creation
    [Arguments]    ${title}
    Wait For Elements State    ${HOT_DEMAND_TITLE}    visible
    Fill Text    ${HOT_DEMAND_TITLE}    ${title}

Save Demand As Draft
    Click    ${HOT_SAVE_DRAFT}

Submit Demand To Next Phase
    Click    ${HOT_SUBMIT}
