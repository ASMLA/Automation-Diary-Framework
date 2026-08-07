*** Settings ***
Resource    ../common/application_health.resource
Resource    ../../../variables/environment.resource
Resource    ../../../pages/applications/hot_page.resource

*** Keywords ***
Validate HOT Availability
    [Documentation]    Business intent for the current HOT Smoke Test. No direct Browser Library command is used here.
    Validate Application Availability    ${HOT_URL}    ${HOT_URL_FRAGMENT}    ${HOT_PAGE_ROOT}

Start Demand Creation
    [Documentation]    Existing sample business keyword preserved while UI implementation is delegated to the Page Object layer.
    [Arguments]    ${title}
    Fill HOT Demand Title On Page    ${title}

Save Demand As Draft
    Click HOT Save Draft On Page

Submit Demand To Next Phase
    Click HOT Submit On Page
