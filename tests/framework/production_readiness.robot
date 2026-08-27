*** Settings ***
Documentation    Framework-level checks for the v0.23 production-readiness capability.
Resource         ../../resources/keywords/technical/governance.resource

*** Test Cases ***
Healthy Framework Should Be Production Ready
    ${criteria}=    Build Production Readiness Criteria    100    0    True    True    True
    ${ready}=    Evaluate Production Readiness    ${criteria}
    Should Be True    ${ready}

Failing CI Should Block Production Readiness
    ${criteria}=    Build Production Readiness Criteria    100    0    True    False    True
    ${ready}=    Evaluate Production Readiness    ${criteria}
    Should Not Be True    ${ready}

Flaky Execution Should Block Production Readiness
    ${criteria}=    Build Production Readiness Criteria    100    1    True    True    True
    ${ready}=    Evaluate Production Readiness    ${criteria}
    Should Not Be True    ${ready}

Outdated Documentation Should Block Production Readiness
    ${criteria}=    Build Production Readiness Criteria    100    0    False    True    True
    ${ready}=    Evaluate Production Readiness    ${criteria}
    Should Not Be True    ${ready}

Unprotected Secrets Should Block Production Readiness
    ${criteria}=    Build Production Readiness Criteria    100    0    True    True    False
    ${ready}=    Evaluate Production Readiness    ${criteria}
    Should Not Be True    ${ready}

Governance Metadata Should Be Traceable
    ${metadata}=    Build Governance Metadata    v0.23.0    automation-team    READY
    Validate Governance Metadata    ${metadata}
    Should Be Equal    ${metadata}[framework_version]    v0.23.0
    Should Be Equal    ${metadata}[status]    READY
