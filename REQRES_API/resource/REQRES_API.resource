*** Variable ***
${URL}    https://reqres.in

*** Keywords ***
Prepare data header parameter
    ${headers}             Create Dictionary    Content-Type=application/json
    Set Global Variable    ${headers}

Prepare data request parameter
    [Arguments]            ${requestFromFile}
    ${body}                Load JSON From File    ${CURDIR}/../request_reqres/${requestFromFile}
    Set Global Variable    ${body}

Send request api method post || patch || put
    [Arguments]                       ${method}             ${apiName}    ${requestFromFile}    ${endPointUrl}
    Create Session                    ${apiName}            ${URL}        verify=true
    Prepare data header parameter
    Prepare data request parameter    ${requestFromFile}

    IF             '${method}' == 'PATCH'
    ${response}    PATCH On Session           ${apiName}    ${endPointUrl}    expected_status=anything      headers=${headers}    json=${body}
    ELSE IF        '${method}' == 'POST'
    ${response}    POST On Session            ${apiName}    ${endPointUrl}    expected_status=anything      headers=${headers}    json=${body}
    ELSE IF        '${method}' == 'PUT'
    ${response}    PUT On Session             ${apiName}    ${endPointUrl}    expected_status=anything      headers=${headers}    json=${body}
    ELSE IF        '${method}' == 'DELETE'
    ${response}    DELETE On Session          ${apiName}    ${endPointUrl}    expected_status=anything      headers=${headers}    json=${body}
    END

    Set Global Variable    ${response}

Send request api method get || delete
    [Arguments]                      ${method}     ${apiName}    ${endPointUrl}
    Create Session                   ${apiName}    ${URL}        verify=true
    Prepare data header parameter

    IF             '${method}' == 'GET'
    ${response}    GET On Session             ${apiName}    url=${endPointUrl}    expected_status=anything    headers=${headers}
    ELSE IF        '${method}' == 'DELETE'
    ${response}    DELETE On Session          ${apiName}    url=${endPointUrl}    headers=${headers}
    END

    Set Global Variable    ${response}