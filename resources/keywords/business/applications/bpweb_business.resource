*** Settings ***
Resource    ../common/application_health.resource
Resource    ../../../variables/environment.resource
Resource    ../../../pages/applications/bpweb_page.resource

*** Keywords ***
Validate BP WEB Availability
    [Documentation]    Business intent for the current BP WEB Smoke Test. No direct Browser Library command is used here.
    Validate Application Availability    ${BPWEB_URL}    ${BPWEB_URL_FRAGMENT}    ${BPWEB_PAGE_ROOT}

Open Group Menu
    Click BP WEB Group Menu On Page

Add New Simulation
    Click BP WEB Add Simulation On Page
