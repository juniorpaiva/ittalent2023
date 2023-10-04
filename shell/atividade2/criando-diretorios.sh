#!/bin/bash

# Loop para criar 10 diretórios
for ((i = 1; i <= 10; i++)); do
  nome_dir="diretorio_$i"
  mkdir "$nome_dir"
  echo "Diretório $nome_dir criado."
done

echo "Criação de diretórios concluída."
