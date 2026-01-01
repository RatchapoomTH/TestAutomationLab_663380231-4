*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    C:/ChromeForTesting/chrome-win64/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}     C:/ChromeForTesting/chromedriver-win64/chromedriver-win64/chromedriver.exe
${URL}    http://localhost:7272/TestAutomationLab_663380231-4/StarterFiles/Registration.html 
${delay}    5s

*** Test Cases ***
TC_01_2 Register Success
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${options.binary_location}=    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    
    Create Webdriver    Chrome    options=${options}    service=${service}
    Set Selenium Speed    ${delay}
    Go To    ${URL}

    Input Text    id=firstname    Somyod
    Input Text    id=lastname    Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email    somyod@kkumail.com
    Input Text    id=phone    091-001-1234
    Click Button    id=registerButton

    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    Close Browser