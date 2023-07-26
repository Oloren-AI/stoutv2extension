FROM python:3.8-slim-buster

# Installing gcc, g++
RUN apt-get update && apt-get install -y gcc g++

# Installing necessary packages
RUN pip install tensorflow==2.10.1
RUN pip install rdkit
COPY Smiles-TO-iUpac-Translator /Smiles-TO-iUpac-Translator
RUN pip install -e /Smiles-TO-iUpac-Translator

RUN pip install oloren

RUN python -c "from STOUT import translate_forward, translate_reverse"
# Copying application code to the Docker image
COPY app.py /app.py

# Default command for the container
CMD ["python3.8", "/app.py"]
