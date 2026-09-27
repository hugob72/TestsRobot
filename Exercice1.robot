*** Settings ***
Documentation        Exercice 1 : Se connecter à une application web
Library             SeleniumLibrary

*** Variables ***
${LOGIN URL}        https://google.Fr
${BROWSER}        ff
${URL2}        //
${SEARCHBAR}    //*[@id="W0wltc"]

*** Test Cases ***
Ouvrir Google dans le navigateur
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
Chercher le site de l'université
    Click element    ${SEARCHBAR}
    Input Text    name=q    Le Mans Université
    Sleep    2
    Press Keys    name=q    RETURN
    sleep    1
Aller sur l'ENT
    Click Element    //*[@class="l" and contains(text(),"ENT")]
    Click Element    //*[@id="bouton-etudiant"]
    Click Element    //*[@id="header-a1"]
Fermeture du navigateur
    Sleep    1
    Close Browser
    

*** Keywords ***