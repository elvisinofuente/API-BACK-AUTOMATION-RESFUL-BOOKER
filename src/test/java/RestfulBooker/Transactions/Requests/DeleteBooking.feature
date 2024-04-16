@ignore
Feature: Actualización parcial de booking

    Background:
        * def pathDirFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.prefixedPath)', cadenaBuscar: "/", direccion: "derecha"}
        * def nameFeature = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.fileName)', cadenaBuscar: ".", direccion: "derecha"}
        * def nombreDirectorio = ".././" + pathDir + "/" + nameFeature + "/"

    @Delete_Ok_Auth
    Scenario: Eliminación exitoso de booking
        Given url baseUrl
        Given path 'booking', id
        Given header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='

        When method Delete
        Then status 201

    @Delete_Auth_idNoExiste
    Scenario: Eliminación de booking con Auth valido y con id que no existe
        Given url baseUrl
        Given path 'booking', 99999
        Given header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM='

        When method Delete
        Then status 200
        * match $ == {"code": "#string", "message": "#string"}

    @Delete_AuthInvalid
    Scenario: Eliminación de booking con Auth inválido
        Given url baseUrl
        Given path 'booking', id
        Given header Authorization = 'Basic YWRtaW46cGFzc3dvcmQxMjM=1212'

        When method Delete
        Then status 403
        * match $ == 'Forbidden'

    @Delete_TokenInvalid
    Scenario: Eliminación de booking con Token inválido
        * call read(pathDirFeature + "/CreateToken.feature@TokenInvalido_UsrInv_PwdInv")
        Given url baseUrl
        Given path 'booking', id

        When method Delete
        Then status 403
        * match $ == 'Forbidden'

    @Delete_Ok_Token
    Scenario: Eliminación exitoso de booking
        * call read(pathDirFeature + "/CreateToken.feature@Token")
        Given url baseUrl
        Given path 'booking', id
        Given cookie token = token

        When method Delete
        Then status 201

    @Delete_Token_idNoExiste
    Scenario: Eliminación de booking con token valido y con id que no existe
        * call read(pathDirFeature + "/CreateToken.feature@Token")
        Given url baseUrl
        Given path 'booking', 999999
        Given cookie token = token

        When method Delete
        Then status 200
        * match $ == {"code": "#string", "message": "#string"}
