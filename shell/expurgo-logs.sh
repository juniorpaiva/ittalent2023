#!/bin/bash

# Diretório de logs
diretorio_logs="/var/log"

# Extensão dos arquivos a serem removidos
extensao=".log"

# Número de dias para considerar a remoção
dias=7

# Usar o comando 'find' para encontrar os arquivos .log com mais de 7 dias
# e em seguida, usar o comando 'rm' para removê-los
find "$diretorio_logs" -name "*$extensao" -type f -mtime +$dias -exec rm {} \;

echo "Arquivos .log com mais de $dias dias foram removidos em $diretorio_logs."
