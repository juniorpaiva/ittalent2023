#!/bin/bash

# Solicita ao usuário que digite um número
read -p "Digite um número: " numero

# Verifica se o número é válido
if ! [[ "$numero" =~ ^[0-9]+$ ]]; then
  echo "Entrada inválida. Por favor, digite um número válido."
  exit 1
fi

# Verifica se o número é ímpar ou par
if ((numero % 2 == 0)); then
  echo "O número $numero é par."
else
  echo "O número $numero é ímpar."
fi
