*** Settings ***
Documentation    Initial template for the HOT demand-creation flow.
Resource         ../../resources/suites/smoke_suite.resource
Resource         ../../resources/keywords/business/applications/hot_business.resource
Test Setup       Prepare Smoke Test
Test Teardown    Finish Smoke Test
Test Tags        hot    business-flow

*** Test Cases ***
Create Demand And Save As Draft
    [Documentation]    Enable this scenario after confirming authentication and the real application locators.
    Skip    Template waiting for validated locators, authentication, and test data.
