# Trabajo final de Bases de datos 2

### Instalación del proyecto:

#### El proyecto está en contenedores Docker para mayor flexibilidad a la hora de ejecutarlo:
* Instalar Docker en la pc donde se realizarán las pruebas:
    * https://docs.docker.com/get-docker/
* También es necesario instalar `docker-compose` para la administración de los servicios mediante `docker-compose.yml`:
    * https://docs.docker.com/compose/install/

#### Ejecución:
* `sudo docker-compose up` (si se quiere que corra en segundo plano y no muestre mensajes en la consola, agregar el parámetro `-d` al comando).
* Si se ejecuta el comando por primera vez, hay que cargar el esquema de la base de datos y sus correspondientes datos de pruebas. Ejecutar el siguiente comando:
    * `sudo docker exec -it farms rails db:reset` (este comando crea las bases de datos y carga con los datos por defecto las mismas).
* Acceder a http://localhost:3000 e iniciar sesión.


