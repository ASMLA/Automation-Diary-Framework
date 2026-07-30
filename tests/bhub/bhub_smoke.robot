*** Settings ***
Documentation    Validates that BHUB is available and displays its initial page without known technical errors.
Resource         ../../resources/keywords/common/browser_keywords.resource
Resource         ../../resources/keywords/applications/bhub_keywords.resource
Test Setup       Open Browser Session
Test Teardown    Close Browser Session
Force Tags       smoke    bhub    critical

*** Test Cases ***
BHUB Should Be Available
    [Documentation]    Confirms that BHUB responds, opens the expected environment, and displays its initial page.
    Validate BHUB Availability
