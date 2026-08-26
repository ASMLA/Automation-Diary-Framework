*** Settings ***
Documentation    Framework-level checks for the v0.22 observability capability.
Resource         ../../resources/keywords/technical/observability.resource

*** Test Cases ***
Evidence Root Should Be Resolvable
    ${root}=    Resolve Evidence Root
    Should Not Be Empty    ${root}

Report Root Should Be Resolvable
    ${root}=    Resolve Report Root
    Should Not Be Empty    ${root}

Evidence File Name Should Be Deterministic
    ${name}=    Build Evidence File Name    run-123    browser screenshot    png
    Should Be Equal    ${name}    run-123_browser_screenshot.png

Execution Metadata Should Be Traceable
    ${metadata}=    Create Execution Metadata    run-123    framework    PASS
    Should Be Equal    ${metadata}[execution_id]    run-123
    Should Be Equal    ${metadata}[scope]    framework
    Should Be Equal    ${metadata}[status]    PASS
