*** Settings ***
Resource    ../common/base_page.resource

*** Variables ***
# Existing sample locator is preserved only to maintain the current framework demonstration.
${BHUB_PAGE_ROOT}    css=body

*** Keywords ***
Validate BHUB Page Root
    Validate Application Root Is Visible    ${BHUB_PAGE_ROOT}
