*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String
Resource    ${CURDIR}/../resource/REQRES_API.resource

*** Test Case ***
TC08: POST REGISTER BAD REQUEST
    Send request api method post || patch || put 
    ...    method=POST    
    ...    apiName=REGISTER     
    ...    endPointUrl=/api/register
    ...    requestFromFile=POST_REGISTER.json
    Should Be Equal As Integers       ${response.status_code}     400