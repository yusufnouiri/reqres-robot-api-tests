*** Settings ***
Documentation        Robot Framework API Test Tutorial

Library        RequestsLibrary
Library        JSONLibrary
Library        String
Library        Collections

*** Variables ***
${base_url}        https://reqres.in

*** Test Cases ***
Test_Case_1: Get all users from the database
    [Tags]    Demo
    Create Session    session1        ${base_url}       disable_warnings=1
    ${endpoint}       Set Variable        /api/users?page=2
    ${response}=      GET On Session    session1    ${endpoint}
    Log To Console    ${response.headers}
    Log To Console    ${response.status_code}
    Log To Console    ${response.content}
    Log    ${response.content}

    #Verfication
    ${status_code}=    Convert To String    ${response.status_code}
    Should Be Equal    ${status_code}    200