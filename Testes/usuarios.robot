*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variable ***
${BASE_URL}         http://localhost:3333

*** Test Case ***
Consulta de usuarios cadastrados
    Create Session  bfriend     ${BASE_URL}
    ${resp}=        Get Request   bfriend    /usuarios
    Status Should Be  200       ${resp}
    

Consulta de perfil do usuario
    ${token}=       Create Dictionary       auth-token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOlt7IklkVXN1YXJpbyI6NCwiSWRUaXBvVXN1YXJpbyI6MiwiSWRGb3JuZWNlZG9yIjo0fV0sImlhdCI6MTU5NTk5MDk3OH0.eRi93l0WSUpCEbzWhwl6QEe-WpU5JWzefPyoRsBQm8o
    Create Session  bfriend     ${BASE_URL}       
    ${resp}=        Get Request   bfriend    /profile   headers=${token}
    Status Should Be  200       ${resp} 