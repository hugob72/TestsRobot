*** Settings ***
Documentation       Tests sur le formulaire de connexion
Library             SeleniumLibrary

*** Variables ***
${BROWSER}     ff
${LOGIN URL}     http://localhost:8080
${ID INPUT}     //*[@id="email"]
${PASSWORD INPUT}     //*[@id="password"]
${CONNECTION BUTTON}     css=button.login-button
${HOME CONTENT}     css=main div
${ERROR ID}     css=.login-card p

*** Test Cases ***
Connexion réussi
    Open Browser     ${LOGIN URL}     ${BROWSER}
    Maximize Browser Window
    Click Element     ${ID INPUT}
    Input Text     name=email     admin@admin.com
    Click Element     ${PASSWORD INPUT}
    Input Text     name=password     admin
    Click Button    ${CONNECTION BUTTON}
    Wait Until Element Contains    ${HOME CONTENT}    home    timeout=1s
    Close Browser

Identifiant inexistant
    Open Browser     ${LOGIN URL}     ${BROWSER}
    Maximize Browser Window
    Click Element     ${ID INPUT}
    Input Text     name=email     toto@toto.com
    Click Element     ${PASSWORD INPUT}
    Input Text     name=password     toto
    Click Button    ${CONNECTION BUTTON}
    Wait Until Element Contains    ${ERROR ID}    Email ou mot de passe incorrect    timeout=1s
    Close Browser

Mot de passe faux
    Open Browser     ${LOGIN URL}     ${BROWSER}
    Maximize Browser Window
    Click Element     ${ID INPUT}
    Input Text     name=email     admin@admin.com
    Click Element     ${PASSWORD INPUT}
    Input Text     name=password     toto
    Click Button    ${CONNECTION BUTTON}
    Wait Until Element Contains    ${ERROR ID}    Email ou mot de passe incorrect    timeout=1s
    Close Browser