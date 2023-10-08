*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}         Chrome
${LOGIN_URL}       http://127.0.0.1:8000/user_login
${PROFILE_URL}     http://127.0.0.1:8000/user_homepage 
${USERNAME}        neel@gmail.com  # Replace with actual username
${PASSWORD}        neel  # Replace with actual password
${NEW_EMAIL}       neelpatel@gmail.com
${NEW_CONTACT}     0987654321
${NEW_FIRST}       Neel
${NEW_LAST}        Patel

*** Test Cases ***
User Login
    [Documentation]  Verify that a user can log in and update their details
    Open Browser  ${LOGIN_URL}  ${BROWSER}
    Title Should Be  User Login Page
    
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    css:input[type=submit]
    # Add verification point for successful login if needed

Update Details And Submit    
    Go To    ${PROFILE_URL}
    Title Should Be  User Profile  # Replace with the actual title of your update details page
    
    # Update user details (e.g., email) and submit the form
    Input Text    id=email         ${NEW_EMAIL}
    Input Text    id=phone         ${NEW_CONTACt}
    Input Text    id=first_name    ${NEW_FIRST}   
    Input Text    id=last_name     ${NEW_LAST} 
    Click Button    css:input[type=submit]
    Alert Should Be Present  Profile Updated Successfully
    
    Close Browser
