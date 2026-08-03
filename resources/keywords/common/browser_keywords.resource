*** Settings ***
Library     Browser
Resource    ../../variables/environment.resource
Resource    ../../variables/validation.resource

*** Keywords ***
Open Browser Session
    [Documentation]    Opens an isolated browser context using the central execution configuration.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': 1440, 'height': 900}
    Set Browser Timeout    ${TIMEOUT}

Close Browser Session
    [Documentation]    Captures evidence when possible and closes the browser without masking the original test result.
    Run Keyword And Ignore Error    Take Screenshot
    Run Keyword And Ignore Error    Close Browser

Open Application
    [Arguments]    ${url}
    New Page    ${url}
    Wait For Load State    domcontentloaded

Validate Current URL
    [Arguments]    ${expected_url_fragment}
    Get Url    contains    ${expected_url_fragment}

Validate Page Has No Known Technical Errors
    [Documentation]    Checks the rendered page against the centrally maintained technical-error catalog.
    ${body_text}=    Get Text    body
    FOR    ${error_message}    IN    @{KNOWN_TECHNICAL_ERRORS}
        Should Not Contain    ${body_text}    ${error_message}
    END

Validate Page Has No Known Technical Error
    [Documentation]    Backward-compatible alias maintained while suites migrate to the plural keyword.
    Validate Page Has No Known Technical Errors

Access Application And Validate Health
    [Documentation]    Opens an application and performs the reusable environment health checks.
    [Arguments]    ${url}    ${expected_url_fragment}
    Open Application    ${url}
    Validate Current URL    ${expected_url_fragment}
    Validate Page Has No Known Technical Errors

Validate Application Initial Page
    [Documentation]    Confirms that the application's stable page-root locator is visible.
    [Arguments]    ${page_locator}
    Wait For Elements State    ${page_locator}    visible

Get First Visible Locator
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
