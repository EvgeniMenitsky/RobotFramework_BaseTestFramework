*** Settings ***
Resource    ..${/}..${/}..${/}Library.robot

*** Variables ***
${utilsJsFilePath}          ${CURDIR}/js/utils.js

*** Keywords ***
Scroll To Element Vertically
    [Arguments]     ${locator}
    Execute Javascript    ${utilsJsFilePath}    ARGUMENTS    scrollToElementVertically    ${locator}

Scroll Element Vertically
    [Arguments]     ${locator}    ${pixelCount}
    ${pixelCount}=    Convert To Number    ${pixelCount}
    Execute Javascript    ${utilsJsFilePath}    ARGUMENTS    scrollElementVertically    ${locator}    ${pixelCount}