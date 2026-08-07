*** Settings ***
Resource    ../keywords/technical/browser_keywords.resource

*** Keywords ***
Prepare Smoke Test
    [Documentation]    Creates the isolated browser session used by every Smoke Test.
    Open Browser Session

Finish Smoke Test
    [Documentation]    Collects evidence and safely closes the Smoke Test browser session.
    Close Browser Session
