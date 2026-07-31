*** Variables ***
# Locator strategy:
# 1. Prefer data-testid or another stable automation attribute.
# 2. Prefer accessible role/name when a stable attribute is unavailable.
# 3. Keep fallback locators separate and explicit.
# 4. Avoid XPath and dynamic class chains unless there is no safer option.
${HOT_PAGE_ROOT}                 css=body
${HOT_DEMAND_TITLE_PRIMARY}      css=input[name="title"]
${HOT_DEMAND_TITLE_FALLBACK}     css=input[id*="title"]
${HOT_SAVE_DRAFT}                text="Salvar Rascunho"
${HOT_SUBMIT}                    text="Submeter"
${HOT_BP_LINK}                   text="Link BP"
