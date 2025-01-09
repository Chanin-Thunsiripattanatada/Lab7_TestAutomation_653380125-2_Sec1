*** Settings ***
Documentation   A test suite settings with a single test for fill the information into the form 
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Keywords ***
Open Form
    Start Chrome For Testing
    Open Browser To Form Page

*** Test Case ***
TC1_001: Open Form
    Open Form

TC1_002: Empty Destination
    Input Firstname    ${VALID FIRSTNAME}
    Input Lastname    ${VALID LASTNAME}
    Input Contact Person    ${VALID CONTACTPERSON}
    Input Relationship    ${VALID RELATIONSHIP}
    Input Email    ${VALID EMAIL}
    Input Phone    ${VALID PHONE}
    Submit Form
    Form Page Should Be Open
    Require Destination Should Be Open
    Close Browser

TC2_001: Open Form
    Open Form

TC2_002: Empty Email
    Input Firstname    ${VALID FIRSTNAME}
    Input Lastname    ${VALID LASTNAME}
    Input Destination    ${VALID DESTINATION}
    Input Contact Person    ${VALID CONTACTPERSON}
    Input Relationship    ${VALID RELATIONSHIP}
    Input Phone    ${VALID PHONE}
    Submit Form
    Form Page Should Be Open
    Require Email Should Be Open
    Close Browser
    
TC3_001: Open Form
    Open Form

TC3_002: Invalid Email
    Input Firstname    ${VALID FIRSTNAME}
    Input Lastname    ${VALID LASTNAME}
    Input Destination    ${VALID DESTINATION}
    Input Contact Person    ${VALID CONTACTPERSON}
    Input Relationship    ${VALID RELATIONSHIP}
    Input Email    ${INVALID EMAIL}
    Input Phone    ${VALID PHONE}
    Submit Form
    Form Page Should Be Open
    Require Email Should Be Open
    Close Browser

TC4_001: Open Form
    Open Form

TC4_002: Empty Phone Number
    Input Firstname    ${VALID FIRSTNAME}
    Input Lastname    ${VALID LASTNAME}
    Input Destination    ${VALID DESTINATION}
    Input Contact Person    ${VALID CONTACTPERSON}
    Input Relationship    ${VALID RELATIONSHIP}
    Input Email    ${VALID EMAIL}
    Submit Form
    Form Page Should Be Open
    Require Phone Should Be Open
    Close Browser

TC5_001: Open Form
    Open Form

TC5_002: Invalid Phone Number
    Input Firstname    ${VALID FIRSTNAME}
    Input Lastname    ${VALID LASTNAME}
    Input Destination    ${VALID DESTINATION}
    Input Contact Person    ${VALID CONTACTPERSON}
    Input Relationship    ${VALID RELATIONSHIP}
    Input Email    ${VALID EMAIL}
    Input Phone    ${INVALID PHONE}
    Submit Form
    Form Page Should Be Open
    Require Valid Phone Should Be Open
    Close Browser



    