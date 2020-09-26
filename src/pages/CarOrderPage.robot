*** Settings ***
Documentation    Description for MainPage fuctionality

*** Variables ***
${ORDER_ITEM_PAGE}    //div[contains(@class, 'info-title') and @id='vdpOverview']
${CONDITION_LABEL}    //h1[contains(@class,'stock-type')]
${INFO_TITLE}    //h1[contains(@class,'info__title')]
${MILLES_INFO}    //div[contains(@class,'mileage_margin')]
${PRICE_INFO}    //span[contains(@class,'info__price')]
${LOCATION_INFO}    //div[contains(@class,'details-location__text')]


*** Keywords ***
Order is opened
    [Documentation]    Car order page is opened
    Wait Until Element Is Visible    ${ORDER_ITEM_PAGE}

Order has params
    [Documentation]    Check that page relevant to selected params
    [Arguments]    ${condition}    ${mark}    ${model}    ${price}
    ...     ${milles}    ${zip}
    Order is opened
    ${condition_text}=    Get Text    ${CONDITION_LABEL}
    ${info_text}=    Get Text    ${INFO_TITLE}
    ${price_text}=    Get Text    ${PRICE_INFO}
    ${milles_text}=    Get Text    ${MILLES_INFO}
    ${zip_text}=    Get Text    ${LOCATION_INFO}
    Should Contain   ${condition}    ${condition_text}    msg=Isn't ${condition}!    ignore_case=${True}
    Should Contain   ${info_text}    ${mark}     msg=Isn't ${mark}!    ignore_case=${True}
    Should Contain   ${info_text}    ${model}    msg=Isn't ${model}!    ignore_case=${True}
    #todo add the next asserts: price, milles, zip