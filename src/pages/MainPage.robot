*** Settings ***
Documentation    Description for MainPage fuctionality

*** Variables ***
${SEARCH_BY_MAKE_TYPE_LOCATOR}    //*[@for='hswMakeModel']
${SEARCH_BY_BODY_STYLE_TYPE_LOCATOR}    //*[@for='hswBodyStyle']
${CONDITION_SELECTBOX}    name:stockType
${MARK_SELECTBOX}    name:makeId
${MODEL_SELECTBOX}    name:modelId
${PRICE_SELECTBOX}     name:priceMax
${MILLES_SELECTBOX}     name:radius
${ZIP_FIELD}     name:zip
${SEARCH_BUTTON}    //input[@value='Search']

*** Keywords ***
I select "${type_name}" search type
    [Documentation]    Select type for condition for search
    Run Keyword If    'Make' in '${type_name}'    Click Element     ${SEARCH_BY_MAKE_TYPE_LOCATOR}
    ...    ELSE    Click Element     ${SEARCH_BY_BODY_STYLE_TYPE_LOCATOR}

I choose "${condition}" condition of car
    [Documentation]   Select condition of car
    Select From List By Label    ${CONDITION_SELECTBOX}    ${condition}

I choose "${mark}" mark
    [Documentation]    Select mark for search
    Select From List By Label    ${MARK_SELECTBOX}    ${mark}

I choose "${model}" model
    [Documentation]    Select model for search
    Select From List By Label    ${MODEL_SELECTBOX}    ${model}

I choose "${price}" price
    [Documentation]    Select price for search
    Select From List By Value    ${PRICE_SELECTBOX}    ${price}

I choose "${milles}" milles
    [Documentation]    Select milles for search
    Select From List By Value    ${MILLES_SELECTBOX}    ${milles}

I choose "${zip} zip
    [Documentation]    Select zip for search
    Input Text    ${ZIP_FIELD}    ${zip}

I click Search button
    [Documentation]    Click Search button
    Click Element    ${SEARCH_BUTTON}

