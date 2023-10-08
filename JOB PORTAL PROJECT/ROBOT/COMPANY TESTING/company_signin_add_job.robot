*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}              Chrome
${COMPANY_LOGIN_URL}    http://127.0.0.1:8000/company_login
${ADD_JOB_URL}          http://127.0.0.1:8000/add_job
${COMPANY_USERNAME}     Microsoft
${COMPANY_PASSWORD}     microsoft
${JOB_TITLE}            Software Engineer
${START_DATE}           08-10-2023
${END_DATE}             30-10-2023
${EXPERIENCE}           2 Years
${SALARY}               700000
${SKILLS}               Python, Django
${LOCATION}             Remote
${DESCRIPTION}          Develop and maintain software.

*** Test Cases ***
Company Login
    [Documentation]  Verify that the company login page can be opened
    Open Browser  ${COMPANY_LOGIN_URL}  ${BROWSER}
    Title Should Be  Company Login 
    
    Input Text    id=username    ${COMPANY_USERNAME}
    Input Text    id=password    ${COMPANY_PASSWORD}
    Click Button    css:input[type=submit]

Navigate to Add Job Page
    [Documentation]    This test case navigates to add jobs page
    Go To    ${ADD_JOB_URL}
    Title Should Be  Add Jobs

Add Job
    [Documentation]  This test case adds new job listing    
    Input Text    id:job_title    ${JOB_TITLE}
    Input Text    id:start_date    ${START_DATE}
    Input Text    id:end_date    ${END_DATE}
    Input Text    id:experience    ${EXPERIENCE}
    Input Text    id:salary    ${SALARY}
    Input Text    id:skills    ${SKILLS}
    Input Text    id:location    ${LOCATION}
    Input Text    id:description    ${DESCRIPTION}
    Click Button    css:input[type=submit]
    Alert Should Be Present  Job added successfully.
    
Close Browser
    [Documentation]  Close the browser after tests
    Close Browser