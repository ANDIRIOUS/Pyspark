# Pyspark
Repo de la clase de Pyspark para Fuentes_2024 

![Pyspark](mamados)

# Como montar el docker
En una carpeta nueva FUERA DEL REPOSITORIO DE FUENTE DE DATOS vamos a clonar el repositorio de git de la clase de la siguiente manera: 

```bash
git clone git@github.com:ANDIRIOUS/Pyspark.git
```

Una vez tengamos el repositorio en nuestra computadora tenemos que montar el docker. 
Nota: el siguiente comando se ejecuta parado dentro de la carpeta del repositorio que acabamos de clonar
Nota 2: PySpark es un poco pesado, no se proecupen si se tarda en hacer la imagen. 

```bash
docker build -t pyspark .
```
Ahora vamos a correr el docker que nos va a generar un jypiter notebook en el browser. 


```bash
docker run -p 8888:8888 pyspark

```
Se va a quedar pensando en algún punto. Si esto pasa busquen la línea en la terminal que diga "Jupyter Notebook running at:" 
Denle control click en el segundo link que aparece: http://127.0.0.1:8888/lab  
Esto los deberá llevar al jupyter notebook en su browser con el que trabajaremos el resto de la clase. 

Nota: Para entregar la tarea hagan un fork de este repositorio y súbanla en la carpeta de tareas. Su tarea debe traer su nombre y clave única en el nombre nombre del archivo. 


