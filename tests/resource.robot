*** Settings ***
Documentation       A resource file with reusable keywords and variables.
...
...                 The system specific keywords created here form our own
...                 domain specific language. They utilize keywords provided
...                 by the imported SeleniumLibrary.
Library             SeleniumLibrary
Library             URLFormatter
Library             SeleniumLibraryHelper

*** Variables ***
${BROWSER}          chrome
${DELAY}            0
${ROOT_URL}         https://ru.wikipedia.org
${MAIN_PAGE}        ${ROOT_URL}/wiki/Заглавная_страница

*** Keywords ***
Open incognito browser
    ${options}=    Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${options}    add_argument    incognito
    Create WebDriver    Chrome    chrome_options=${options}
    Set Selenium Speed    ${DELAY}
    Maximize Browser Window

Open main Wikipedia page
    Open incognito browser
    Go To    ${MAIN_PAGE}
    Main Wikipedia page is open

Open the article page
    [Arguments]  ${article}
    Open incognito browser
    Go To    ${ROOT_URL}/wiki/${article}
    Title should be  ${article} — Википедия

Main Wikipedia page is open
    Title Should Be    Википедия — свободная энциклопедия

Search for
    [Arguments]  ${query}
    Input Text    searchInput    ${query}
    click button  searchButton

Page Should Be Open
    [Arguments]  ${page_title}
    ${url_converted_title}=     convert to url format  ${page_title}
    Location Should Be    ${ROOT_URL}/wiki/${url_converted_title}
    Title Should Be    ${PAGE_TITLE} — Википедия
