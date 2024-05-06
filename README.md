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

## Desplegar contenedor
### Comando para construir la imagen
`docker build -t <nombre-de-imagen>:<x.x> .`

### Comando para correr el contenedor con un volumen persitente, puerto 8000 y en modo detach (segundo plano)
`docker run -it -p 8000:8000 -v $(pwd):/vetsoft -d --name <nombre_contenedor> <nombre-de-imagen>:<x.x>`