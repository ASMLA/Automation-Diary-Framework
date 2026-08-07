*** Settings ***
Library     Browser
Resource    ../common/base_page.resource

*** Variables ***
# Replace these placeholders only when a real application is onboarded after the framework v1.0 milestone.
${PAGE_ROOT}    css=body

*** Keywords ***
Validate Template Page Root
    [Documentation]    Example Page Object responsibility: locators and UI-level operations only.
    Validate Application Root Is Visible    ${PAGE_ROOT}
