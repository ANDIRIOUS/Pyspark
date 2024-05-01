# Usamos una imagen base de Python
FROM python:3.8-slim

# Instalamos las dependencias de sistema necesarias para PySpark
RUN apt-get update && apt-get install -y \
    openjdk-11-jre-headless \
    && rm -rf /var/lib/apt/lists/*

# Instalamos PySpark y Jupyter
RUN pip install pyspark jupyter

# Configuramos el directorio de trabajo
WORKDIR /app

# Copiamos los notebooks al contenedor, asumiendo que están en un directorio 'notebooks' en tu host
COPY notebooks/ ./notebooks/

# Exponemos el puerto para Jupyter
EXPOSE 8888

# Comando para iniciar Jupyter Notebook
CMD ["jupyter", "notebook", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
