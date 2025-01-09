
*** Settings ***
Documentation   A test suite settings with a single test for fill the information into the form 
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Case ***
TC_001: Open Form Page
    Start Chrome For Testing
    Open Browser To Form Page

TC_002: Record Success
    Input Firstname    ${VALID FIRSTNAME}
    Input Lastname    ${VALID LASTNAME}
    Input Destination    ${VALID DESTINATION}
    Input Contact Person    ${VALID CONTACTPERSON}
    Input Relationship    ${VALID RELATIONSHIP}
    Input Email    ${VALID EMAIL}
    Input Phone    ${VALID PHONE}
    Submit Form
    Complete Page Should Be Open
    Close Browser

