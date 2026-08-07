*** Settings ***
Documentation    Validates that BP WEB is available and displays its initial page without known technical errors.
Resource         ../../resources/suites/smoke_suite.resource
Resource         ../../resources/keywords/business/applications/bpweb_business.resource
Test Setup       Prepare Smoke Test
Test Teardown    Finish Smoke Test
Force Tags       smoke    bpweb    critical

*** Test Cases ***
BP WEB Should Be Available
    [Documentation]    Confirms that BP WEB responds, opens the expected environment, and displays its initial page.
    Validate BP WEB Availability
