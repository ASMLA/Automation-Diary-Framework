*** Settings ***
Library     Browser
Resource    ../variables/environment.resource

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
