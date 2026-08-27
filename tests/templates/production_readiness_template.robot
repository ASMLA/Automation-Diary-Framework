*** Settings ***
Documentation    Generic production-readiness gate example.
Resource         ../../resources/keywords/technical/governance.resource
Force Tags       template    governance    production-readiness

*** Test Cases ***
Production Readiness Template
    ${criteria}=    Build Production Readiness Criteria    100    0    True    True    True
    ${ready}=    Evaluate Production Readiness    ${criteria}
    Should Be True    ${ready}
    Log Governance Decision    v0.23.0    READY
