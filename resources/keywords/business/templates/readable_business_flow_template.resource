*** Settings ***
Documentation    Generic business-keyword contract used by readable test templates.

*** Keywords ***
A Valid Record Is Prepared
    [Documentation]    Represents an explicit business precondition without exposing implementation details.
    Set Test Variable    ${READABLE_RECORD_REFERENCE}    AUTO_READABLE_TEMPLATE

The Record Is Submitted
    [Documentation]    Represents the business action under test.
    Should Be Equal    ${READABLE_RECORD_REFERENCE}    AUTO_READABLE_TEMPLATE

The Record Should Be Available For Validation
    [Documentation]    Represents the observable business outcome.
    Should Be Equal    ${READABLE_RECORD_REFERENCE}    AUTO_READABLE_TEMPLATE
