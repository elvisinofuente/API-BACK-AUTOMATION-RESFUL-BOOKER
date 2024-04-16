@ignore
Feature: Creación de booking

    Background:
        * def pathDirFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.prefixedPath)', cadenaBuscar: "/", direccion: "derecha"}
        * def nameFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.fileName)', cadenaBuscar: ".", direccion: "derecha"}
        * def nombreDirectorio = ".././" + pathDir + "/" + nameFeature + "/"

    @Create
    Scenario: Creación exitoso de booking
        * def schemaResponseBody = read(constantes.PATH_DIR_RESPONSE_BODY + 'CreateResponse.js')()
        Given url baseUrl
        Given path 'booking'
        Given header Content-Type = 'application/json'
        Given header Accept = 'application/json'
        * def requestBody = read(pathDirFeature + '/CreateBookingBodyRequest.js')()
        Given request requestBody

        When method Post
        Then status 200
        * match $ == schemaResponseBody
        * def id = $.bookingid

    @Create_IncorrectField
    Scenario: Creación de booking con nombres de campos incorrectos
        * def schemaResponseBody = read(constantes.PATH_DIR_RESPONSE_BODY + 'CreateResponse.js')()
        Given url baseUrl
        Given path 'booking'
        Given header Content-Type = 'application/json'
        Given header Accept = 'application/json'
        * def requestBody = read(pathDirFeature + '/CreateBookingBodyRequest.js')()
        Given request requestBody

        When method Post
        Then status 400
        * match $ == {"code": "#string", "message": "#string"}

    @Create_WithOutField
    Scenario: Creación de booking con body vacío
        * def schemaResponseBody = read(constantes.PATH_DIR_RESPONSE_BODY + 'CreateResponse.js')()
        Given url baseUrl
        Given path 'booking'
        Given header Content-Type = 'application/json'
        Given header Accept = 'application/json'
        * def requestBody = read(pathDirFeature + '/CreateBookingBodyRequest.js')()
        Given request requestBody

        When method Post
        Then status 400
        * match $ == {"code": "#string", "message": "#string"}

