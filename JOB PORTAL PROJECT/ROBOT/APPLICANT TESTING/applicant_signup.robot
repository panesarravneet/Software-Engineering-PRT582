*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://127.0.0.1:8000/signup/  # Adjust the URL accordingly
${BROWSER}        Chrome
${PROFILE}        pp.jpeg  # Replace with the name of the file you want to upload
${PROFILE_PATH}      ${EXECDIR}${/}${PROFILE}


*** Test Cases ***
Open Website
    [Documentation]  This test case verifies that the user is able to open the URL
    Open Browser  ${URL}  ${Browser}
Register a new job seeker
    Input Text    id=first_name    test
    Input Text    id=last_name     test
    Input Text    id=password1     testpassword
    Input Text    id=password2     testpassword
    Input Text    id=email         test@gmail.com
    Input Text    id=phone         1234567890
    Click Element    id=male
    Choose File    id=image    ${PROFILE_PATH}
    Click Button    css:input[type=submit]
    Close Browser
