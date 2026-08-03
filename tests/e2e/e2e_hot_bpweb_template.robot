*** Settings ***
Documentation    Initial template for the HOT to BP WEB to HOT integrated flow.
Resource         ../../resources/suites/smoke_suite.resource
Resource         ../../resources/keywords/applications/hot_keywords.resource
Resource         ../../resources/keywords/applications/bpweb_keywords.resource
Test Setup       Prepare Smoke Test
Test Teardown    Finish Smoke Test
Test Tags        e2e

*** Test Cases ***
Execute Integrated HOT And BP WEB Flow
    [Documentation]    Enable this scenario after stabilizing the individual application flows.
    Skip    End-to-End template waiting for validated locators, user profiles, and integrated test data.
