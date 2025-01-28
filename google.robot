*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Simple Test
    Open Browser    https://www.google.com    chrome    options=add_argument("--headless"); add_argument("--no-sandbox")
    Title Should Be    Google
    Close Browser