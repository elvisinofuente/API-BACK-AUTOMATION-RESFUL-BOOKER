@ignore
Feature: Actualización de booking

    Background:
        * def pathDirFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.prefixedPath)', cadenaBuscar: "/", direccion: "derecha"}
        * def nameFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.fileName)', cadenaBuscar: ".", direccion: "derecha"}
        * def nombreDirectorio = ".././" + pathDir + "/" + nameFeature + "/"

    @Update_Ok_Auth
    Scenario: Actualización exitoso de booking con auth
        * def schemaResponseBody = read(constantes.PATH_DIR_RESPONSE_BODY + 'GetBookingResponse.js')()

        Given url baseUrl
        Given path 'booking', id
        Given header Content-Type = 'application/json'
        Given header Accept = 'application/json'
        Given header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
        * def requestBody = read(pathDirFeature + '/UpdateBookingBodyRequest.js')()
        Given request requestBody
        
        When method Put
        Then status 200
        * match $ == schemaResponseBody

    @Update_AuthInvalid
    Scenario: Actualización de booking con auth inválido
        
        Given url baseUrl
        Given path 'booking', id
        Given header Content-Type = 'application/json'
        Given header Accept = 'application/json'
        Given header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM=22'
        * def requestBody = read(pathDirFeature + '/UpdateBookingBodyRequest.js')()
        Given request requestBody
        
        When method Put
        Then status 403
        * match $ == 'Forbidden'


    @Update_Ok_Token
    Scenario: Actualización exitoso de booking con token
        * def schemaResponseBody = read(constantes.PATH_DIR_RESPONSE_BODY + 'GetBookingResponse.js')()

        * call read(pathDirFeature + "/CreateToken.feature@Token")
        Given url baseUrl
        Given path 'booking', id
        Given header Content-Type = 'application/json'
        Given header Accept = 'application/json'
        Given cookie token = token
        * def requestBody = read(pathDirFeature + '/UpdateBookingBodyRequest.js')()
        Given request requestBody
        
        When method Put
        Then status 200
        * match $ == schemaResponseBody

    @Update_WithDataInvalid
    Scenario: Actualización de booking con datos inválidos
        * def schemaResponseBody = read(constantes.PATH_DIR_RESPONSE_BODY + 'GetBookingResponse.js')()

        * call read(pathDirFeature + "/CreateToken.feature@Token")
        Given url baseUrl
        Given path 'booking', id
        Given header Content-Type = 'application/json'
        Given header Accept = 'application/json'
        Given cookie token = token
        * def requestBody = read(pathDirFeature + '/UpdateBookingBodyRequest.js')()
        Given request requestBody
        
        When method Put
        Then status 400
        * match $ == {"code": "#string", "message": "#string"}

