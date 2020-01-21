*** Settings *** 
Documentation    Ejemplo de mi primer Test con Selenium - Login miOrangeApp Movilizado
#Incluimos la libreria de Selenium
Library    SeleniumLibrary
Suite Setup    NONE
Test Setup    NONE
Test Teardown    Run Keyword If Test Failed    Close Browser
Suite Teardown    Close All Browsers

*** Variables ***
#definimos una variable de tipo Texto donde almacenaremos el navegador a utilizar
${BROWSER}     chrome
#definimos una variable de tipo Texto donde almacenaremos la URL de acceso
${URL}    https://areaprivada.orange.es/movilizado/index.html
#Definimos una variable de tipo Diccionario donde almacenaremos las credenciales
&{CREDENTIALS}    MSISDN=655758100    PASS=zxcvbnm,

***Test Cases*
Login
    #escribimos las instrucciones que la libreria selenium me proporciona para abrir el navegador
    SeleniumLibrary.Open Browser    ${URL}    ${BROWSER}
    SeleniumLibrary.Set Window Size    400    800
    SeleniumLibrary.Set Window Position    0    0
    SeleniumLibrary.Set Browser Implicit Wait    30
    #escribimos las instrucciones que la libreria selenium me proporciona para rellenar los campos y hacer login
    SeleniumLibrary.Input Text    Id=tag_ut_input_msisdn    &{CREDENTIALS}[MSISDN]
    SeleniumLibrary.Input Text    Id=tealeaf_user_password     &{CREDENTIALS}[PASS]
    SeleniumLibrary.Click Button    Id=tag_ut_button_msisdn
    Sleep    30
    SeleniumLibrary.Close All Browsers