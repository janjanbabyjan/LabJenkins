*** Settings ***
Documentation     Test suite for Google.com search functionality
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${BROWSER}        chrome
${URL}            https://www.google.com
${SEARCH_TERM}    Robot Framework
${LANG_BUTTON}    xpath=//*[contains(text(), 'English')]

*** Test Cases ***
Open Google Homepage
    [Documentation]    Verify Google homepage loads correctly
    [Tags]    smoke    homepage
    Open Browser To Google
    Verify Google Logo Is Visible
    [Teardown]    Close Browser

Perform Basic Search
    [Documentation]    Test basic search functionality
    [Tags]    smoke    search
    Open Browser To Google
    Accept Cookies If Present
    Input Search Term    ${SEARCH_TERM}
    Submit Search
    Verify Search Results Are Visible
    [Teardown]    Close Browser

Verify Google Search Features
    [Documentation]    Test various Google search features
    [Tags]    functional    search
    Open Browser To Google
    Accept Cookies If Present
    Input Search Term    ${SEARCH_TERM}
    Verify Search Suggestions Appear
    Submit Search
    Verify Search Tools Are Available
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Google
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=q    timeout=10s

Accept Cookies If Present
    ${cookies_present}=    Run Keyword And Return Status    
    ...    Page Should Contain Element    xpath=//*[contains(text(), 'Accept all')]
    Run Keyword If    ${cookies_present}    Click Element    xpath=//*[contains(text(), 'Accept all')]
    
Verify Google Logo Is Visible
    Wait Until Element Is Visible    css=img[alt*='Google']    timeout=10s
    Page Should Contain Element    css=img[alt*='Google']

Input Search Term
    [Arguments]    ${term}
    Input Text    name=q    ${term}

Submit Search
    Press Keys    name=q    RETURN
    Wait Until Element Is Visible    id=search    timeout=10s

Verify Search Results Are Visible
    Wait Until Page Contains Element    id=search    timeout=10s
    Page Should Contain Element    css=div[class*='g']
    Page Should Not Contain    Your search did not match any documents

Verify Search Suggestions Appear
    Wait Until Element Is Visible    css=div[role='listbox']    timeout=5s
    Page Should Contain Element    css=div[role='presentation']

Verify Search Tools Are Available
    Wait Until Element Is Visible    id=hdtb    timeout=10s
    Page Should Contain Element    css=div[class*='hdtb-mitem']

*** Settings ***
Suite Setup       Set Screenshot Directory    ${OUTPUTDIR}/screenshots
Suite Teardown    Close All Browsers
Test Timeout      1 minute