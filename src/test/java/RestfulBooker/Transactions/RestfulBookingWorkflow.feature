@ignore
Feature: Controlador de Suite de RestfulBooking

    Background:
        # * def pathDirFeature = reglasSeguridadPath + "Transactions/ReglasSeguridad/Requests/"
        * def pathDirFeatureWorkFlow = call read(pathUtils + 'utils.js') {cadena:'#(karate.feature.prefixedPath)', cadenaBuscar: "/", direccion: "derecha"}

    @Ping
    Scenario: Realizar Ping
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")

    @TokenValido
    Scenario: Token valido
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateToken.feature@Token")

    @TokenConUserNameInvalido
    Scenario: Generar token con nombre de usuario inválido
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateToken.feature@TokenInvalido_UsrInv")

    @TokenConPasswordInvalido
    Scenario: Generar token con password inválido
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateToken.feature@TokenInvalido_PwdInv")

    @TokenConUserNameYPasswordInvalido
    Scenario: Generar token con usuario y password inválido
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateToken.feature@TokenInvalido_UsrInv_PwdInv")

    @GetBookingIds
    Scenario: Obtener Todos los Bookings
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/GetBookingIds.feature@All")

    @GetBooking
    Scenario: Obtener booking por id
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/GetBooking.feature@HappyPath")

    @CreateBooking
    Scenario: Crear booking
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
    # * call read(pathDirFeatureWorkFlow + "/Requests/UpdateBooking.feature@Update_Ok_Auth")

    @UpdateBooking_Auth
    Scenario: Actualizar booking con Auth autorización
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/UpdateBooking.feature@Update_Ok_Auth")

    @UpdateBooking_AuthInvalid
    Scenario: Actualizar booking con Auth autorización inválido
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/UpdateBooking.feature@Update_AuthInvalid")

    @UpdateBooking_Token
    Scenario: Actualizar booking con Token autorización
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/UpdateBooking.feature@Update_Ok_Token")

    @Update_WithDataInvalid
    Scenario: Actualización de booking con datos inválidos
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/UpdateBooking.feature@Update_WithDataInvalid")
        
    @PartialUpdateBooking_Auth
    Scenario: Actualización parcial de booking con Auth autorización
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/PartialUpdateBooking.feature@UpdatePartial_Ok_Auth")
    
    @PartialUpdateBooking_AuthInvalid
    Scenario: Actualización parcial de booking con Auth autorización inválido
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/PartialUpdateBooking.feature@UpdatePartial_AuthInvalid")

    @PartialUpdateBooking_Token
    Scenario: Actualización parcial de booking con Token autorización
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/PartialUpdateBooking.feature@UpdatePartial_Ok_Token")


    @DeleteBooking_Auth
    Scenario: Eliminación de booking con Auth autorización
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/DeleteBooking.feature@Delete_Ok_Auth")

    @DeleteBooking_AuthInvalid
    Scenario: Eliminación de booking con Auth autorización inválido
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/DeleteBooking.feature@Delete_AuthInvalid")

    @DeleteBooking_TokenInvalid
    Scenario: Eliminación de booking con Token inválido
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/DeleteBooking.feature@Delete_TokenInvalid")
    
    @DeleteBooking_Auth_idNoExiste
    Scenario: Eliminación de booking con Auth autorización inválido
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/DeleteBooking.feature@Delete_Auth_idNoExiste")

    @DeleteBooking_Token
    Scenario: Eliminación de booking con Token autorización
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/DeleteBooking.feature@Delete_Ok_Token")
        * call read(pathDirFeatureWorkFlow + "/Requests/GetBooking.feature@NotFound")

    @DeleteBooking_Token_idNoExiste
    Scenario: Eliminación de booking con Token y id que no existe
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create")
        * call read(pathDirFeatureWorkFlow + "/Requests/DeleteBooking.feature@Delete_Token_idNoExiste")

    @CreateBooking_IncorrectField
    Scenario: Crear booking con campos incorrectos
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create_IncorrectField")

    @CreateBooking_WithOutField
    Scenario: Crear booking Sin enviar campos (body vacio)
        * call read(pathDirFeatureWorkFlow + "/Requests/HealthCheck.feature@HealthCheck")
        * call read(pathDirFeatureWorkFlow + "/Requests/CreateBooking.feature@Create_WithOutField")