function fn(bodyParameter) {

    let arrayDatosLeidos = [];
    try {

        let arrayDatosDeArchivo = read(bodyParameter.pathFileName);

        for (let i = 0; i < arrayDatosDeArchivo.length; i++) {

            let estructuraPayLoad = { ...bodyParameter.payload };

            for (let j = 0; j < Object.keys(arrayDatosDeArchivo[i]).length; j++) {

                let iterationKeys = Object.keys(arrayDatosDeArchivo[i]);

                if (arrayDatosDeArchivo[i][iterationKeys[j]].isEmpty()) {
                    continue;
                }

                if (estructuraPayLoad.hasOwnProperty(iterationKeys[j])) {
                    estructuraPayLoad[iterationKeys[j]] = arrayDatosDeArchivo[i][iterationKeys[j]];
                }

            }
            arrayDatosLeidos.push(estructuraPayLoad);
        }
    } catch (error) {
        karate.log('Error leyendo archivo ' + bodyParameter.pathFileName);
        karate.log('Detalle error: ' + error);
        arrayDatosLeidos = [];
    }
    
    return arrayDatosLeidos;
}