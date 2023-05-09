Este repositorio siguio en el ejemplo de : https://github.com/nschurmann/mongoapp-curso-docker
para poder hacer esta prueba de levantamiento de docker con node

Levantando la aplicacion js (node):
    1- Ejecutar los siguientes comandos:
        npm install 
        node index.js
Creando la imagen de mongo
    -- Windows
    docker run --name mongodb -v D:\docker_volumes\mongodb:/data/db -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=admin -e MONGO_INITDB_DATABASE=prueba_docker -p 27017:27017 -d mongo

    --Linux
    docker run --name mongodb -v /home/lucferz/containers-data/mongodb/:/data/db -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=admin -e MONGO_INITDB_DATABASE=prueba_docker -p 27017:27017 -d mongo
Luego de configurar bien el string de conexion de mongo ya saldra el contenido en el navegador

----------------DOCKERIZANDO-------------------
Una vez que la aplicacion funciona correctamente, ya podemos
pensar en dockerizarla, para esto, hay que entender que una
vez dentro del docker las aplicaciones se conectan mediante
redes, se pueden crear propias o dejar por defecto las que 
crea el docker.

crear una red con docker network:  create unared

Una vez dentro del docker las aplicaciones dentro de la misma
red se reconocen por el nombre de sus contenedores, por ende
hay que cambiar localhost por el nombre de nuestro contenedor

Luego creamos el archivo Dockerfile

Luego ejecutamos docker build, en el cual la sintaxis es la 
siguiente:
docker build -t nombre_app:version path/to/Dockerfile

una vez creado todo el contenedor con la aplicacion, tenemos
que nuevamente crear nuestro contenedor de mongo(db), ya que
debemos especificarle que estara en la red que habiamos creado, para eso, repetimos el mismo comando de arriba pero le agregamos --network unared

docker run --name mongodb --network unared -v D:\docker_volumes\mongodb:/data/db -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=admin -e MONGO_INITDB_DATABASE=prueba_docker -p 27017:27017 -d mongo

y hacemos lo mismo con el contenedor de nuestra aplicacion
que acabamos de crear

El siguiente paso es crear un docker-compose.yml 




--------------------DESARROLLO-------------------
Para el ambiente de desarrollo se tienen
dockerfiles y docker-compose.yml distintos a los
de produccion 

para usar un docker-compose.yml distinto al por 
defecto (docker-compose.yml) se usa el parametro
-f en el docker-compose especificando la ruta del 
archivo