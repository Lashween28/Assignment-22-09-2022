*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_button}    //button[@id='dt_login_button']

*** Test Cases ***
Q4
    Open Browser   https://app.deriv.com/   chrome
    Maximize Browser Window
    Wait Until Page Contains Element    //div[@class='btn-purchase__text_wrapper' and contains(.,'Rise')]    30
    Click Element   dt_login_button
    Wait Until Page Contains Element  //input[@type='email']  10
    Input Text    //input[@type='email']    lashweenraj@besquare.com.my
    Input Text    //input[@type='password']    Lashween28
    Click Element  //button[@type='submit'] 
    Wait Until Page Contains Element   dt_core_account-info_acc-info    30
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    20
     Click Element   //div[@id='dt_core_account-info_acc-info']    
    Click Element   //li[@id='real_account_tab']
    Click Element   //li[@id='dt_core_account-switcher_demo-tab']
    Wait Until Page Contains Element    //div[@class='btn-purchase__info btn-purchase__info--right']    30
    Click Element   //div[@class='cq-symbol-select-btn__container']
    Wait Until Page Contains Element    //*[@class="ciq-menu ciq-enabled cq-chart-title stx-show cq-symbols-display stxMenuActive"]
    Sleep    10
    Click Element    //*[contains(text(),'Forex')]
    Wait Until Page Contains Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ' and contains(.,'AUD/USD')]    50
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ' and contains(.,'AUD/USD')]
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    20
    Click Element    //*[@class='contract-type-widget__display']
    Click Element    //*[@id='dt_contract_high_low_item']
    Click Element    //*[@class='dc-input__field']
    Press Keys    none    BACKSPACE+1
    Press Keys    //div[@class='dc-input-field trade-container__barriers-single']    CTRL+A+BACKSPACE
    Input Text    dt_barrier_1_input    -0.11111
    Sleep    2
    Click Element    //button[@id='dt_purchase_put_button']
    [Teardown]    Close Browser