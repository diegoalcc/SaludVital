# Implementación del Pipeline CI/CD

## Fase 2: Diseño del pipeline DevOps

### Pipeline de CI/CD básico para VitalApp

El pipeline CI/CD implementado para VitalApp consta de tres etapas principales:

1. **Test**: Ejecuta las pruebas unitarias para validar la funcionalidad del código
2. **Docker**: Construye y publica la imagen Docker en Docker Hub
3. **Deploy**: Despliega la aplicación usando docker-compose

### Herramientas utilizadas

- **Git/GitHub**: Control de versiones y alojamiento del repositorio
- **GitHub Actions**: Automatización del pipeline CI/CD
- **Docker**: Contenedorización de la aplicación
- **Docker Compose**: Orquestación de contenedores
- **Pytest**: Framework de pruebas unitarias

## Fase 3: Implementación práctica

### Repositorio con control de versiones

El proyecto utiliza Git para el control de versiones con un repositorio alojado en GitHub. El archivo `.gitignore` está configurado para excluir archivos innecesarios como `__pycache__/`, `*.pyc`, `.env`, `.vscode/`, `*.log` y `docker-compose.override.yml`.

### Automatización de pruebas unitarias

Las pruebas unitarias están implementadas usando el framework pytest:

- `test_alertas.py`: Pruebas para el sistema de alertas de salud
- `test_cita_manager.py`: Pruebas para la gestión de citas médicas
- `test_historial_cita.py`: Pruebas para el historial de citas
- `test_resultados.py`: Pruebas para los resultados médicos

### Uso de contenedores para empaquetar la aplicación

La aplicación está completamente dockerizada:

- `Dockerfile`: Define cómo construir la imagen de la aplicación
- `docker-compose.yml`: Configura y orquesta el contenedor de la aplicación

### Automatización del despliegue

El despliegue automatizado está implementado a través de GitHub Actions:

1. El workflow se activa en cada push o pull request a la rama `main`
2. Se ejecutan las pruebas unitarias
3. Se construye la imagen Docker y se publica en Docker Hub
4. La aplicación se despliega automáticamente usando docker-compose

### Despliegue en AWS

Además del despliegue local, el pipeline también está configurado para desplegar la aplicación en una instancia EC2 de AWS:

1. Se configuran las credenciales de AWS como secrets en GitHub
2. Se utiliza la acción `appleboy/ssh-action` para conectarse a la instancia mediante SSH
3. Se actualiza el código en la instancia y se reinicia el contenedor Docker

## Variables de entorno

Se ha implementado el soporte para variables de entorno, específicamente la variable `frontDesplegado` que permite configurar la URL del frontend que consume la API. Esta variable se puede establecer en el archivo `.env` o como variable de entorno del sistema.

## CORS (Cross-Origin Resource Sharing)

Se ha configurado el middleware de CORS en la aplicación para permitir que el frontend especificado en la variable de entorno `frontDesplegado` pueda consumir la API correctamente.