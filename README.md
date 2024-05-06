# Vetsoft

Aplicación web para veterinarias utilizada en la cursada 2024 de Ingeniería y Calidad de Software. UTN-FRLP

## Dependencias

- python 3
- Django
- sqlite
- playwright
- ruff

## Instalar dependencias

`pip install -r requirements.txt`

## Iniciar la Base de Datos

`python manage.py migrate`

## Iniciar app

`python manage.py runserver`

## Desplegar el contenedor

### Comando para crear el contenedor
`docker build -t vetsoft-ema:1.1 .`

### Comando para ejecutar el contenedor
`docker run -it -p 8001:8000 -v $(pwd):/vetsoft -d vetsoft-ema:1.1`

### Comando para ingresar al contenedor
`docker exec -it <container_id> /bin/bash`

### Comando para detener el contenedor
`docker stop <container_id>`