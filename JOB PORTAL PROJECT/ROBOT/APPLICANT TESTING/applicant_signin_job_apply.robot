*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${RESUME_NAME}    sample_resume.pdf
${RESUME_PATH}    ${EXECDIR}${/}${RESUME_NAME}

# URLs - Replace placeholders with actual values
${LOGIN_URL}      http://127.0.0.1:8000/user_login
${ALL_JOBS}       http://127.0.0.1:8000/all_jobs/

# User credentials - Replace with valid credentials
${USERNAME}       ravneet@gmail.com
${PASSWORD}       ravneet

*** Test Cases ***
Open Website
    [Documentation]  This test case verifies that the user is able to open the URL
    Open Browser  ${LOGIN_URL}  ${Browser}

User Login
    [Documentation]    Ensure a user can log in
    # Perform login
    Input Text    id=username    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Button    css:input[type=submit]
    
Navigate to Another Page for viewing Jobs
    [Documentation]    This test case navigates to another page after logging in
    Go To           ${ALL_JOBS}

Apply for a job
    [Documentation]  This test case applies a job
    Click Link   /job_detail/7/
    Click Link   /job_apply/7/
    Alert Should Be Present    Date for applying has been closed
    Click Link   /job_detail/8/
    Click Link   /job_apply/8/
    Choose File    id=resume    ${RESUME_PATH}
    Click Button    css:input[type=submit]
    Alert Should Be Present    Resume Submitted Successfully
    Click Link   /job_detail/9/
    Click Link   /job_apply/9/
    Alert Should Be Present    Date for applying has not yet started
    
    Close Browser
