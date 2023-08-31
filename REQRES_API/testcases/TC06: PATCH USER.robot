*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String
Resource    ${CURDIR}/../resource/REQRES_API.resource

*** Test Case ***
TC06: PATCH USER
    Send request api method post || patch || put   
    ...    method=PATCH    
    ...    apiName=USER     
    ...    endPointUrl=/api/users/2
    ...    requestFromFile=PATCH_USER.json
    Should Be Equal As Integers       ${response.status_code}     200