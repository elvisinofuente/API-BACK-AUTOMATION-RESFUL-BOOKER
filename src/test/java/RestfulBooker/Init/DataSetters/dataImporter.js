
function fn(datos) {
    let constantes = Java.type('RestfulBooker.Utils.Constantes');
    let tempDatosReglas = {};
    tempDatosReglas = karate.call(constantes.PATH_FILE_REGLA_SEGURIDAD_JS, datos);
    karate.log(tempDatosReglas);
    return tempDatosReglas;
}


