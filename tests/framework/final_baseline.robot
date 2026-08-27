*** Settings ***
Documentation    Final architectural sanity checks for the v0.24.0 Saga 1 baseline.
Library          OperatingSystem
Resource         ../../resources/keywords/technical/governance.resource

*** Variables ***
${ROOT}    ${CURDIR}${/}..${/}..

*** Test Cases ***
Framework Baseline Documentation Should Exist
    File Should Exist    ${ROOT}${/}docs${/}architecture${/}framework-final-baseline.md
    File Should Exist    ${ROOT}${/}docs${/}project${/}saga-1-final-retrospective.md
    File Should Exist    ${ROOT}${/}docs${/}automation-diary${/}024-framework-finalization-and-first-saga-retrospective.md

Core Architecture Layers Should Be Available
    Directory Should Exist    ${ROOT}${/}resources${/}keywords${/}business
    Directory Should Exist    ${ROOT}${/}resources${/}pages
    Directory Should Exist    ${ROOT}${/}resources${/}keywords${/}technical
    Directory Should Exist    ${ROOT}${/}tests${/}framework

Cross Cutting Capabilities Should Be Available
    File Should Exist    ${ROOT}${/}resources${/}keywords${/}technical${/}configuration.resource
    File Should Exist    ${ROOT}${/}resources${/}keywords${/}technical${/}secrets.resource
    File Should Exist    ${ROOT}${/}resources${/}keywords${/}technical${/}synchronization.resource
    File Should Exist    ${ROOT}${/}resources${/}keywords${/}technical${/}logging.resource
    File Should Exist    ${ROOT}${/}resources${/}keywords${/}technical${/}metrics.resource
    File Should Exist    ${ROOT}${/}resources${/}keywords${/}technical${/}execution.resource
    File Should Exist    ${ROOT}${/}resources${/}keywords${/}technical${/}observability.resource
    File Should Exist    ${ROOT}${/}resources${/}keywords${/}technical${/}governance.resource

Framework Should Be Ready For Application Onboarding
    ${criteria}=    Build Production Readiness Criteria    100    0    True    True    True
    ${ready}=    Evaluate Production Readiness    ${criteria}
    Should Be True    ${ready}

Final Governance Metadata Should Be Traceable
    ${metadata}=    Build Governance Metadata    v0.24.0    automation-team    READY
    Validate Governance Metadata    ${metadata}
    Should Be Equal    ${metadata}[framework_version]    v0.24.0
    Should Be Equal    ${metadata}[status]    READY
