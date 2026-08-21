*** Settings ***
Documentation    Shared suite hooks for structured execution logging.
Resource         ../keywords/technical/logging.resource

*** Keywords ***
Start Logged Test
    Log Test Start    ${TEST NAME}

Finish Logged Test
    Log Test End    ${TEST NAME}    ${TEST STATUS}
