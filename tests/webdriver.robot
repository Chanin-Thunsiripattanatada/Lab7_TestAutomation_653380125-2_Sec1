*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${EXECDIR}        .
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome.exe
${CHROME_DRIVER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe
${URL}    https://www.kku.ac.th

*** Test Cases ***
TC_001: Start Chrome For Testing
  ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
  ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
  ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")
  # [selenium >= 4.10] `chrome_options` change to `options`
  Create Webdriver    Chrome    options=${chrome_options}    service=${service}
  Go To    ${URL}