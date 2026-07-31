*** Variables ***
# Locator strategy:
# 1. Prefer data-testid or another stable automation attribute.
# 2. Prefer accessible role/name when a stable attribute is unavailable.
# 3. Use exact visible text only when the product language is stable.
# 4. Avoid XPath and dynamic class chains unless there is no safer option.
${BPWEB_PAGE_ROOT}         css=body
${BPWEB_GROUP_MENU}        text="Grupo"
${BPWEB_ADD_SIMULATION}    text="Adicionar Simulação"
${BPWEB_LINK}              text="Vincular"
