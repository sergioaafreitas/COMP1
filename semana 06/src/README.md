# FGA0003 – Compiladores 1
### Curso de Engenharia de Software – Universidade de Brasília (UnB)
### Prof. Dr. Sergio Antônio Andrade de Freitas

---

## Projeto: Estruturas Internas em Compiladores (AST e Tabela de Símbolos)

Este repositório contém códigos fonte e exemplos para implementar:

- Uma **Árvore Sintática Abstrata (AST)**.
- Uma **Tabela de Símbolos** básica.
- Analisadores léxico e sintático com **Flex e Bison**.

## Organização dos arquivos

```
projeto-compilador
├── ast.c
├── ast.h
├── tabela.c
├── tabela.h
├── tipos.h
├── parser.y
├── lexer.l
└── Makefile
```

---

## Como compilar e executar

1. **Compilação:**

```bash
make
```

2. **Execução:**

```bash
./parser
```

3. **Exemplo rápido:**

Digite expressões simples como:

```
x + 10 - y
```

Finalize a entrada pressionando **`Ctrl+D`** (Linux/WSL).

---

## Casos de uso

### ✅ Exemplos corretos:

- Entrada de expressões simples:
  ```
  a + b
  x - 42
  numero + 3 - valor
  ```

- A saída deve exibir a AST corretamente construída e a tabela de símbolos contendo os identificadores utilizados.

### Exemplo de saída esperada:
```
Árvore Sintática Abstrata (AST):
(a + b)
Tabela de Símbolos:
Nome: a, Tipo: int
Nome: b, Tipo: int
```

---

## Casos que resultam em erro

- **Exemplo 1 (Token inválido):**
  ```
  a $ b
  ```
  - Erro esperado:
    ```
    Caractere inválido: $
    ```

- **Exemplo 2 (Erro sintático, operador consecutivo):**
  ```
  a + - b
  ```
  - Mensagem esperada:
    ```
    Erro: syntax error
    ```

- **Exemplo 3 (Expressão incompleta):**
  ```
  a +
  ```
  - Erro esperado:
    ```
    Erro: syntax error
    ```

- **Exemplo 3 (Entrada numérica inválida):**
  ```
  42a + b
  ```
  - Erro esperado:
    ```
    Caractere inválido: 42a
    ```

---

## Testando e validando o projeto

Ao terminar a digitação, use `Ctrl+D` para indicar fim da entrada e validar o comportamento do seu parser, observando:

- Construção correta da AST.
- Atualização da Tabela de Símbolos.
- Mensagens claras para erros léxicos ou sintáticos.

---

## Limpeza do projeto

Para limpar arquivos gerados (após testes):

```bash
make clean
```

---

## Dependências

- Flex
- Bison
- GCC

Certifique-se que estas ferramentas estão instaladas. Caso precise instalar:

```bash
sudo apt update
sudo apt install flex bison build-essential -y
```

---

## Contato e Dúvidas

- **Professor:** Dr. Sergio Antônio Andrade de Freitas
- **E-mail:** sergiofreitas@unb.br
- **GitHub da Disciplina:** [COMP1](https://github.com/sergioaafreitas/COMP1)

---

**FGA0003 - Compiladores 1**  
Curso de Engenharia de Software  
Universidade de Brasília (UnB)

