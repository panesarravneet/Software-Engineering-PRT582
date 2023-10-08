*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}               Chrome
${COMPANY_LOGIN_URL}     http://127.0.0.1:8000/company_login
${VIEW_JOBLIST_URL}      http://127.0.0.1:8000/job_list/
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

Navigate to View Job List Page
    [Documentation]  Navigate to the page to view job list
    Go To  ${VIEW_JOBLIST_URL}
    Title Should Be  Job Lists

Close Browser
    [Documentation]  Closes the browser window after test execution
    Close Browser
