*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Simple Test
    Open Browser    https://www.google.com    chrome
    Title Should Be    Google
    Close Browser
