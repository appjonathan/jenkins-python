# Verwenden Sie ein offizielles Python-Runtime-Image als Basis
FROM python:3.8-slim-buster

# Setzen Sie das Arbeitsverzeichnis im Container auf /app
WORKDIR /app

# Kopieren Sie die Datei requirements.txt in das Arbeitsverzeichnis des Containers
COPY requirements.txt ./

# Installieren Sie alle in requirements.txt aufgeführten Abhängigkeiten
RUN pip install --no-cache-dir -r requirements.txt

# Kopieren Sie den Rest des Anwendungscodes in das Arbeitsverzeichnis des Containers
COPY . .

# Führen Sie main.py aus, wenn der Container gestartet wird
CMD ["python", "./main.py"]