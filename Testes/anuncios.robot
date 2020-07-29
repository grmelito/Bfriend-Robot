*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variable ***
${BASE_URL}         http://localhost:3333

*** Test Case ***
Realizar listagem de anuncios por pagina
    Conectar no serviço
    ${resp}=    Get Request    bfriend     /anuncios?page=1
    Status Should Be  200       ${resp}

Realizar listagem de anuncios por categoria
    Conectar no serviço
    ${resp}=    Get Request    bfriend     /anuncios/categoria/2
    Status Should Be  200       ${resp}

Realizar listagem de anuncio especifico
    Conectar no serviço
    ${resp}=    Get Request    bfriend     /anuncio/3
    Status Should Be  200       ${resp}

Realizar listagem de anuncios por categoria
    Conectar no serviço
    ${resp}=    Get Request    bfriend     /anuncios/filtro?Cidade=Santos&Categoria=2
    Status Should Be  200       ${resp}

*** Keywords ***
Conectar no serviço
    Create Session  bfriend     ${BASE_URL}
    
