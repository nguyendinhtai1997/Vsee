*** Settings ***
Resource    ../imports.robot


*** Test Cases ***
[shopee] - shopee 01
    [Tags]    shopee
    [Common] - Open Chrome    https://shopee.vn/
