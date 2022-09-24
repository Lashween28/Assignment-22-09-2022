*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']


*** Test Cases ***
Login To Deriv
    Open Browser   https://app.deriv.com/   chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element   dt_login_button
    Wait Until Page Contains Element  //input[@type='email']  10
    Input Text    //input[@type='email']    Your email
    Input Text    //input[@type='password']    Your pw
    Click Element  //button[@type='submit'] 
    Wait Until Page Contains Element   dt_core_account-info_acc-info    30
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    20
    Click Element   //div[@id='dt_core_account-info_acc-info']    
    Click Element   //li[@id='real_account_tab']
    Click Element   //li[@id='dt_core_account-switcher_demo-tab']
    Click Element   //div[@class='dc-content-expander__content']
    Click Element   //li[@id='dt_core_account-switcher_demo-tab']
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    20
    
    
    