*** Settings ***
Resource    ../imports.robot
Resource    ../5_test_datas/Vsee_data.robot
Resource    ../2_elements/Vsee_elements.robot


*** Keywords ***
Open room url with browser
    [Arguments]    ${browser_name}
    Open Browser    ${room_url}    ${browser_name}

Input patient name
    [Arguments]    ${patient_name}
    [Common] - Input Text    ${patient_name_input}    ${patient_name}

Click I give my consent to participate in this Telemedicine Consultation
    [Common] - Click Element    ${consent_checkbox}

Click Enter Waiting Room
    [Common] - Click Button    ${enter_waiting_room}

Verify patient name
    [Arguments]    ${patient_name}
    [Common] - Wait Until Element Visible On Screen    //h4[text()='Welcome ${patient_name}!']

Click continue
    [Common] - Click Button    ${continue_btn}

Click Join Now
    [Common] - Select Iframe    ${jitsiConferenceFrame0_iframe}
    [Common] - Click Button    ${join_now_btn}

Click For Providers
    [Common] - Click Element    ${for_providers_link}

Input email
    [Arguments]    ${email}
    [Common] - Input Text    ${email_input}    ${email}

Input password
    [Arguments]    ${password}
    [Common] - Input Text    ${password_input}    ${password}

Click button SignIn
    [Common] - Click Button    ${sign_in_btn}

Click patient with name
    [Arguments]    ${patient_name}
    [Common] - Click Element    //a[text()='${patient_name} ']

Click call patient
    [Common] - Click Button    ${call_patient_btn}

Click Continue on this browser
    [Common] - Click Element    ${continue_on_this_browser}

Sent message
    [Arguments]    ${message}
    [Common] - Click Element    ${group_chat_btn}
    [Common] - Input Text    ${message_input}    ${message}
    Sleep    2s
    [Common] - Click Element    ${message_input}
    Press Keys    None    ENTER

Verify message
    [Arguments]    ${message}
    Wait Until Page Contains Element    //div[text()='${message}']    5s

Doctor click Leave the meeting
    [Common][JS] - Execute JavaScript Click On Element By Xpath    ${leave_the_meeting_btn}

Doctor click End Visit All
    [Common] - Click Button    ${end_visit_all_btn}

Pantient click End visit
    [Common] - Click Button    ${end_visit_btn}
