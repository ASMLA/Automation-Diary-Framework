*** Settings ***
Resource    ../common/application_health.resource
Resource    ../../../variables/environment.resource
Resource    ../../../pages/applications/bhub_page.resource

*** Keywords ***
Validate BHUB Availability
    [Documentation]    Business intent for the current BHUB Smoke Test. No direct Browser Library command is used here.
    Validate Application Availability    ${BHUB_URL}    ${BHUB_URL_FRAGMENT}    ${BHUB_PAGE_ROOT}
