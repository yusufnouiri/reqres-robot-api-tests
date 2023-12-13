*** Settings ***
Documentation        Robot Framework API Test Tutorial

Library        RequestsLibrary
Library        JSONLibrary
Library        String
Library        Collections
Library    Dialogs

*** Variables ***
${base_url}        https://reqres.in
${users_endpoint}    /api/users?page=2
${page_path}       $.page
${support_path}    $.support
${data_path}       $.data

*** Test Cases ***
Test_Case_1: Get all users from the database
    [Tags]    Demo
    Create Session    session1        ${base_url}       disable_warnings=1        // Create a HTTP session to a server
    ${endpoint}       Set Variable        /api/users?page=2
    ${response}=      GET On Session    session1    ${endpoint}                   // "Sends a GET request on a previously created HTTP Session."
    Log To Console    ${response.headers}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log    ${response.content}
    ${status_code}=    Convert To String    ${response.status_code}
    Should Not Be Equal    ${status_code}    500

Test_Case_2: Verify number of users 
    [Tags]    Demo2
    Open Session
    ${json_response}=        GET Requests    ${users_endpoint}
    ${contents_json}=        Get Value From Json    ${json_response}        ${data_path}    fail_on_empty=${True}
    ${user_ids}=             Get Variable Value    @{contents_json}[0]

    Log List    ${user_ids}
    # FOR   ${item}    IN    @{contents_json}[0]
    #     # Log To Console           ${item}
    #     # ${user_id}=        Get Value From Json    ${item}        "id"    fail_on_empty=${True}
    #     # Log To Console    ${user_id}
    #     # IF    ${user_id}[0] == 7
    #     #     Log To Console    ID found
    #     # END
    #     Should Have Value In Json    ${item}    $.id.[0]
    #     Log To Console    *********************BREAK*********************
    # END
    #${contents}=             Convert To String    ${contents_json}
    #Log To Console           ${contents}
    #${contents_regexp}=      Remove String Using Regexp    ${contents}    ['\\[\\],]
    #Log To Console           ${contents_regexp}
    #@{list_contents}=        Split String   ${contents_regexp}
    #Should Be Equal          ${list_contents}[1]    7
    #Log To Console           ${list_contents}[0]

*** Keywords ***
Open Session 
    Create Session    session1        ${base_url}       disable_warnings=1

GET Requests
    [Arguments]    ${endpoint}
    ${response}=      GET On Session    session1    ${endpoint}
    ${json_response}=    Convert String To Json    ${response.content}
    [Return]    ${json_response}
