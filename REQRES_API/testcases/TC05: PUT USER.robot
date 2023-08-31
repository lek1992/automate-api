*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String
Resource    ${CURDIR}/../resource/REQRES_API.resource

*** Test Case ***
TC05: PUT USER
    Send request api method post || patch || put    
    ...    method=PUT    
    ...    apiName=USER     
    ...    endPointUrl=/api/users/2
    ...    requestFromFile=PUT_USER.json
    Should Be Equal As Integers       ${response.status_code}     200