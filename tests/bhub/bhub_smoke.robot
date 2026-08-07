*** Settings ***
Documentation    Validates that BHUB is available and displays its initial page without known technical errors.
Resource         ../../resources/suites/smoke_suite.resource
Resource         ../../resources/keywords/business/applications/bhub_business.resource
Test Setup       Prepare Smoke Test
Test Teardown    Finish Smoke Test
Force Tags       smoke    bhub    critical

*** Test Cases ***
BHUB Should Be Available
    [Documentation]    Confirms that BHUB responds, opens the expected environment, and displays its initial page.
    Validate BHUB Availability
