*** Settings ***
Documentation    Generic template demonstrating a scenario designed to be safe for parallel execution.
Force Tags       template    parallel-safe

*** Test Cases ***
Independent Parallel Scenario Template
    ${execution_id}=    Evaluate    __import__('uuid').uuid4().hex
    Should Not Be Empty    ${execution_id}
