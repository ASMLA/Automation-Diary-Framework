*** Settings ***
Resource    ../../../pages/common/base_page.resource

*** Keywords ***
Validate Application Availability
    [Documentation]    Business-readable availability flow. It contains no selector engine or Browser Library command.
    [Arguments]    ${url}    ${expected_url_fragment}    ${page_root}
    Open Application Page And Validate Health    ${url}    ${expected_url_fragment}
    Validate Application Root Is Visible    ${page_root}
