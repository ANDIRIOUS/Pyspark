# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /pyspark

# Copy the requirements files
COPY requirements.txt /pyspark/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire directory where your notebook exists into the container
# Make sure to change `./local_notebook_directory` to the path where your notebook is located
COPY ./prueba.ipynb /pyspark

# Expose the port Jupyter will run on
EXPOSE 8888

# Start Jupyter Lab
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
