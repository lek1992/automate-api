*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String
Resource    ${CURDIR}/../resource/REQRES_API.resource

*** Test Case ***
TC01: GET LIST USERS DATA FOUND
    Send request api method get || delete    
    ...    method=GET    
    ...    apiName=LIST USERS     
    ...    endPointUrl=/api/users?page=2
    Should Be Equal As Integers       ${response.status_code}     200
