FROM python:3.10-slim

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de requisitos primero
COPY requirements.txt /app/

# Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto de la aplicación
COPY ./app /app/app
COPY ./tests /app/tests

# Crear archivo .env por defecto
RUN echo "frontDesplegado=*" > /app/.env

# Exponer puerto
EXPOSE 10000

# Comando para ejecutar la aplicación
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "10000"]