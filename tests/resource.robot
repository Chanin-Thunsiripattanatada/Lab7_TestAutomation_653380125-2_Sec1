*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Chrome
${EXECDIR}        .
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome.exe
${CHROME_DRIVER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe
${DELAY}          0.3
${VALID FIRSTNAME}     Somsong
${VALID LASTNAME}    Sandee
${VALID DESTINATION}     Europe
${VALID CONTACTPERSON}    Sodsai Sandee
${VALID RELATIONSHIP}     Mother
${VALID EMAIL}    somsong@kkumail.com
${VALID PHONE}    081-111-1234
${INVALID EMAIL}    somsong@
${INVALID PHONE}  191
${FORM URL}    http://${SERVER}/Form.html
${COMPLETE URL}      http://${SERVER}/Complete.html

*** Keywords ***

Start Chrome For Testing
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
    # [selenium >= 4.10] `chrome_options` change to `options`
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}

Open Browser To Form Page
    Go To    ${FORM URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Form Page Should Be Open

Form Page Should Be Open
    Location Should Be    ${FORM URL}
    Title Should Be    Customer Inquiry

Complete Page Should Be Open
    Location Should Be    ${COMPLETE URL}
    Title Should Be    Completed
    Wait Until Page Contains    Our agent will contact you shortly.
    Wait Until Page Contains    Thank you for your patient.

Require Destination Should Be Open
    Location Should Be    ${FORM URL}
    Title Should Be    Customer Inquiry
    Element Should Be Visible    id=errors
    ${error_text}=    Get Text    id=errors
    Log    Error Text: ${error_text}
    Should Be Equal    ${error_text}    Please enter your destination.

Require Email Should Be Open
    Location Should Be    ${FORM URL}
    Title Should Be    Customer Inquiry
    Element Should Be Visible    id=errors
    ${error_text}=    Get Text    id=errors
    Log    Error Text: ${error_text}
    Should Be Equal    ${error_text}    Please enter a valid email address.   

Require Phone Should Be Open
    Location Should Be    ${FORM URL}
    Title Should Be    Customer Inquiry
    Element Should Be Visible    id=errors
    ${error_text}=    Get Text    id=errors
    Log    Error Text: ${error_text}
    Should Be Equal    ${error_text}    Please enter a phone number.

Require Valid Phone Should Be Open
    Location Should Be    ${FORM URL}
    Title Should Be    Customer Inquiry
    Element Should Be Visible    id=errors
    ${error_text}=    Get Text    id=errors
    Log    Error Text: ${error_text}
    Should Be Equal    ${error_text}    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)

Input Firstname
    [Arguments]    ${firstname}
    Input Text    firstname    ${firstname}

Input Lastname
    [Arguments]    ${lastname}
    Input Text    lastname    ${lastname}

Input Destination
    [Arguments]    ${destination}
    Input Text    destination    ${destination}

Input Contact Person
    [Arguments]    ${contactperson}
    Input Text    contactperson    ${contactperson}

Input Relationship
    [Arguments]    ${relationship}
    Input Text    relationship    ${relationship}

Input Email
    [Arguments]    ${email}
    Input Text    email    ${email}

Input Phone
    [Arguments]    ${phone}
    Input Text    phone    ${phone}

Submit Form
    Click Button    submitButton

Close Browser
    Close Browser
