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

### Ejecución del script `test.rb`:
* Ejecutar la consola de Ruby `irb` en el espacio de trabajo del proyecto (así se importan todas las clases del proyecto de Rails de manera automática) accediendo al contenedor de Docker:
    * `sudo docker exec -it farms rails console`

* Una vez dentro, veremos un prompt similar a `irb(main):001:0>`. Para ejecutar el script, debemos ejecutar la función `eval()` indicándole la ubicación relativa del archivo Ruby:
    * `eval(File.read 'test.rb')`

* Si todo funcionó correctamente, podremos verificar si el usuario fue creado:
    * `user = User.where("email=?", "test@test.com").first`

* A este usuario podremos pedirle las granjas asociadas:
    * `user.farms`

* O podemos pedirle los lotes de esta granja (como es la única que tiene, con solicitar la primera de la colección es suficiente):
    * `user.farms.first.plots`

Se puede observar que estos son los datos que agregamos a partir del script, donde no se observa un `save` en ningún momento.
