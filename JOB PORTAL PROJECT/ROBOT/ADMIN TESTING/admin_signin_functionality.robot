*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}            Chrome
${ADMIN_LOGIN_URL}    http://127.0.0.1:8000/admin_login/
${ADMIN_USERNAME}     panesar
${ADMIN_PASSWORD}     panesar

*** Test Cases ***
Open Admin Login Page
    [Documentation]  Verify that the admin login page can be opened
    Open Browser  ${ADMIN_LOGIN_URL}  ${BROWSER}
    Title Should Be  Admin Login

Valid Admin Login
    [Documentation]  Ensure an admin can log in with valid credentials
    Input Text    id=username    ${ADMIN_USERNAME}
    Input Text    id=password    ${ADMIN_PASSWORD}
    Click Button    css:input[type=submit]

Logout
    [Documentation]  This test case verifies that the admin can successfully logout
    Click Element  //a[@href='/logout/']

Navigate Back to Admin Login Page
    [Documentation]    This test case navigates back to admin login page
    Go To          ${ADMIN_LOGIN_URL}

Invalid Admin Login
    [Documentation]  Ensure alert is shown for invalid login attempt
    Input Text    id=username   invalidadmin
    Input Text    id=password    InvalidPassword123
    Click Button    css:input[type=submit]
    Close Browser
