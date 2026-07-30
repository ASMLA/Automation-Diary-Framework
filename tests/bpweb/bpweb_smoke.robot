*** Settings ***
Documentation    Validates that BP WEB is available and displays its initial page without known technical errors.
Resource         ../../resources/keywords/common.resource
Resource         ../../resources/keywords/bpweb_keywords.resource
Test Setup       Open Browser Session
Test Teardown    Close Browser Session
Force Tags       smoke    bpweb    critical

*** Test Cases ***
BP WEB Should Be Available
    [Documentation]    Confirms that BP WEB responds, opens the expected environment, and displays its initial page.
    Validate BP WEB Availability
