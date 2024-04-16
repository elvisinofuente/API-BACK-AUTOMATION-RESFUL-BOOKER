@ignore
Feature: Actualización parcial de booking

    Background:
        * def pathDirFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.prefixedPath)', cadenaBuscar: "/", direccion: "derecha"}
        * def nameFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.fileName)', cadenaBuscar: ".", direccion: "derecha"}
        * def nombreDirectorio = ".././" + pathDir + "/" + nameFeature + "/"

    @UpdatePartial_Ok_Auth
    Scenario: Actualización parcial exitoso de booking
        * def schemaResponseBody = read(constantes.PATH_DIR_RESPONSE_BODY + 'GetBookingResponse.js')()

        Given url baseUrl
        Given path 'booking', id
        Given header Content-Type = 'application/json'
        Given header Accept = 'application/json'
        Given header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
        * def requestBody = read(pathDirFeature + '/PartialUpdateBookingBodyRequest.js')()
        Given request requestBody
        
        When method Patch
        Then status 200
        * match $ == schemaResponseBody

    @UpdatePartial_AuthInvalid
    Scenario: Actualización parcial de booking con Auth inválido
        * def schemaResponseBody = read(constantes.PATH_DIR_RESPONSE_BODY + 'GetBookingResponse.js')()

        Given url baseUrl
        Given path 'booking', id
        Given header Content-Type = 'application/json'
        Given header Accept = 'application/json'
        Given header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM=22'
        * def requestBody = read(pathDirFeature + '/PartialUpdateBookingBodyRequest.js')()
        Given request requestBody
        
        When method Patch
        Then status 403
        * match $ == 'Forbidden'


    @UpdatePartial_Ok_Token
    Scenario: Actualización parcial exitoso de booking
        * def schemaResponseBody = read(constantes.PATH_DIR_RESPONSE_BODY + 'GetBookingResponse.js')()

        * call read(pathDirFeature + "/CreateToken.feature@Token")
        Given url baseUrl
        Given path 'booking', id
        Given header Content-Type = 'application/json'
        Given header Accept = 'application/json'
        Given cookie token = token
        * def requestBody = read(pathDirFeature + '/PartialUpdateBookingBodyRequest.js')()
        Given request requestBody
        
        When method Patch
        Then status 200
        * match $ == schemaResponseBody

