*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${USER_LOGIN_URL}    http://127.0.0.1:8000/user_login
${USERNAME}       ravneet@gmail.com
${PASSWORD}       ravneet

*** Test Cases ***
Open User Login Page
    [Documentation]  Verify that the user login page can be opened
    Open Browser  ${USER_LOGIN_URL}  ${BROWSER}
    Title Should Be  User Login Page

Valid User Login
    [Documentation]  Ensure a user can log in with valid credentials
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    css:input[type=submit]
    
Logout
    [Documentation]  This test case verifies that the user can successfully logout
    Click Element  //a[@href='/logout/']

Navigate Back to User Login Page
    [Documentation]    This test case navigates back to user login page
    Go To          ${USER_LOGIN_URL}
    
Invalid User Login
    [Documentation]  Ensure alert is shown for invalid login attempt
    Input Text    id=username    invaliduser@example.com
    Input Text    id=password    InvalidPassword
    Click Button    css:input[type=submit]
    Alert Should Be Present  Invalid Credentials. Please try again.

Close Browser
    [Documentation]  Close the browser after tests
    Close Browser
