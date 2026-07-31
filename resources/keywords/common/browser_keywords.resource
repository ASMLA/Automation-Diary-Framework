*** Settings ***
Library     Browser
Resource    ../../variables/environment.resource

*** Keywords ***
Open Browser Session
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context    viewport={'width': 1440, 'height': 900}
    Set Browser Timeout    ${TIMEOUT}

Close Browser Session
    Take Screenshot
    Close Browser

Open Application
    [Arguments]    ${url}
    New Page    ${url}
    Wait For Load State    domcontentloaded

Validate Current URL
    [Arguments]    ${expected_url_fragment}
    Get Url    contains    ${expected_url_fragment}

Validate Page Has No Known Technical Error
    ${body_text}=    Get Text    body
    Should Not Contain    ${body_text}    Internal Server Error
    Should Not Contain    ${body_text}    500 Server Error
    Should Not Contain    ${body_text}    Application Error

Access Application And Validate Health
    [Documentation]    Opens an application and performs the reusable environment health checks.
    [Arguments]    ${url}    ${expected_url_fragment}
    Open Application    ${url}
    Validate Current URL    ${expected_url_fragment}
    Validate Page Has No Known Technical Error

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
