# Guia simplificado: passos para criação de um compilador

Este guia apresenta etapas para a implementação prática de um compilador.

## 1. Definir a linguagem-fonte
- Descrever a sintaxe e a semântica básica da linguagem.
- Elaborar a gramática formal (por exemplo, gramática livre de contexto).

## 2. Análise léxica com Flex
- Criar regras para identificar tokens.
- Definir expressões regulares para reconhecer padrões de texto e gerar tokens.

## 3. Implementar o analisador sintático com Bison
- Criar a gramática em formato reconhecido pelo Bison.
- Associar tokens com regras gramaticais e ações semânticas simples.

## 4. Criar a análise semântica básica
- Verificar tipos das variáveis e escopo.
- Reportar erros semânticos (como incompatibilidade de tipos ou variáveis não declaradas).

## 5. Gerar código intermediário simples
- Definir uma representação intermediária (por exemplo, código de três endereços).
- Converter a árvore sintática para essa representação intermediária.

## 6. Otimizar o código intermediário (passo opcional)
- Aplicar técnicas básicas, como remoção de código morto e otimização de expressões simples.

## 7. Gerar o código final (linguagem-alvo)
- Traduzir o código intermediário para linguagem assembly ou código de máquina simples.
- Testar geração do código com programas-exemplo.
