# Monitoreo y Análisis de Señales Médicas con HTM.core 

Este proyecto tiene como objetivo principal analizar las señales médicas de pacientes pediátricos mediante modelos de inteligencia artificial, con el propósito de comprender la evolución de su condición clínica. La propuesta se centra en la identificación de patrones y tendencias en los signos vitales a lo largo del tiempo, contribuyendo así a la toma de decisiones clínicas por parte del personal de salud en contextos hospitalarios.

Este proyecto utiliza un contenedor Docker para compilar e instalar la librería [HTM.core](https://github.com/htm-community/htm.core) desde su código fuente, permitiendo un entorno reproducible para el desarollo y ejecución de los modelos desarollados.

---

## 1. Clonar el repositorio y construir la imagen del contenedor

Para comenzar, clone este repositorio en su entorno local:

```bash
git clone https://github.com/Daniel27110/htm-patient-monitoring.git

cd htm-patient-monitoring
```

A continuación, construya la imagen de Docker a partir del archivo `Dockerfile` provisto:

```bash
docker build -t htm-core-image .
```

Una vez finalizada la construcción, puede iniciar un contenedor interactivo utilizando el siguiente comando:

```bash
docker run -it htm-core-image bash
```

---

## 2. Ejecución del notebook `desarollo_modelo.ipynb`

Este proyecto incluye un notebook Jupyter llamado `desarollo_modelo.ipynb`, que contiene el utilizado para la construcción y evaluación de los modelos desarollados. Para ejecutar el notebook, asegúrese de que el contenedor esté en ejecución y luego ejecute el siguiente comando:

```bash
docker run -it -v $(pwd):/app/htm-patient-monitoring htm-core-image bash

jupyter nbconvert --to notebook --execute --inplace htm-patient-monitoring/desarollo_modelo.ipynb
```

---

## 3. Ejecución del script `ejecutar_modelo.py`

El script `ejecutar_modelo.py` es el encargado de ejecutar el modelo y realizar predicciones sobre los datos de un paciente específico. Para ejecutar este script, asegúrese de que el contenedor esté en ejecución y luego ejecute el siguiente comando:

```bash
docker run -it -v $(pwd):/app/htm-patient-monitoring htm-core-image bash

python htm-patient-monitoring/ejecutar_modelo.py

```