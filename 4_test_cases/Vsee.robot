*** Settings ***
Resource    ../imports.robot
Resource    ../3_keywords/Vsee_keywords.robot
Resource    ../5_test_datas/Vsee_data.robot


*** Test Cases ***
[TC_01][VSee] - Exercise 01
    [Documentation]    Exercise 01
    [Tags]    vsee_01
    Open room url with browser    chrome
    Input patient name    ${patient_name}
    Click I give my consent to participate in this Telemedicine Consultation
    Click Enter Waiting Room
    Verify patient name    ${patient_name}
    Click continue
    Click Join Now
    Open room url with browser    edge
    Switch Browser    2
    Click For Providers
    Input email    ${email}
    Input password    ${password}
    Click button SignIn
    Click patient with name    ${patient_name}
    Click call patient
    Click Continue on this browser
    Click continue
    Click Join Now
    Unselect Frame
    Sent message    ${message}
    Switch Browser    1
    Unselect Frame
    Verify message    ${message}
    Switch Browser    2
    [Common] - Select Iframe    ${jitsiConferenceFrame0_iframe}
    Doctor click Leave the meeting
    Unselect Frame
    Doctor click End Visit All
    Switch Browser    1
    Pantient click End visit
    Close All Browsers
