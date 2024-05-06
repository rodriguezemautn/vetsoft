#!/bin/bash

# Esperar hasta que el servicio de la base de datos esté disponible
until python manage.py migrate 2>&1; do
  echo "La base de datos no está disponible todavía, esperando..."
  sleep 2
done

# Iniciar la aplicación
exec python manage.py runserver 0.0.0.0:8000