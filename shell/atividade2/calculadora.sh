#!/bin/bash

# Função para realizar a operação de adição
adicao() {
  resultado=$(echo "$1 + $2" | bc)
  echo "Resultado: $resultado"
}

# Função para realizar a operação de subtração
subtracao() {
  resultado=$(echo "$1 - $2" | bc)
  echo "Resultado: $resultado"
}

# Função para realizar a operação de multiplicação
multiplicacao() {
  resultado=$(echo "$1 * $2" | bc)
  echo "Resultado: $resultado"
}

# Função para realizar a operação de divisão
divisao() {
  if [ $2 -eq 0 ]; then
    echo "Erro: divisão por zero."
  else
    resultado=$(echo "scale=2; $1 / $2" | bc)
    echo "Resultado: $resultado"
  fi
}

# Menu de opções
while true; do
  echo "Calculadora Simples"
  echo "Selecione a operação desejada:"
  echo "1. Adição"
  echo "2. Subtração"
  echo "3. Multiplicação"
  echo "4. Divisão"
  echo "5. Sair"
  read -p "Opção: " opcao

  case $opcao in
    1)
      read -p "Digite o primeiro número: " num1
      read -p "Digite o segundo número: " num2
      adicao "$num1" "$num2"
      ;;
    2)
      read -p "Digite o primeiro número: " num1
      read -p "Digite o segundo número: " num2
      subtracao "$num1" "$num2"
      ;;
    3)
      read -p "Digite o primeiro número: " num1
      read -p "Digite o segundo número: " num2
      multiplicacao "$num1" "$num2"
      ;;
    4)
      read -p "Digite o primeiro número: " num1
      read -p "Digite o segundo número: " num2
      divisao "$num1" "$num2"
      ;;
    5)
      echo "Saindo da calculadora."
      exit 0
      ;;
    *)
      echo "Opção inválida. Por favor, escolha uma opção válida."
      ;;
  esac
done
