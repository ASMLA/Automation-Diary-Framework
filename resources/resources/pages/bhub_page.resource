*** Variables ***
# Locator strategy:
# 1. Prefer data-testid or another stable automation attribute.
# 2. Prefer accessible role/name when a stable attribute is unavailable.
# 3. Use explicit CSS only for structural elements.
# 4. Avoid XPath and dynamic class chains unless there is no safer option.
${BHUB_PAGE_ROOT}    css=body
