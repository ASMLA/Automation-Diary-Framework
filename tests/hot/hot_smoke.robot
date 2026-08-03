*** Settings ***
Documentation    Validates that HOT is available and displays its initial page without known technical errors.
Resource         ../../resources/suites/smoke_suite.resource
Resource         ../../resources/keywords/applications/hot_keywords.resource
Test Setup       Prepare Smoke Test
Test Teardown    Finish Smoke Test
Force Tags       smoke    hot    critical

*** Test Cases ***
HOT Should Be Available
    [Documentation]    Confirms that HOT responds, opens the expected environment, and displays its initial page.
    Validate HOT Availability
