*** Settings ***
Documentation    Common variables for project envariment
Resource     Library.robot
Resource     src${/}framework${/}BrowserSetting.robot
Resource     src${/}framework${/}wrappers${/}JsKeywords.robot

*** Variables ***
${BASE_URL}    https://www.cars.com
${BROWSER}    chrome
${BASE_TIMEOUT}    15s
${BASE_SPEED}    0.8s
${BASE_DIR}    ${CURDIR}
${REMOTE}    ${False}
${BROWSERSTACK_USER}    YOUR-USER
${BROWSERSTACK_ACCESS_KEY}    YOUR-ACCESS-KEY
${BROWSERSTACK_URL}    http://${BROWSERSTACK_USER}:${BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/h

