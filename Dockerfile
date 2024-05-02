# Start with a Debian base image for broader package support
FROM debian:buster-slim

# Set the working directory in the container
WORKDIR /app

# Install Python, Java, and necessary build tools for compiling Python packages
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev openjdk-11-jre-headless curl build-essential libffi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Update pip to the latest version
RUN pip3 install --upgrade pip

# Create symlinks for python3 to python and pip3 to pip if not already set
RUN ln -s /usr/bin/python3 /usr/bin/python || true && \
    ln -s /usr/bin/pip3 /usr/bin/pip || true

# Install Python packages from requirements.txt
# Be sure to copy your requirements.txt file into the Docker context
COPY requirements.txt /app/
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the Jupyter notebook into the container
# Ensure that your notebook file is in the Docker context
COPY ./prueba.ipynb /app/

# Expose the port Jupyter Lab will run on
EXPOSE 8888

# Configure environment variables for Java and PySpark
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Configure environment variable for PySpark to find python
ENV PYSPARK_PYTHON python3

# Start Jupyter Lab with desired configuration
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
