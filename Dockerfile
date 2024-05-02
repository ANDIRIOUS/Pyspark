# Use the official Python image that includes Java (needed for PySpark)
FROM jupyter/pyspark-notebook

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the requirements.txt file into the container
COPY requirements.txt ./

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application's code
COPY ejemplo.parquet .
COPY Produccion_Pesquera_2020.csv .
COPY clase.ipynb .

# Expose the port Jupyter Notebook will run on
EXPOSE 8888

# Run Jupyter Notebook
# --NotebookApp.token='' disables the token. You should consider security implications.
CMD ["start-notebook.sh", "--NotebookApp.token=''", "--NotebookApp.password=''"]
