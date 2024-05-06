# Imagen base oficial de Python 3.12
FROM python:3.12-slim

# Directorio de trabajo para la aplicación
WORKDIR /vetsoft

# Copiar el archivo requirements.txt al directorio de trabajo
COPY requirements.txt .

# Instalar las dependencias del archivo requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todos los archivos al directorio de trabajo
COPY . .

# Copiar el script de inicio y darle permisos de ejecución
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Ejecutar el script de inicio al iniciar el contenedor
ENTRYPOINT ["entrypoint.sh"]

# Comando para crear el contenedor
# docker build -t vetsoft-ema:1.1 .

# Comando para ejecutar el contenedor
# docker run -it -p 8001:8000 -v $(pwd):/vetsoft -d vetsoft-ema:1.1

# Comando para ingresar al contenedor
# docker exec -it <container_id> /bin/bash

# Comando para detener el contenedor
# docker stop <container_id>

