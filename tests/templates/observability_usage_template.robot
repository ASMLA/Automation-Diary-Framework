*** Settings ***
Documentation    Generic example of traceable execution evidence.
Resource         ../../resources/keywords/technical/observability.resource
Force Tags       template    observability

*** Test Cases ***
Observability Usage Template
    ${execution_id}=    Evaluate    __import__('uuid').uuid4().hex
    ${metadata}=    Create Execution Metadata    ${execution_id}    template    PASS
    Log Execution Metadata    ${metadata}
