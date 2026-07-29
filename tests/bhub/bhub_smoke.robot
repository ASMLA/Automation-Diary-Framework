*** Settings ***
Documentation    Validates that BHUB is available and displays its initial page without known technical errors.
Resource         ../../resources/keywords/common.resource
Resource         ../../resources/keywords/bhub_keywords.resource
Test Setup       Open Browser Session
Test Teardown    Close Browser Session
Force Tags       smoke    bhub    critical

*** Test Cases ***
BHUB Should Be Available
    [Documentation]    Confirms that BHUB responds, opens the expected environment, and displays its initial page.
    Access BHUB
    Validate BHUB Initial Page
