
##**Karate DSL - Restful Booker**

##**Documentación:**
    *[Plan de Pruebas](Documentación/PlanDePruebas_RetoKarate.xlsx)
    *[Documentación técnica](Documentación/HerramientasTecnicas_RetoKarate.docx)
    *[Script en Postman](Documentación/restful-booker.postman_collection.json)

##**Run tests with Maven:**

```
mvn clean test -Dtest=RestfulBookerTest -Dkarate.env=uat 
```
or ##**Run tests with Docker:**

```
docker-compose build karate-test-Restful-Booker 
```
```
docker-compose up karate-test-Restful-Booker 
```