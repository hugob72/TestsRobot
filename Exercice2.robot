*** Settings ***
Documentation        Exercice 2 : Recherche d'article sur un site de e-commerce en ligne
Library             SeleniumLibrary

*** Variables ***    
${LOGIN URL AMAZON}        https://www.amazon.fr/
${LOGIN URL CDISCOUNT}        https://www.cdiscount.com/
${BUTTON ACCEPT COOKIES AMAZON}    //*[@id="sp-cc-accept"]
${SEARCH BAR AMAZON}    //*[@id="twotabsearchtextbox"]
${BUTTON ACCEPT COOKIES CDISCOUNT}    //*[@id="footer_tc_privacy_button_3"]
${SEARCH BAR CDISCOUNT}    //*[@id="search"]
${BROWSER}        ff
${ELEMENT NOT CONTAIN AMAZON}    xpath://*[contains(text(), "Aucun résultat pour")]
${ELEMENT NOT CONTAIN CDISCOUNT}    xpath//*[contains(text(),"Malheureusement, nous ne trouvons aucun produit correspondant à")]

*** Test Cases ***
Ouvrir AMAZON dans le navigateur
    Open Browser    ${LOGIN URL AMAZON}    ${BROWSER}
    Maximize Browser Window
Accepter les cookies AMAZON
    Click Element    ${BUTTON ACCEPT COOKIES AMAZON}
Chercher un produit sur AMAZON
    Click element    ${SEARCH BAR AMAZON}
    Input Text    name=field-keywords    Asus
    Sleep    2
    Press Keys    name=field-keywords    RETURN
    sleep    1
Vérifications AMAZON
    Page Should Not Contain    ${ELEMENT NOT CONTAIN AMAZON}
    # Title Should Be    Amazon
Fermer le navigateur AMAZON
    sleep    1
    Close Browser

    

Ouvrir CDISCOUNT dans le navigateur
    Open Browser    ${LOGIN URL AMAZON}    ${BROWSER}
    Maximize Browser Window
Accepter les cookies CDISCOUNT
    Click Element    ${BUTTON ACCEPT COOKIES AMAZON}
Chercher un produit CDISCOUNT
    Click element    ${SEARCH BAR AMAZON}
    Input Text    name=search    Asus
    Sleep    2
    Press Keys    name=search    RETURN
    sleep    1
Vérifications CDISCOUNT
    Page Should Not Contain    ${ELEMENT NOT CONTAIN CDISCOUNT}
    # Title Should Be    Asus
Fermer le navigateur CDISCOUNT
    sleep    1
    Close Browser
    

*** Keywords ***