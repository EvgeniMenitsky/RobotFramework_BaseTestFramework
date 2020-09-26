*** Settings ***
Documentation    Resources File for setting Search Test Suite
Resource     ..${/}..${/}Settings.robot
Resource    ..${/}..${/}src${/}pages${/}MainPage.robot
Resource    ..${/}..${/}src${/}pages${/}CarOrderPage.robot
Resource    ..${/}..${/}src${/}pages${/}SearchResultPage.robot

*** Keywords ***
Test Setup
    Create browser

Test Teardown
    Close browser