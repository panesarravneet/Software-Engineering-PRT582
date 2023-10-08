*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}              Chrome
${SIGNUP_URL}           http://127.0.0.1:8000/company_signup  # replace with actual URL
${FIRST_NAME}           Example
${LAST_NAME}            Company
${USERNAME}             examplecompany
${PASSWORD}             example
${CONFIRM_PASSWORD}     example
${EMAIL}                company@example.com
${PHONE}                1234567890
${GENDER}               Male
${IMAGE_PATH}           ${EXECDIR}${/}sample.jpg  # path to a sample company logo
${COMPANY_NAME}         Example Company

*** Test Cases ***
Company Signup
    [Documentation]  This test case verifies whether sign up functionality is working well
    Open Browser  ${SIGNUP_URL}  ${BROWSER}
    Title Should Be  Company Signup 
    
    Input Text    id=first_name    ${FIRST_NAME}
    Input Text    id=last_name     ${LAST_NAME}
    Input Text    id=username      ${USERNAME}
    Input Text    id=password1     ${PASSWORD}
    Input Text    id=password2     ${CONFIRM_PASSWORD}
    Input Text    id=email         ${EMAIL}
    Input Text    id=phone         ${PHONE}
    Select Radio Button    gender  ${GENDER}
    Choose File    id=image        ${IMAGE_PATH}
    Input Text    id=company_name  ${COMPANY_NAME}
    Click Button  css:input[type=submit]
    
 Close Browser
    [Documentation]  Close the browser after tests
    Close Browser
