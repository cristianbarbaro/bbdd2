# Trabajo final de Bases de datos 2

### Instalación del proyecto:

#### El proyecto está en contenedores Docker para mayor flexibilidad a la hora de ejecutarlo:
* Instalar Docker en la pc donde se realizarán las pruebas:
    * https://docs.docker.com/get-docker/
* También es necesario instalar `docker-compose` para la administración de los servicios mediante `docker-compose.yml`:
    * https://docs.docker.com/compose/install/

#### Ejecución:
* `git clone https://github.com/cristianbarbaro/bbdd2 && cd bbdd2` para descargar el repositorio de GitHub.
* `sudo docker-compose up` (si se quiere que corra en segundo plano y no muestre mensajes en la consola, agregar el parámetro `-d` al comando).
* Si se ejecuta el comando por primera vez, hay que cargar el esquema de la base de datos y sus correspondientes datos de pruebas. Ejecutar el siguiente comando:
    * `sudo docker exec -it farms rails db:reset` (este comando crea o reinicia las bases de datos y sus correspondientes tablas con los datos predefinidos).
* Acceder a http://localhost:3000 e iniciar sesión con las credenciales detalladas en la siguiente sección.
* Para ver la información de la base de datos, el `docker-compose` tiene un contenedor de Adminer (servicio web) para ver la info de la base de datos:
    * http://localhost:8080 con las siguientes credenciales:
        * System: `PostgreSQL`
        * Server: `db` (nombre definido en el archivo de `docker-compose.yml`)
        * Username: `postgres` (valor definido en el archivo `.env`)
        * Password: `postgres` (valor definido en el archivo `.env`)
        * Database: `farms_development`


#### Credenciales de pruebas:
* Usuario administrador:
    * user: `admin@admin.com`
    * pass: `administrator`

* Usuarios productores:
    * Todos tienen la misma contraseña: `password`
    * users:
        * `one@one.com`
        * `two@two.com`
        * `three@three.com`

* Los datos que se cargan por defecto en la base de datos están en el archivo `db/seeds.rb`.

* Las definiciones de las relaciones entre modelos están en `app/models`.

* Las estructuras de los campos y definición de las tablas son los archivos llamados **migraciones** y se encuentran en la carpeta `db/migrate`. Estos archivos tienen asociados un timestamp y una acción (puede ser crear una tabla, agregar o quitar o modificar un campo, o borrar una tabla o renombrarla). De esta manera, es posible seguir un registro de los cambios hechos en la base de datos del proyecto y realizar un *rollback* si fuese necesario.

* El archivo `db/schema.rb` muestra cómo está definido el esquema de la base de datos actualmente.

* En el archivo `config/database.yml` se define las conexiones a la base de datos, el nombre que le pondremos y sus credenciales.

* La lógica de la aplicación (o negocio), los controladores, están en la carpeta `app/controllers` y las vistas que se presentan al usuario final en `app/views`.


### Ejecución del script `test.rb`:
* Ejecutar la consola de Ruby `irb` en el espacio de trabajo del proyecto (así se importan todas las clases del proyecto de Rails de manera automática) accediendo al contenedor de Docker con el siguiente comando:
    * `sudo docker exec -it farms rails console`

* Una vez dentro, veremos un prompt similar a `irb(main):001:0>`. Para ejecutar el script, debemos ejecutar la función `eval()` indicándole la ubicación relativa del archivo Ruby:
    * `eval(File.read 'test.rb')`

* Si todo funcionó correctamente, podremos verificar si el usuario fue creado:
    * `user = User.where("email=?", "test@test.com").first`

* A este usuario podremos pedirle las granjas asociadas:
    * `user.farms`

* O podemos pedirle los lotes de esta granja (como es la única que tiene, con solicitar la primera de la colección es suficiente):
    * `user.farms.first.plots`

Se puede observar que estos son los datos que agregamos a partir del script.
