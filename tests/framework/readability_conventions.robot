*** Settings ***
Documentation    Framework-level checks for the v0.16 readability contract.
Library          OperatingSystem

*** Variables ***
${READABLE_TEMPLATE}    ${CURDIR}${/}..${/}templates${/}readable_test_template.robot

*** Test Cases ***
Readable Template Should Express Business Phases
    ${content}=    Get File    ${READABLE_TEMPLATE}
    Should Contain    ${content}    Given A Valid Record Is Prepared
    Should Contain    ${content}    When The Record Is Submitted
    Should Contain    ${content}    Then The Record Should Be Available For Validation

Readable Template Should Not Expose UI Locators
    ${content}=    Get File    ${READABLE_TEMPLATE}
    Should Not Contain    ${content}    xpath=
    Should Not Contain    ${content}    css=

Readable Template Should Not Use Fixed Sleep
    ${content}=    Get File    ${READABLE_TEMPLATE}
    Should Not Contain    ${content}    Sleep
