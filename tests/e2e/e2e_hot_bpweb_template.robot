*** Settings ***
Documentation    Initial template for the HOT to BP WEB to HOT integrated flow.
Resource         ../../resources/keywords/common/browser_keywords.resource
Resource         ../../resources/keywords/applications/hot_keywords.resource
Resource         ../../resources/keywords/applications/bpweb_keywords.resource
Test Setup       Open Browser Session
Test Teardown    Close Browser Session
Test Tags        e2e

*** Test Cases ***
Execute Integrated HOT And BP WEB Flow
    [Documentation]    Enable this scenario after stabilizing the individual application flows.
    Skip    End-to-End template waiting for validated locators, user profiles, and integrated test data.
