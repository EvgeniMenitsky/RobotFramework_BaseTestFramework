*** Settings ***
Documentation    Suite for init browser

*** Keywords ***
Create browser
    [Documentation]    Create new browser and open new page
    [Arguments]    ${url}=${BASE_URL}    ${browser}=${BROWSER}    ${is_remote}=${False}
    ...    ${remote_url}=${BROWSERSTACK_URL}    ${desired_capabilities}=${None}    ${ff_profile_dir}=${None}
    ${remote_url}=    Set Variable If   ${is_remote}    ${remote_url}    ${False}
    SeleniumLibrary.Open Browser    url=${url}
    ...                             browser=${browser}
    ...                             remote_url=${remote_url}
    ...                             desired_capabilities=${desired_capabilities}
    ...                             ff_profile_dir=${ff_profile_dir}
    SeleniumLibrary.Set Selenium Speed    value=${BASE_SPEED}
    SeleniumLibrary.Set Selenium Timeout    value=${BASE_TIMEOUT}
    SeleniumLibrary.Maximize Browser Window

Close browser
    [Documentation]    Close all browsers
    SeleniumLibrary.Close All Browsers
