#!/bin/bash
echo "Executando testes de análise semântica..."
make > /dev/null 2>&1
for file in tests/*.txt; do
    echo "=========================="
    echo "Arquivo: $file"
    echo "--------------------------"
    ./parser < "$file"
    echo ""
done