*** Settings ***
Documentation    Generic example showing how future projects can consume framework metrics helpers.
Resource         ../../resources/keywords/technical/metrics.resource
Force Tags       template    metrics

*** Test Cases ***
Automation Metrics Usage Template
    ${pass_rate}=    Calculate Pass Rate    95    100
    ${stability}=    Calculate Automation Stability Rate    98    100
    Should Be Equal As Numbers    ${pass_rate}    95
    Should Be Equal As Numbers    ${stability}    98
