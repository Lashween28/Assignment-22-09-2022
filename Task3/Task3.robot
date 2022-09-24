*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${duration}    4
${purchase_amount}    15.50
${purchase_action}    Lower
${market_type}    AUD/USD

*** Test Cases ***
Login to Deriv and Buy Lower Contract

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
    Click Element   //div[@class='dc-content-expander__content']
    Wait Until Page Does Not Contain Element    //*[@aria-label="Loading interface..."]    20


#Choose Forex pair
    
    Click Element    //div[@class='cq-symbol']
    Wait Until Element Is Visible    //span[@class='ic-icon ic-forex']
    Click Element    //span[@class='ic-icon ic-forex']
    Wait Until Element Is Visible    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ']    10
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--frxAUDUSD ']

#Change Trade Type
    
    
    Wait Until Element Is Visible    //span[@name='contract_type']    10
    Click Element    //span[@name='contract_type']

#Select High/Low and verify whether correct

    Wait Until Element Is Enabled    //div[@id='dt_contract_high_low_item']    10
    Click Element    //div[@id='dt_contract_high_low_item']
    Wait Until Page Contains    Higher/Lower    10
    Page Should Contain    Higher/Lower
    
#Changing Duration Type and Days
     
    Click Element    //button[@id='dc_duration_toggle_item']
    Press Keys    //input[@class='dc-input__field']    CTRL+a+DELETE
    Input Text    //input[@class='dc-input__field']    ${duration} 
    
#Change Payout Amount

    Click Button    dc_payout_toggle_item
    Press Keys    //input[@id='dt_amount_input']    CTRL+a+DELETE
    Input Text    //input[@id='dt_amount_input']    ${purchase_amount}
    Wait Until Page Contains Element   //div[@class="purchase-container" and contains(.,'Lower')]  30


