# Prática – Integração da Análise Semântica no Compilador

**Disciplina:** FGA0003 – Compiladores 1  
**Professor:** Dr. Sergio Antônio Andrade de Freitas

## Objetivo
Integrar verificação de tipos e escopo ao compilador em desenvolvimento (com Flex e Bison).

## Funcionalidades
- Verificação de declaração de variáveis
- Detecção de redeclaração
- Verificação de compatibilidade de tipos
- Anotação da AST com tipos

## Execução
```bash
make
./parser
```

## Exemplo de entrada válida:
```
int a;
a = 10 + 5
```

## Exemplos que geram erro:
```
x = 10          # ERRO: variável 'x' não declarada
int a;
int a;          # ERRO: 'a' redeclarada
a = "texto"     # ERRO: tipos incompatíveis
```

## Testes Automatizados

A pasta `tests/` contém arquivos de entrada com exemplos válidos e inválidos para verificar a análise semântica.

### Execução dos testes
```bash
./run_tests.sh
```

### Arquivos de teste incluídos:
- `valido_01.txt` – expressão válida com variável declarada.
- `valido_02.txt` – atribuição direta válida.
- `erro_nao_declarada.txt` – uso de variável não declarada.
- `erro_redeclaracao.txt` – tentativa de declarar variável já existente.
- `erro_tipo.txt` – incompatibilidade de tipos na atribuição.
