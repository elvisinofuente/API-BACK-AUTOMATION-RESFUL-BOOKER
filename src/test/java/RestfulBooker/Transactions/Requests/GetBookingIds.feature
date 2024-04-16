@ignore
Feature: Request para revisar reglas de seguridad

    Background:
        * def pathDirFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.prefixedPath)', cadenaBuscar: "/", direccion: "derecha"}
        * def nameFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.fileName)', cadenaBuscar: ".", direccion: "derecha"}
        * def nombreDirectorio = ".././" + pathDir + "/" + nameFeature + "/"

    @All
    Scenario: Obtener todos los booking ids
        Given url baseUrl
        Given path 'booking'
        
        When method Get
        Then status 200
        * match each $ contains { bookingid: '#number' }

    @firstname
    Scenario: Obtener todos los booking ids filtrado por firstname
        Given url baseUrl
        Given path 'booking'
        And param firstname = firstname
        
        When method Get
        Then status 200
        * match each $ contains { bookingid: '#number' }

    @lastname
    Scenario: Obtener todos los booking ids filtrado por lastname
        Given url baseUrl
        Given path 'booking'
        And param lastname = lastname
        
        When method Get
        Then status 200
        * match each $ contains { bookingid: '#number' }

    @checkin
    Scenario: Obtener todos los booking ids filtrado por checkin
        Given url baseUrl
        Given path 'booking'
        And param checkin = checkin
        
        When method Get
        Then status 200
        * match each $ contains { bookingid: '#number' }

    @checkout
    Scenario: Obtener todos los booking ids filtrado por checkout
        Given url baseUrl
        Given path 'booking'
        And param checkout = checkout
        
        When method Get
        Then status 200
        * match each $ contains { bookingid: '#number' }

