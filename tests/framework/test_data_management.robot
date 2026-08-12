*** Settings ***
Documentation    Framework-level tests proving the generic test-data management capability without any real application dependency.
Resource         ../../resources/data/builders/data_builder.resource
Resource         ../../resources/data/validators/data_validator.resource
Resource         ../../resources/data/cleanup/data_cleanup.resource
Test Teardown     Clear Test Data Cleanup Registry
Force Tags        framework    test-data

*** Test Cases ***
Generated Test Record Should Be Traceable And Valid
    ${record}=    Build Generic Test Record
    Validate Required Test Data Fields    ${record}    id    email    status    source    created_at
    Validate Automation Test Identifier    ${record}[id]
    Validate Non Production Email    ${record}[email]
    Register Test Data For Cleanup    ${record}[id]
    ${registered}=    Get Registered Test Data For Cleanup
    List Should Contain Value    ${registered}    ${record}[id]

Builder Should Allow Controlled Overrides
    ${record}=    Build Generic Test Record    status=PROCESSING    scenario=negative-path
    Should Be Equal    ${record}[status]    PROCESSING
    Should Be Equal    ${record}[scenario]    negative-path

Validator Should Reject Missing Required Test Data
    ${record}=    Build Record Missing Required Field    email
    Run Keyword And Expect Error
    ...    *email*
    ...    Validate Required Test Data Fields    ${record}    id    email
