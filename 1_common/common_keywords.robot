*** Settings ***
Resource    ../imports.robot
Library     SeleniumLibrary
Library     OperatingSystem
Library     pyautogui
Library     Process


*** Keywords ***
[Common] - Open Chrome
    [Arguments]    ${url}
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    # Call Method    ${chrome_options}    add_argument    --auto-open-devtools-for-tabs
    Call Method    ${chrome_options}    add_extension    /Users/tainguyen/Desktop/Projects/Vsee/EditThisCookie.crx
    Create Webdriver    Chrome    options=${chrome_options}
    [Common] - Maximize Browser Window
    Go To    ${url}
    BuiltIn.Sleep    3s

[Common] - Click Coordinate
    [Arguments]    ${x}    ${y}
    BuiltIn.Sleep    0.5s
    Evaluate    __import__('pyautogui').click(${x}, ${y})

[Common] - Open Chrome Headless Browser
    [Arguments]    ${url}
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --test-type
    Call Method    ${chrome_options}    add_argument    --ignore-certificate-errors
    Call Method    ${chrome_options}    add_argument    --disable-web-security
    Call Method    ${chrome_options}    add_argument    --allow-running-insecure-content
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-impl-side-painting
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    [Common] - Maximize Browser Window
    Go To    ${url}

[Common] - Open Chrome Browser With Mode
    [Arguments]    ${url}    ${browser}
    ${browser}    Convert To Lowercase    ${browser}
    ${true}    Convert To Boolean    true
    ${list_options_headless}    Create List
    ...    --no-sandbox
    ...    --headless
    ...    --ignore-certificate-errors
    ...    --disable-web-security
    ...    --disable-notifications
    ...    --disable-impl-side-painting
    ...    --enable-features=NetworkService,NetworkServiceInProcess
    ${list_options}    Create List
    ...    --no-sandbox
    ...    --ignore-certificate-errors
    ...    --disable-web-security
    ...    --disable-notifications
    ...    --disable-impl-side-painting
    ...    --enable-features=NetworkService,NetworkServiceInProcess
    ${args_headless}    Create Dictionary    args=${list_options_headless}
    ${args}    Create Dictionary    args=${list_options}
    ${desired_capabilities_headless}    Create Dictionary
    ...    acceptSslCerts=${true}
    ...    acceptInsecureCerts=${true}
    ...    ignore-certificate-errors=${true}
    ...    chromeOptions=${args_headless}
    ${desired_capabilities}    Create Dictionary
    ...    acceptSslCerts=${true}
    ...    acceptInsecureCerts=${true}
    ...    ignore-certificate-errors=${true}
    ...    chromeOptions=${args}
    IF    "${browser}" == "chrome"
        Open Browser    ${url}    ${browser}    desired_capabilities=${desired_capabilities}
        [Common] - Maximize Browser Window
    ELSE IF    "${browser}" == "headlesschrome"
        [Common] - Open Chrome Headless Browser    ${url}
        Maximize Browser Window
    ELSE
        Should Be True    ${FALSE}
    END

[Common] - Maximize Browser Window
    Maximize Browser Window

[Common] - Close Browser
    Close Browser

[Common] - Click Button
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}
    Click Element    ${locator}

[Common] - Click Text
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}
    Click Element    ${locator}

[Common] - Click Input Text
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}
    Click Element    ${locator}

[Common] - Click Element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}.
    Click Element    ${locator}

[Common] - Double Click Element
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}.
    Double Click Element    ${locator}

[Common] - Input Text
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}
    Input Text    ${locator}    ${text}

[Common] - Input Password
    [Arguments]    ${locator}    ${text}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}
    Input Password    ${locator}    ${text}

[Common] - Wait Until Element Visible On Screen
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}

[Common] - Wait Until Message Is Invisible
    [Arguments]    ${message}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Page Should Not Contain
    ...    ${message}

[Common] - Select Iframe
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}.
    Select Frame    ${locator}

[Common] - Clear Textbox
    [Arguments]    ${locator}
    [Common] - Wait Until Element Visible On Screen    ${locator}
    Input Text    ${locator}    ${EMPTY}

[Common] - Get Selected Value Of Dropdownlist
    [Arguments]    ${dropdownlist_id}
    ${get_selected_value}    Get Selected List Value    ${dropdownlist_id}
    RETURN    ${get_selected_value}

[Common] - Get Selected Label Of Dropdownlist
    [Arguments]    ${dropdownlist_id}
    ${get_selected_label}    Get Selected List Label    ${dropdownlist_id}
    RETURN    ${get_selected_label}

[Common] - Get Value With Prefix
    [Arguments]    ${value}    ${prefix}
    ${returnValue}    Catenate    ${prefix}    ${value}
    RETURN    ${returnValue}

[Common] - Get Value With Postfix
    [Arguments]    ${value}    ${postfix}
    ${returnValue}    Catenate    ${value}    ${postfix}
    RETURN    ${returnValue}

[Common] - Get Page Source
    ${myHtml}    Get Source
    Log    ${myHtml}
    RETURN    ${myHtml}

[Common] - Get Page Title
    ${page_title}    Get Title
    Log    ${page_title}
    RETURN    ${page_title}

[Common] - Get Text By Attribute
    [Arguments]    ${locator}    ${attribute}
    ${get_value}    Get Element Attribute    ${locator}    ${attribute}
    RETURN    ${get_value}

[Common] - Get Text
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}.
    ${get_text}    Get Text    ${locator}
    RETURN    ${get_text}

[Common] - Convert To Lowercase And Replace Spaces Into Underscore
    [Arguments]    ${string}
    ${string_lower}    Convert To Lowercase    ${string}
    ${string_repl}    Replace String    ${string_lower}    ${SPACE}    _
    RETURN    ${string_repl}

[Common] - Convert Boolean To Shown Value
    [Arguments]    ${val}
    IF    ${val}    RETURN    Yes
    RETURN    No

[Common] - Verify Page Should Not Contain Button
    [Arguments]    ${locator}
    Page Should Not Contain Element    xpath=${locator}

[Common] - Verify Confirmation Message Is
    [Arguments]    ${message}
    Wait Until Page Contains    ${message}
    Page Should Contain    ${message}

[Common] - Verify Page Title Is
    [Arguments]    ${title}
    Wait Until Page Contains    ${title}    ${time_out}

[Common] - Verify Element Is Displayed
    [Arguments]    ${locator}
    Element Should Be Enabled    ${locator}

[Common] - Verify Page Contain Message
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Wait Until Element Is Visible
    ...    ${locator}
    ...    timeout=${time_out}
    ...    error=Could Not find ${locator} Element in ${time_out}.

[Common] - Verify Page Should Contain Labels
    [Arguments]    @{labels}
    FOR    ${label}    IN    @{labels}
        Wait Until Page Contains    ${label}    ${time_out}
        Page Should Contain    ${label}
    END

[Common] - Verify Element Is Invisible
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    ${time_out}    ${polling_every}    Element Should Not Be Visible    ${locator}

[Common] - Verify Message Is
    [Arguments]    ${message}
    Wait Until Keyword Succeeds    ${time_out}    ${polling_every}    Page Should Contain    ${message}

[Common] - Verify Url Path Is
    [Arguments]    ${url_path}
    ${url}    Get Location
    ${match}    Get Regexp Matches    ${url}    ${url_path}
    Should Not Be Empty    ${match}

[Common] - Verify Page Contains Element Text
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}    ${time_out}

[Common] - Verify It Redirects To Page
    [Arguments]    ${page_title}
    [Common] - Verify Page Contains Element Text    ${page_title}

[Common] - Wait For Page To Finish Loading
    [Arguments]    ${loading_locator}
    Wait Until Keyword Succeeds
    ...    ${time_out}
    ...    ${polling_every}
    ...    Element Should Not Be Visible
    ...    ${loading_locator}

[Common] - Scroll to Element
    [Arguments]    ${element}
    Scroll Element Into View    ${element}
