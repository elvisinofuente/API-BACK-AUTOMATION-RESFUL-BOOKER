@ignore
Feature: Obtiene booking por identificador

    Background:
        * def pathDirFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.prefixedPath)', cadenaBuscar: "/", direccion: "derecha"}
        * def nameFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.fileName)', cadenaBuscar: ".", direccion: "derecha"}
        * def nombreDirectorio = ".././" + pathDir + "/" + nameFeature + "/"

    @HappyPath
    Scenario: Obtiene booking por identificador
        * def schemaResponseBody = read(constantes.PATH_DIR_RESPONSE_BODY + 'GetBookingResponse.js')()

        Given url baseUrl
        Given path 'booking', id 
        Given header Accept = 'application/json'
        
        When method Get
        Then status 200
        * match $ == schemaResponseBody

    @NotFound
    Scenario: No se encuentra el id
        
        Given url baseUrl
        Given path 'booking', id 
        Given header Accept = 'application/json'
        
        When method Get
        Then status 404
        * match $ == 'Not Found'

