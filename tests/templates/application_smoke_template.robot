*** Settings ***
Documentation    Generic future-application smoke template.
Resource         ../../resources/suites/scalable_suite.resource
Suite Setup      Prepare Scalable Test Suite
Suite Teardown   Finish Scalable Test Suite
Force Tags       template    smoke
*** Test Cases ***
Application Health Template
    No Operation
