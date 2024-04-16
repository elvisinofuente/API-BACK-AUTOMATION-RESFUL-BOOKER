@ignore
Feature: Creación de token

    Background:
        * def pathDirFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.prefixedPath)', cadenaBuscar: "/", direccion: "derecha"}
        * def nameFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.fileName)', cadenaBuscar: ".", direccion: "derecha"}
        * def nombreDirectorio = ".././" + pathDir + "/" + nameFeature + "/"

    @Token
    Scenario: Creación de token
        Given url baseUrl
        Given path 'auth'
        Given header Content-Type = 'application/json'
        * def requestBody = read(pathDirFeature + '/CreateTokenBodyRequest.js')()
        Given request requestBody

        When method Post
        Then status 200
        * match $ == { "token": "#string"}
        * def token = $.token

    @TokenInvalido_PwdInv
    Scenario: Creación de token con password invalido
        Given url baseUrl
        Given path 'auth'
        Given header Content-Type = 'application/json'
        * def requestBody = read(pathDirFeature + '/CreateTokenBodyRequest.js')()
        * requestBody.password = '111111'
        Given request requestBody

        When method Post
        Then status 200
        * match $ == { "reason": "Bad credentials" }
        * def token = $.token

    @TokenInvalido_UsrInv
    Scenario: Creación de token con usuario invalido
        Given url baseUrl
        Given path 'auth'
        Given header Content-Type = 'application/json'
        * def requestBody = read(pathDirFeature + '/CreateTokenBodyRequest.js')()
        * requestBody.username = 'addad'
        Given request requestBody

        When method Post
        Then status 200
        * match $ == { "reason": "Bad credentials" }
        * def token = $.token

    @TokenInvalido_UsrInv_PwdInv
    Scenario: Creación de token con usuario y password invalido
        Given url baseUrl
        Given path 'auth'
        Given header Content-Type = 'application/json'
        * def requestBody = read(pathDirFeature + '/CreateTokenBodyRequest.js')()
        * requestBody.username = 'addad'
        * requestBody.password = 'addad'
        Given request requestBody

        When method Post
        Then status 200
        * match $ == { "reason": "Bad credentials" }
        * def token = $.token