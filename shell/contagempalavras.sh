#!/bin/bash

# Verifica se um arquivo foi fornecido como argumento
if [ $# -ne 1 ]; then
  echo "Uso: $0 <arquivo_de_texto>"
  exit 1
fi

# Armazena o nome do arquivo fornecido como argumento
arquivo="$1"

# Verifica se o arquivo existe
if [ ! -f "$arquivo" ]; then
  echo "O arquivo '$arquivo' não existe."
  exit 1
fi

# Usa o comando 'wc' para contar as palavras no arquivo e exibe o resultado
num_palavras=$(wc -w "$arquivo" | awk '{print $1}')
echo "O arquivo '$arquivo' contém $num_palavras palavras."
