*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     Collections
Library     String
Resource    ${CURDIR}/../resource/REQRES_API.resource

*** Variable ***
${URL}    https://reqres.in

*** Test Case ***
TC01: GET LIST USERS DATA FOUND
   Create Session    GET LIST USERS       ${URL}            verify=true    
   ${response}      GET On Session       GET LIST USERS    url=/api/users?page=2
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200

TC02: GET SINGLE USER DATA FOUND
   Create Session    GET SINGLE USER       ${URL}            verify=true    
   ${response}      GET On Session       GET SINGLE USER    url=/api/users/2
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.reason}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200

TC03: GET SINGLE USER DATA NOT FOUND
   Create Session    GET SINGLE USER       ${URL}            verify=true    
   ${response}      GET On Session       GET SINGLE USER    url=/api/users/23    expected_status=anything
   Log    Response Reason: ${response.reason}   
   Log    ${response.status_code}
   Log    ${response.reason}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     404
   Should Be Equal As Strings        ${response.content}         {}

TC04: GET LIST RESOURCE DATA FOUND
   Create Session    GET LIST RESOURCE       ${URL}            verify=true    
   ${response}      GET On Session       GET LIST RESOURCE    url=/api/unknown
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.reason}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200

TC05: GET SINGLE RESOURCE DATA FOUND
   Create Session    GET SINGLE RESOURCE       ${URL}            verify=true    
   ${response}      GET On Session       GET SINGLE RESOURCE    url=/api/unknown/2
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.reason}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200
   
TC05: POST USER
   Create Session     POST USER        ${URL}      verify=true
   ${body}            Create Dictionary    name=morpheus1    job=leader  
   ${response}        POST On Session     POST USER   /api/users   json=${body}  
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     201

TC06: POST USER by get request from json file
   Create Session     POST USER        ${URL}      verify=true
   ${body}            Load JSON From File       ${CURDIR}/../request_reqres/POST_USER.json 
   Log   ${body} 
   ${response}        POST On Session     POST USER      /api/users      json=${body}  
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     201

# TC0007: POST USER by get request from yaml file

TC08: PUT USER
   Create Session     PUT USER         ${URL}     verify=true
   ${body}     Create Dictionary   
   ...    name=morpheus 
   ...    job=zion resident 
   ${response}        PUT On Session      PUT USER   /api/users/2    json=${body}  
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200

TC09: PUT USER by get request from json file
   Create Session     POST USER        ${URL}      verify=true
   ${body}            Load JSON From File       ${CURDIR}/../request_reqres/PUT_USER.json 
   Log   ${body} 
   ${response}        PUT On Session     PUT USER      /api/users/2      json=${body}  
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200

# TC0010: PUT USER by get request from yaml file

TC011: PATCH USER
   Create Session     PATCH USER         ${URL}     verify=true
   ${body}     Create Dictionary   
   ...    name=morpheus 
   ...    job=zion resident 
   ${response}        PATCH On Session      PATCH USER   /api/users/2    json=${body}  
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200

TC012: PATCH USER by get request from json file
   Create Session     PATCH USER        ${URL}      verify=true
   ${body}            Load JSON From File       ${CURDIR}/../request_reqres/PATCH_USER.json 
   Log   ${body} 
   ${response}        PATCH On Session     PATCH USER      /api/users/2      json=${body}  
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     200

# TC0013: PUT USER by get request from yaml file

TC014: DELETE USER
   Create Session     DELETE USER         ${URL}     verify=true
   ${response}        DELETE On Session      DELETE USER   /api/users/2    expected_status=anything 
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     204


TC015: POST REGISTER Bad request
   Create Session     POST REGISTER         ${URL}     verify=true
   ${response}        POST On Session      POST REGISTER   /api/register    expected_status=anything
   ${body}     Create Dictionary   
   ...    email=eve.holt@reqres.in 
   Log    ${response.status_code}
   Log    ${response.headers}
   Log    ${response.content}
   Should Be Equal As Integers       ${response.status_code}     400