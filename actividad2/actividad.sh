#!/bin/bash

# Leer la variable GITHUB_USER
GITHUB_USER="josuerobld"

# Consultar la API de GitHub
API_URL="https://api.github.com/users/$GITHUB_USER"
DATA=$(curl -s "$API_URL")

# Extraer los datos requeridos del JSON
USER_ID=$(echo "$DATA" | jq -r '.id')
CREATED_AT=$(echo "$DATA" | jq -r '.created_at')

# Imprimir el mensaje con los datos obtenidos
MESSAGE="Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."
echo "$MESSAGE"

# Crear el log file con la salida del mensaje
LOG_DIR="/tmp/$(date +'%Y%m%d')"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/saludos.log"
echo "$MESSAGE" >> "$LOG_FILE"

echo "El log se ha creado en: $LOG_FILE"
