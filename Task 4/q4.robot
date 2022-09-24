*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${duration}    4
${purchase_amount}    10
${purchase_action}    Lower
${market_type}    AUD/USD
${barrier_value}    -1


*** Test Cases ***
Login To Deriv and Check Barrier error
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
# Set payout to 15.50 USD
    Page Should Contain Element    //input[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value='15.50']
    Click Element    //input[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input']
    Press Keys    None    CTRL+A
    Press Keys    None    BACKSPACE
    Press Keys    None    1 + 0
    Wait Until Element Is Visible    //input[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value='10']    10
    Page Should Contain Element    //input[@class='dc-input-wrapper__input input--has-inline-prefix input trade-container__input' and @value='10']
    # Change Barrier to +0.1
    Click Element    //input[@id='dt_barrier_1_input']
    Press Keys    None    CTRL+A
    Press Keys    None    BACKSPACE
    Press Keys    None    + + 0 + . + 1
    # Check that error message is present and trade disabled
    Wait Until Page Contains    Contracts more than 24 hours in duration would need an absolute barrier    10
    Page Should Contain Element    //div[@class='trade-container__fieldset-wrapper trade-container__fieldset-wrapper--disabled']
    Page Should Contain    Contracts more than 24 hours in duration would need an absolute barrier
