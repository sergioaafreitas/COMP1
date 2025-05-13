#!/bin/bash
echo "Executando testes TAC"
make > /dev/null 2>&1
for file in tests/*.txt; do
  echo "======================"
  echo "Arquivo: $file"
  echo "----------------------"
  echo "Simulando entrada: $(cat $file)"
  ./main < $file
  echo ""
done