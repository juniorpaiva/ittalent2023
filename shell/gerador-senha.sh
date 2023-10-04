#!/bin/bash

# Solicitar o tamanho da senha ao usuário
read -p "Digite o tamanho da senha desejada: " tamanho

# Verificar se o tamanho é um número válido
if ! [[ "$tamanho" =~ ^[0-9]+$ ]]; then
  echo "Tamanho inválido. Por favor, digite um número válido."
  exit 1
fi

# Inicializar a variável que armazenará a senha
senha=""

# Caracteres possíveis para a senha
caracteres="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

# Tamanho do conjunto de caracteres
tamanho_caracteres=${#caracteres}

# Loop para gerar a senha aleatória
for ((i = 0; i < tamanho; i++)); do
  # Lê um byte aleatório do /dev/random
  byte=$(head -c 1 /dev/random | od -An -t u1)
  
  # Calcula o índice no conjunto de caracteres
  indice=$((byte % tamanho_caracteres))
  
  # Adiciona o caractere correspondente à senha
  senha="${senha}${caracteres:indice:1}"
done

# Exibir a senha gerada
echo "Senha aleatória: $senha"

