<!--
FGA0003 - Compiladores 1
Curso de Engenharia de Software
Universidade de Brasília (UnB)
-->

# Otimização de código

Este repositório contém um exercício de fixação para a disciplina **Compiladores 1**, focado em otimização de código por meio de simplificações constantes (constant folding) usando Flex e Bison.

## Estrutura do diretório

```bash
├── src/            # Código-fonte
│   ├── lexer.l     # Definição do analisador léxico (Flex)
│   ├── parser.y    # Definição do analisador sintático (Bison)
│   ├── ast.h       # Definições da árvore de sintaxe abstrata (AST)
│   └── ast.c       # Implementação da AST e funções de otimização
├── tests/          # Casos de teste de entrada
│   ├── test1.in
│   ├── test2.in
│   └── test3.in
└── Makefile        # Instruções de compilação e execução de testes
```

## Requisitos

* **Flex**
* **Bison**
* **GCC** (ou outro compilador compatível com C)
* **libfl** (biblioteca do Flex)

Certifique-se de que todos estejam instalados e acessíveis no seu PATH.

## Compilação

No diretório raiz do projeto, execute:

```bash
make
```

Este comando gera o analisador léxico e sintático, e produz o executável `optimize`.

## Execução de testes

Para compilar e executar os testes, utilize:

```bash
make test
```

O alvo `test` compila o executável (caso ainda não esteja compilado) e roda cada arquivo em `tests/` exibindo entrada e saída.

## Limpeza

Para remover arquivos gerados (parser.tab.c, parser.tab.h, lex.yy.c e o executável), use:

```bash
make clean
```

## Autoria

* **Disciplina:** FGA0003 - Compiladores 1
* **Autor:** Prof. Sergio Antonio Andrade de Freitas
* **Instituição:** Universidade de Brasília (UnB)
* **Contato:** [sergiofreitas@unb.br](mailto:sergiofreitas@unb.br)

---

Para mais informações, consulte o enunciado da prática ou contate o docente da disciplina.
