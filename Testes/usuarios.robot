*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variable ***
${BASE_URL}         http://localhost:3333

*** Test Case ***
Validar todos os usuarios cadastrados
    Conectar no Serviço
    Consulta de usuarios cadastrados

Validar dados do usuario logado
    Conectar no Serviço
    Consulta de perfil do usuario

*** Keywords ***
Conectar no Serviço
    Create Session  bfriend     ${BASE_URL}

Consulta de usuarios cadastrados
    ${resp}=        Get Request   bfriend    /usuarios
    Status Should Be  200       ${resp}

Consulta de perfil do usuario
    ${token}=       Create Dictionary       auth-token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOlt7IklkVXN1YXJpbyI6NCwiSWRUaXBvVXN1YXJpbyI6MiwiSWRGb3JuZWNlZG9yIjo0fV0sImlhdCI6MTU5NTk5MDk3OH0.eRi93l0WSUpCEbzWhwl6QEe-WpU5JWzefPyoRsBQm8o      
    ${resp}=        Get Request   bfriend    /profile   headers=${token}
    Status Should Be  200       ${resp} 
