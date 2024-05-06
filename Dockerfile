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