*** Settings ***
Library     Browser
Resource    ../common/browser_keywords.resource
Resource    ../../variables/environment.resource
Resource    ../../pages/hot_page.resource

*** Keywords ***
Access HOT
    Access Application And Validate Health    ${HOT_URL}    hotcorphml.globalhitss.com.br

Validate HOT Initial Page
    Validate Application Initial Page    ${HOT_PAGE_ROOT}

Validate HOT Availability
    [Documentation]    Validates the complete HOT smoke-test business behavior using reusable keywords.
    Access HOT
    Validate HOT Initial Page

Start Demand Creation
    [Arguments]    ${title}
    ${title_locator}=    Get First Visible Locator
    ...    ${HOT_DEMAND_TITLE_PRIMARY}
    ...    ${HOT_DEMAND_TITLE_FALLBACK}
    Fill Text    ${title_locator}    ${title}

Save Demand As Draft
    Click    ${HOT_SAVE_DRAFT}

Submit Demand To Next Phase
    Click    ${HOT_SUBMIT}
