@ignore
Feature: A simple health check endpoint to confirm whether the API is up and running

    Background:
        * def pathDirFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.prefixedPath)', cadenaBuscar: "/", direccion: "derecha"}
        * def nameFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.fileName)', cadenaBuscar: ".", direccion: "derecha"}
        * def nombreDirectorio = ".././" + pathDir + "/" + nameFeature + "/"

    @HealthCheck
    Scenario: Validar el estado de las APIs
        Given url baseUrl
        Given path 'ping'
        When method get
        Then status 201