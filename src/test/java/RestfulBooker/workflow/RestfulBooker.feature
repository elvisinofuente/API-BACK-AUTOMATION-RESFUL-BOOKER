Feature: Directorio de pruebas automatizadas de Reglas de Seguridad

  Background: Definición de escenarios
    * def DataImporterCsv = karate.callSingle('classpath:RestfulBooker/Init/DataSetters/dataImporter.js')

  Scenario Outline: <codigo> - <caso>
    * def RestfulBookerPath = "classpath:RestfulBooker/"
    * def getFeaturePath = read(RestfulBookerPath + "Utils/getFeaturePath.js")
    * def pathDir = "outputData/RestfulBookerReport/" + codigo

    * call read(RestfulBookerPath + "Init/defaultFields.feature")
    * def testFeature = "this:../Transactions/" + getFeaturePath(caso)
    * call read(testFeature)

    Examples:
      | DataImporterCsv.datosRestfulBookingPayIn |