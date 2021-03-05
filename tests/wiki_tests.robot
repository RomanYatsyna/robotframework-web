*** Settings ***
Documentation     A test suite for Wikipedia search
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Test Teardown     Close Browser

*** Test Cases ***
Search from the main page
    Open main Wikipedia page
    Search for  Шри-Ланка
    Page Should Be Open  Шри-Ланка

Search from the article page
    Open the article page  Таиланд
    Search for  Бали
    Page Should Be Open  Бали1
