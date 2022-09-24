*** Settings ***
Library     SeleniumLibrary



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
# Changing market
    Click Element    //div[@class='cq-symbol']
    Wait Until Element Is Visible    //span[@class='ic-icon ic-synthetic_index']    10
    Click Element    //span[@class='ic-icon ic-synthetic_index']
    Wait Until Element Is Visible    //div[@class='sc-mcd__item sc-mcd__item--R_50 ']    10
    Click Element    //div[@class='sc-mcd__item sc-mcd__item--R_50 ']
# Changing contract type
    Wait Until Element Is Visible    //span[@name='contract_type']    10
    Click Element    //span[@name='contract_type']
# Choose Higher/Lower
    Wait Until Element Is Visible    //div[@id='dt_contract_multiplier_item']    10
    Click Element    //div[@id='dt_contract_multiplier_item']
# Should not have payout option only Stake is allowed
    Page Should Not Contain    Payout
