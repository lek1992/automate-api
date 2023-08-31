*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String
Resource    ${CURDIR}/../resource/REQRES_API.resource

*** Test Case ***
TC02: GET SINGLE USER DATA FOUND
    Send request api method get || delete   
    ...    method=GET    
    ...    apiName=SINGLE USER     
    ...    endPointUrl=/api/users/2
    Should Be Equal As Integers       ${response.status_code}     200
