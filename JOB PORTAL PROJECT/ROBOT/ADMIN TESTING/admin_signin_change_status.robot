*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}           Chrome
${ADMIN_LOGIN_URL}   http://127.0.0.1:8000/admin_login
${STATUS}            /change_status/12/
${APPLICANTS_URL}    http://127.0.0.1:8000/view_applicants/
${DELETE}            /delete_applicant/26/
${ADMIN_USERNAME}    panesar
${ADMIN_PASSWORD}    panesar
${COMPANY_NAME}      Microsoft

*** Test Cases ***
Admin Login
    Open Browser  ${ADMIN_LOGIN_URL}  ${BROWSER}
    Title Should Be  Admin Login
    
    Input Text    id=username    ${ADMIN_USERNAME}
    Input Text    id=password    ${ADMIN_PASSWORD}
    Click Button    css:input[type=submit]


Change status of a company    
    Click Link    ${STATUS}
    Input Text  id=company_name  Microsoft
    Select From List by Value    id=status    Rejected
    Click Button    css:input[type=submit]
    Alert Should Be Present  Status changed successfully.
    Click Link    ${STATUS}
    Input Text  company_name  Microsoft
    Select From List by Value    id=status    Accepted
    Click Button    css:input[type=submit]
    Alert Should Be Present  Status changed successfully.

#Delete User   
    #Go To    ${APPLICANTS_URL}
    #Title Should Be  All Applicants
    #Click Link    ${DELETE}
    #Alert Should Be Present  Are you sure you want to delete this applicant?
    Close Browser