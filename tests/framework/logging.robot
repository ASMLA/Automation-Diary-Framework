*** Settings ***
Documentation    Framework-level checks for the v0.14 structured logging capability.
Resource         ../../resources/keywords/technical/logging.resource

*** Test Cases ***
Structured Log Should Include Framework Prefix
    ${message}=    Build Structured Log Message    Sample execution message
    Should Contain    ${message}    [AUTOMATION]
    Should Contain    ${message}    Sample execution message

Structured Log Should Include Context When Provided
    ${message}=    Build Structured Log Message    Record created    record=AUTO_123
    Should Contain    ${message}    record=AUTO_123
    Should Contain    ${message}    Record created

Logging Keywords Should Support Diagnostic Levels
    Log Framework Info       Information
    Log Framework Debug      Debug information
    Log Framework Warning    Warning information
    Log Framework Error      Error information
