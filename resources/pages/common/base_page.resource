*** Settings ***
Library     Browser
Resource    ../../keywords/technical/browser_keywords.resource

*** Keywords ***
Open Application Page And Validate Health
    [Documentation]    Page-layer operation that opens an application, validates its URL, and checks known technical failures.
    [Arguments]    ${url}    ${expected_url_fragment}
    New Page    ${url}
    Wait For Load State    domcontentloaded
    Get Url    contains    ${expected_url_fragment}
    Validate Page Has No Known Technical Errors

Validate Application Root Is Visible
    [Documentation]    Page-layer assertion that a stable application root is visible.
    [Arguments]    ${page_locator}
    Wait For Elements State    ${page_locator}    visible

Get First Visible Page Locator
    [Documentation]    Returns the first visible locator from an ordered primary-to-fallback list.
    [Arguments]    @{locators}
    FOR    ${locator}    IN    @{locators}
        ${is_visible}=    Run Keyword And Return Status
        ...    Wait For Elements State    ${locator}    visible    timeout=2s
        IF    ${is_visible}
            RETURN    ${locator}
        END
    END
    Fail    None of the candidate locators became visible: ${locators}
