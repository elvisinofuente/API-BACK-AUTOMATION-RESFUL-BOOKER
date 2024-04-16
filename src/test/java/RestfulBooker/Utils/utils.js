function substraerCadenaIzquierda(datos) {

    var posIni, posFin;

    if (datos.cadena == "")
        return datos.cadena;
    switch (datos.direccion) {
        case "izquierda":
            posIni = datos.cadena.lastIndexOf(datos.cadenaBuscar) + 1;
            posFin = datos.cadena.length;
            return datos.cadena.substring(posIni, posFin);
            break;
        case "derecha":
            posIni = 0;
            posFin = datos.cadena.lastIndexOf(datos.cadenaBuscar);
            return datos.cadena.substring(posIni, posFin);
            break;
    }

} 