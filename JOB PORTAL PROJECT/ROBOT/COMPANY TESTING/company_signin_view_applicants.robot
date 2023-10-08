*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${COMPANY_LOGIN_URL}     http://127.0.0.1:8000/company_login
${VIEW_APPLICANTS_URL}   http://127.0.0.1:8000/view_applicants
${USERNAME}              Microsoft
${PASSWORD}              microsoft 
*** Test Cases ***
Open Company Login Page
    [Documentation]  Open the company login page and ensure it's the correct page by validating the title
    Open Browser  ${COMPANY_LOGIN_URL}  ${BROWSER}
    Title Should Be  Company Login

Perform Company Login
    [Documentation]  Input username and password, and submit the form to perform login
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button  css:input[type=submit]

Navigate to View Applicants Page
    [Documentation]  Navigate to the page to view applicants
    Go To  ${VIEW_APPLICANTS_URL}
    Title Should Be  All Applicants

Close Browser
    [Documentation]  Closes the browser window after test execution
    Close Browser
