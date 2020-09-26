*** Settings ***
Documentation    Suite for checking main search functionality
Default Tags    SEARCH
Resource    Resources.robot
Test Setup       Test Setup
Test Teardown    Test Teardown

*** Test Cases ***
Check ability to apply search by make
    [Tags]    AUTO-1    SMOKE
    GIVEN I select "Search by Make" search type
    AND I choose "Used Cars" condition of car
    AND I choose "Jeep" mark
    AND I choose "Cherokee" model
    AND I choose "25000" price
    AND I choose "150" milles
    AND I choose "72212" zip
    WHEN I click Search button
    AND I open the offer with the number 1 in order
    THEN Order has params  condition=Used Cars
    ...                    mark=Jeep
    ...                    model=Cherokee
    ...                    price=25000
    ...                    milles=150
    ...                    zip=72212


