*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variable ***
${BASE_URL}         http://localhost:3333

*** Test Case ***
Validar listagem de anuncios por paginação
    Conectar no serviço
    Realizar listagem de anuncios por pagina: "1"

Validar filtro de anuncio por Categoria
    Conectar no serviço
    Listar anuncios por id da categoria: "2"


Validar filtro de anuncio especifico
    Conectar no serviço
    Realizar listagem de um anuncio por id "1"

Validar filtro de anuncios por proximidade
    Conectar no serviço
    Listar anuncios por Cidade: "Santos", Bairro: "Centro" e IdCategoria: "3"


*** Keywords ***
Conectar no serviço
    Create Session  bfriend     ${BASE_URL}

Realizar listagem de anuncios por pagina: "${id}"
    Conectar no serviço
    ${resp}=    Get Request    bfriend     /anuncios?page=${id}
    Status Should Be  200       ${resp}   

Listar anuncios por id da categoria: "${id}"
    Conectar no serviço
    ${resp}=    Get Request    bfriend     /anuncios/categoria/${id}
    Status Should Be  200       ${resp}
    
Realizar listagem de um anuncio por id "${id}"
    Conectar no serviço
    ${resp}=    Get Request    bfriend     /anuncio/${id}
    Status Should Be  200       ${resp}

Listar anuncios por Cidade: "${cidade}", Bairro: "${bairro}" e IdCategoria: "${idcategoria}"
    Conectar no serviço
    ${resp}=    Get Request    bfriend     /anuncios/filtro?Cidade=${cidade}&Bairro=${bairro}&Categoria=${idcategoria}
    Status Should Be  200       ${resp}
