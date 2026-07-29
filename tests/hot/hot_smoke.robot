*** Settings ***
Documentation    Validates that HOT is available and displays its initial page without known technical errors.
Resource         ../../resources/keywords/common.resource
Resource         ../../resources/keywords/hot_keywords.resource
Test Setup       Open Browser Session
Test Teardown    Close Browser Session
Force Tags       smoke    hot    critical

*** Test Cases ***
HOT Should Be Available
    [Documentation]    Confirms that HOT responds, opens the expected environment, and displays its initial page.
    Access HOT
    Validate HOT Initial Page
