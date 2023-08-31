*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String
Resource    ${CURDIR}/../resource/REQRES_API.resource

*** Test Case ***
TC04: POST USER
    Send request api method post || patch || put
    ...    method=POST    
    ...    apiName=USER     
    ...    endPointUrl=/api/users
    ...    requestFromFile=POST_USER.json
    Should Be Equal As Integers       ${response.status_code}     201