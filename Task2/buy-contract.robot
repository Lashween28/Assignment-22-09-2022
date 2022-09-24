*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${purchase_amount}    10.00
${purchase_action}    Rise
${market_type}    Volatility 10 (1s) Index


*** Test Cases ***
Login to Deriv and Buy Rise Contract

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
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    20
    
Buy Rise Contract For Volatility 10(1s) Index Rise

    #Choosing Volatility Symbol
    Click Element   //div[@class='cq-symbol-select-btn']
    Sleep    7
    Wait Until Element Is Visible   //div[@class='sc-mcd__item sc-mcd__item--1HZ10V ']
    Click Element   //div[@class='sc-mcd__item sc-mcd__item--1HZ10V ']  
    Sleep    5

    # Check we have Volatility
    Wait Until Page Contains    Volatility 10 (1s) Index    10
    Page Should Contain    Volatility 10 (1s) Index

    #Check the duration is in 5 ticks
    Wait Until Page Contains    5 Ticks    10
    Page Should Contain    5 Ticks
    
    #Check we are in Stake mode
    Wait Until Element Is Visible    //button[@class='dc-btn dc-btn__toggle dc-button-menu__button dc-button-menu__button--active']    10
    Page Should Contain Element    //button[@class='dc-btn dc-btn__toggle dc-button-menu__button dc-button-menu__button--active']

    #Check the stake amount is in 10usd
    Wait Until Element Is Visible    //input[@id='dt_amount_input' and @value='10']    10
    Page Should Contain Element    //input[@id='dt_amount_input' and @value='10']
    
    # Purchase buy Contract
    Wait Until Element Is Visible    //div[@class='btn-purchase__info btn-purchase__info--right']    10
    Click Element    //div[@class='btn-purchase__info btn-purchase__info--right']

    # Last check to see whether the contract is purchase
    Wait Until Element Is Visible   //div[@class='positions-drawer__header']    10
    Page Should Contain Element    //div[@class='positions-drawer__header']
    Wait Until Element Is Visible    //a[@class='dc-result__caption-wrapper']    30







