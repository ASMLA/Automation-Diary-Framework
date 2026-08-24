*** Settings ***
Documentation    Framework-level checks for the v0.18 automation metrics capability.
Resource         ../../resources/keywords/technical/metrics.resource

*** Test Cases ***
Pass Rate Should Be Calculated Correctly
    ${rate}=    Calculate Pass Rate    90    100
    Should Be Equal As Numbers    ${rate}    90

Zero Total Should Not Cause Division Failure
    ${rate}=    Calculate Percentage    5    0
    Should Be Equal As Numbers    ${rate}    0

Flaky Rate Should Be Calculated Correctly
    ${rate}=    Calculate Flaky Rate    3    120
    Should Be Equal As Numbers    ${rate}    2.5

Execution Savings Should Never Be Negative
    ${saved}=    Calculate Execution Savings    10    15
    Should Be Equal As Numbers    ${saved}    0

Execution Savings Should Return Saved Minutes
    ${saved}=    Calculate Execution Savings    120    20
    Should Be Equal As Numbers    ${saved}    100
