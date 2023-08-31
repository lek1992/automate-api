*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String
Resource    ${CURDIR}/../resource/REQRES_API.resource

*** Test Case ***
TC07: DELETE USER
    Send request api method get || delete  
    ...    method=DELETE    
    ...    apiName=USER     
    ...    endPointUrl=/api/users/2
    Should Be Equal As Integers       ${response.status_code}     204