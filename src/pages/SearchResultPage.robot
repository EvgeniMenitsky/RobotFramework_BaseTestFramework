*** Settings ***
Documentation    Main search result page

*** Variables ***
${ORDER_ITEM_BY_POSIION}    //a[@data-position='{number_of_position}']/parent::div

*** Keywords ***
I open the offer with the number ${number_of_position} in order
    [Documentation]    Click on result offer number in order
    ${item_locator}=    Format String    ${ORDER_ITEM_BY_POSIION}    number_of_position=${number_of_position}
    Wait Until Element Is Visible    ${item_locator}
    Scroll To Element Vertically    ${item_locator}
    Click Element    ${item_locator}