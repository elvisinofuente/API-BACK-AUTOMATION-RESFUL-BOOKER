function fn() {

    let payloadBookings = {
        "codigo": "",
        "caso": "",
        "firstname": "",
        "lastname": "",
        "totalprice": "",
        "depositpaid": "",
        "checkin": "",
        "checkout": "",
        "additionalneeds": ""
    };

    //leemos los datos de diferidos
    let jsonBookings = {};
    let arrayBookings = [];
    let parametros = {};
    let manejoArchivos = Java.type('RestfulBooker.Utils.ManejoArchivos');
    let constantes = Java.type('RestfulBooker.Utils.Constantes');
    let filePath = "";

    parametros.payload = payloadBookings;
    parametros.pathFileName = constantes.PATH_FILE_INPUT_RESTFULLBOOKING_CSV;
    filePath = parametros.pathFileName.replace("../../../../", "./");
    if (manejoArchivos.fileExist(filePath)) {

        arrayBookings = (karate.call(constantes.PATH_DIR_UTILS + 'LeerArchivosCSV.js', parametros));
    }
    

    // Convertir la estructura de datos a un array de objetos JSON
    const arrayJSON = arrayBookings.map(elemento => {
        return JSON.parse(JSON.stringify(elemento));
    });

    jsonBookings.datosRestfulBookingPayIn = arrayJSON;
    return jsonBookings;
}