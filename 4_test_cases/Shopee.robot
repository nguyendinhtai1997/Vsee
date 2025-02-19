*** Settings ***
Resource    ../imports.robot


*** Test Cases ***
[shopee] - shopee 01
    [Tags]    shopee
    [Common] - Open Chrome    https://shopee.vn/
    [Common] - Click Coordinate    ${1400}    ${100}
    [Common] - Click Coordinate    ${1330}    ${250}
    [Common] - Click Coordinate    ${604}    ${56}
    [Common] - Click Coordinate    ${1363}    ${100}
    [Common] - Click Coordinate    ${1014}    ${132}


    ${js_script}=    Set Variable    document.querySelector('//input[@class = "name input"]').value = 'Hello, Extension!'
    Execute JavaScript    ${js_script}


    # Click Element    xpath=//button[@id="your-button-id"]
    # [Common] - Click Coordinate    ${942}    ${276}