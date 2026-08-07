*** Settings ***
Library     Browser
Resource    ../common/base_page.resource

*** Variables ***
# Existing sample locators are preserved only to maintain the current framework demonstrations.
${BPWEB_PAGE_ROOT}         css=body
${BPWEB_GROUP_MENU}        text="Grupo"
${BPWEB_ADD_SIMULATION}    text="Adicionar Simulação"
${BPWEB_LINK}              text="Vincular"

*** Keywords ***
Validate BP WEB Page Root
    Validate Application Root Is Visible    ${BPWEB_PAGE_ROOT}

Click BP WEB Group Menu On Page
    Click    ${BPWEB_GROUP_MENU}

Click BP WEB Add Simulation On Page
    Click    ${BPWEB_ADD_SIMULATION}
