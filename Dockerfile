#Imagen base para la creación de la imagen desde la imagen oficial de python 3.7 
# evitar usar imagenes base y luego instalar python ya que esto aumenta el tamaño de la imagen
FROM python:3.12-slim

# Workdir: /app
# Directorio de trabajo para la aplicación
WORKDIR /vetsoft

# Copy: requirements.txt
# Copiar el archivo requirements.txt al directorio de trabajo
COPY requirements.txt .

# RUN: pip install -r requirements.txt
# Instalar las dependencias del archivo requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy: . .
# Copiar todos los archivos al directorio de trabajo
# Crear dockerignore para evitar copiar archivos innecesarios
# Poe ejemplo: *.pyc, __pycache__, .git, .vscode, .idea, .env, .venv, .DS_Store
COPY . .

# Exponer el puerto 8000
EXPOSE 8000

# CMD: iniciar la app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

# Iniciar la BBDD
RUN python manage.py migrate

# Comando para construir la imagen
# docker build -t vetsoft-ema:1.0 .

# Comando para correr el contenedor con un volumen persitente, puerto 8000 y en modo detach (segundo plano)
# docker run -it -p 8000:8000 -v $(pwd):/vetsoft -d  vetsoft-ema:1.0 

#Comando para ejecutar el contenedor en modo interactivo
# docker exec -it <container_id> /bin/bash

# Comandos que pueden ser útiles
# docker ps
# docker ps -a
# docker stop <container_id>
# docker start <container_id>
# docker logs <container_id>
# docker inspect <container_id>
# docker history <image_id>
# docker rm <container_id>
# docker rmi <image_id>
# docker images
# docker volume ls
# docker volume rm <volume_id>
# docker network ls
# docker network rm <network_id>



# Creamos un docker-compose.yml para imagen vetsoft-ema:1.0 con un volumen persistente, puerto 8000 y sqlite3 
# Comando para correr el contenedor con docker-compose
# version: '3.8'
# services:
#   vetsoft:
#     image: vetsoft-ema:1.0
#     ports:
#       - "8000:8000"
#     volumes:  
#       - .:/vetsoft
#     command: python manage.py runserver
#     command: python manage.py migrate
#     restart: always


#Crear docker-compose.yml
# version: '3.8'
# services:
#   vetsoft:
#     build: .
#     ports:
#       - "8000:8000"
#     volumes:
#       - .:/vetsoft
#     command: python manage.py runserver
#     command: python manage.py migrate
#     restart: always

