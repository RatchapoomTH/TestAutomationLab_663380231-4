*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    C:/ChromeForTesting/chrome-win64/chrome-win64/chrome.exe
${CHROME_DRIVER_PATH}     C:/ChromeForTesting/chromedriver-win64/chromedriver-win64/chromedriver.exe
${URL}    http://localhost:7272/TestAutomationLab_663380231-4/StarterFiles/Registration.html 
${delay}    0.1s

*** Test Cases ***
TC_02_5: Empty Phone Number
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
    Click Button    id=registerButton

    Page Should Contain    Please enter your phone number!!
    Capture Page Screenshot    lab4_2_5_TC_04.png
    Close Browser