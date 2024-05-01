# Pyspark
Repo de la clase de Pyspark para Fuentes_2024 

# Como moontar el docker

una vez que estemos dentro de la carpeta en la que vayamos a trabajar vamos a clonar el repositorio de git de la clase de la siguiente manera: 

#+BEGIN_SRC bash
git pull git@github.com:ANDIRIOUS/Pyspark.git
#+END_SRC


Una vez tengamos el repositorio en nuestra computadora tenemos que montar el docker. 
Nota: el siguiente comando se ejecuta parado dentro de la carpeta del repositorio

#+BEGIN_SRC bash
docker build -t pyspark .
#+END_SRC

Ahora vamos a correr el docker

#+BEGIN_SRC bash
docker run pyspark
#+END_SRC

