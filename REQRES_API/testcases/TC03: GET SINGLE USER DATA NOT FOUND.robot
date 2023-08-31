*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String
Resource    ${CURDIR}/../resource/REQRES_API.resource

*** Test Case ***
TC03: GET SINGLE USER DATA NOT FOUND
    Send request api method get || delete   
    ...    method=GET    
    ...    apiName=SINGLE USER     
    ...    endPointUrl=/api/users/23
    Should Be Equal As Integers       ${response.status_code}     404
