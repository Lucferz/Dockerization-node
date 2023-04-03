FROM node:18

# -p en mkdir es para crear todas las subcarpetas caso sea necesario
# no se por que se usa aca, pero es bueno saber
RUN mkdir -p /home/app

# con COPY lo que hago es indicarle la ruta de mi aplicacion (host)
# y la ruta dentro del docker en la que la quiero almacenar
COPY . /home/app

#exponemos el puerto en el que la aplicacion va a estar funcionando
EXPOSE 3000

# se usa para ejecutar comandos dentro del docker y funciona colocando
# dentro de un array el comando y sus argumentos, en item separados
# siempre es bueno utilizar rutas absolutas a la hora de ejecutar
CMD ["node", "/home/app/index.js"]
