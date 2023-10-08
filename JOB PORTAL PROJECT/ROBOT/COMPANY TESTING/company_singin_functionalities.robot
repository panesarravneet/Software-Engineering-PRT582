*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}              Chrome
${COMPANY_LOGIN_URL}    http://127.0.0.1:8000/company_login
${COMPANY_USERNAME}     Microsoft  
${COMPANY_PASSWORD}     microsoft  

*** Test Cases ***
Open Company Login Page
    [Documentation]  Verify that the company login page can be opened
    Open Browser  ${COMPANY_LOGIN_URL}  ${BROWSER}
    Title Should Be  Company Login  # Replace with the actual title of your login page

Valid Company Login
    [Documentation]  Ensure a company can log in with valid credentials
    Input Text    id=username   ${COMPANY_USERNAME}
    Input Text    id=password    ${COMPANY_PASSWORD}
    Click Button    css:input[type=submit]

Logout
    [Documentation]  This test case verifies that the company user can successfully logout
    Click Element  //a[@href='/logout/']

Navigate Back to Company Login Page
    [Documentation]    This test case navigates back to admin login page
    Go To          ${COMPANY_LOGIN_URL}

Invalid Company Login
    [Documentation]  Ensure alert is shown for invalid login attempt
    Input Text    id=username    invalidcompany
    Input Text    id=password    invalidPassword
    Click Button    css:input[type=submit]
    Alert Should Be Present  Invalid Credentials. Please try again.
    
Close Browser
    [Documentation]  Close the browser after tests
    Close Browser
