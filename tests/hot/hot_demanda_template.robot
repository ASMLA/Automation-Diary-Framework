*** Settings ***
Documentation    Initial template for the HOT demand-creation flow.
Resource         ../../resources/keywords/common.resource
Resource         ../../resources/keywords/hot_keywords.resource
Test Setup       Open Browser Session
Test Teardown    Close Browser Session
Test Tags        hot    business-flow

*** Test Cases ***
Create Demand And Save As Draft
    [Documentation]    Enable this scenario after confirming authentication and the real application locators.
    Skip    Template waiting for validated locators, authentication, and test data.
