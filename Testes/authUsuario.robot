*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String

*** Variable ***
${BASE_URL}         http://localhost:3333


*** Keywords ***
Conectar no serviço
    Create Session  bfriend     ${BASE_URL}
    

*** Test Case ***
Realizar Login na Aplicação
    Conectar no serviço
    &{data}=    Create Dictionary    Email=GabrielRuiz@gmail.com    Senha=Gabriel123
    ${resp}=    Post Request    bfriend     /login      json=${data}
    Status Should Be  200       ${resp}

Realizar Cadastro na Aplicação
    Conectar no serviço
    ${Random_nome}=      Generate Random String    10    [LETTERS]
    ${Random_email}=     Generate Random String    7     [LETTERS]
    ${Random_senha}=     Generate Random String    5     
    &{data}=    Create Dictionary   Nome=${Random_nome}    Email=${Random_email}@gmail.com    Senha=${Random_senha} 
    ${resp}=    Post Request    bfriend     /register      json=${data}
    Status Should Be  200       ${resp}
