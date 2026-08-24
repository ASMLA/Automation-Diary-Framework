*** Settings ***
Documentation    Framework-level checks for the v0.20 execution-strategy capability.
Resource         ../../resources/keywords/technical/execution.resource

*** Test Cases ***
Parallel Process Count Should Have Safe Default
    ${processes}=    Resolve Parallel Process Count
    Should Be True    $processes >= 1

Execution Scope Should Be Resolved
    ${scope}=    Resolve Execution Scope
    Should Not Be Empty    ${scope}

Parallel Output Directory Should Be Resolved
    ${output}=    Resolve Parallel Output Directory
    Should Contain    ${output}    reports

Execution Strategy Should Be Loggable
    Log Execution Strategy
