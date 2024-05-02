# Start with a Debian base image
FROM debian:buster-slim

# Set the working directory in the container
WORKDIR /app

# Install Python, Java, and other necessary tools
RUN apt-get update && \
    apt-get install -y python3-pip python3-dev openjdk-11-jre-headless curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create symlinks for python3 to python and pip3 to pip
RUN ln -s /usr/bin/python3 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip

# Copy the requirements files
COPY requirements.txt /app//requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Jupyter notebook into the container
COPY ./prueba.ipynb /app
COPY ./ejemplo.parquet /app
COPY ./Produccion_Pesquera_2020.csv /app

# Expose the port Jupyter will run on
EXPOSE 8888

# Configure environment variables for Java and PySpark
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Start Jupyter Lab with desired configuration
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
