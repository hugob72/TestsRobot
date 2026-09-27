*** Settings ***
Documentation        Exercice 3 : Gestion des données de test via un fichier CSV
Library             Selenium2Library
Library            DataDriver    jdd.csv
Test Setup    Ouvrir SauceDemo dans le navigateur
Test Teardown    Fermeture du navigateur
Resource    Exercice3Resources.robot
Test Template    Se connecter avec des identifiants non valides


*** Keywords ***
Ouvrir SauceDemo dans le navigateur
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
Fermeture du navigateur
    Close Browser
Se connecter avec des identifiants non valides
    [Arguments]    ${USER}    ${PASSWORD}    ${ERROR_MESSAGE}
    Input Text    ${txtbox-username}    ${USER}
    Input Text    ${txtbox-password}    ${PASSWORD}
    Sleep    1
    Click Button    ${btn-seconnecter}
    Sleep    1
    Page Should Contain    ${ERROR_MESSAGE}    ${error-field}
    Sleep    1

*** Test Cases ***
Tests de la connexion avec des identifiants non valides    ${USER}    ${PASSWORD}    ${ERROR_MESSAGE}
