*** Settings ***
Library     Browser
Resource    ../common/base_page.resource

*** Variables ***
# Existing sample locators are preserved only to maintain the current framework demonstrations.
# New real application locators will be mapped only after the generic framework reaches v1.0.
${HOT_PAGE_ROOT}                 css=body
${HOT_DEMAND_TITLE_PRIMARY}      css=input[name="title"]
${HOT_DEMAND_TITLE_FALLBACK}     css=input[id*="title"]
${HOT_SAVE_DRAFT}                text="Salvar Rascunho"
${HOT_SUBMIT}                    text="Submeter"
${HOT_BP_LINK}                   text="Link BP"

*** Keywords ***
Validate HOT Page Root
    Validate Application Root Is Visible    ${HOT_PAGE_ROOT}

Fill HOT Demand Title On Page
    [Arguments]    ${title}
    ${title_locator}=    Get First Visible Page Locator
    ...    ${HOT_DEMAND_TITLE_PRIMARY}
    ...    ${HOT_DEMAND_TITLE_FALLBACK}
    Fill Text    ${title_locator}    ${title}

Click HOT Save Draft On Page
    Click    ${HOT_SAVE_DRAFT}

Click HOT Submit On Page
    Click    ${HOT_SUBMIT}
