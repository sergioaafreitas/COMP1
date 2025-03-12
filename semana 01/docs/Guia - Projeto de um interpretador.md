# Guia simplificado: passos para criação de um interpretador

Este guia apresenta etapas para a implementação prática de um interpretador usando as ferramentas Flex e Bison.

## 1. Definir a linguagem interpretada
- Definir claramente sintaxe e semântica da linguagem interpretada.
- Elaborar a gramática formal adequada à interpretação (por exemplo, operações matemáticas simples, variáveis e comandos básicos).

## 2. Implementar a análise léxica com Flex
- Criar regras no Flex para identificar tokens.
- Definir expressões regulares que reconheçam padrões do texto e retornem tokens ao analisador sintático.

## 3. Construir o analisador sintático com Bison
- Escrever a gramática compatível com o formato do Bison.
- Associar tokens a regras gramaticais.
- Definir ações semânticas no Bison para construção de uma árvore sintática abstrata (AST).

## 3.1 Gerar árvore sintática abstrata (AST)
- Modificar ações semânticas do parser para produzir uma AST durante a análise sintática, simplificando o processo de interpretação posterior.

## 4. Implementar análise semântica básica
- Avaliar a coerência semântica diretamente na AST gerada (ex.: verificação de tipos, variáveis declaradas e inicializadas).
- Reportar erros semânticos identificados antes da execução.

## 5. Implementar a interpretação da AST (em substituição à geração de código intermediário)
- Percorrer recursivamente a AST para avaliar expressões e executar comandos diretamente.
- Implementar estruturas básicas, como atribuição de valores a variáveis e operações aritméticas.

## 5. Otimização opcional na interpretação
- Aplicar técnicas simples, como simplificação de expressões constantes antes da execução da AST, para aumentar eficiência durante a interpretação.

## 6. Execução direta do programa interpretado
- Implementar um loop principal que receba comandos ou scripts, interpretando-os diretamente durante a execução.
- Testar a interpretação com exemplos práticos definidos previamente.