# Compilador simples de expressões (Flex + Bison)

Este projeto exemplifica como usar **Bison** e **Flex** para criar um analisador léxico (*scanner*) e sintático (*parser*) que reconhece expressões aritméticas básicas. Ele lida com operadores de soma, subtração, multiplicação e divisão, além de parênteses, com a precedência habitual (* e / têm maior precedência que + e -).

## Estrutura do projeto

```
.
├── Makefile
├── README.md
├── parser.y      (arquivo Bison)
├── scanner.l     (arquivo Flex)
└── (arquivos intermediários gerados na compilação)
```

- **parser.y**: Define a gramática das expressões e as regras de precedência.
- **scanner.l**: Reconhece números, operadores e parênteses na entrada.
- **Makefile**: Contém as instruções para compilar o projeto e limpar artefatos.

## Como compilar

1. Verifique se **Bison** e **Flex** estão instalados:
   ```bash
   flex --version
   bison --version
   ```
   Se precisar instalar (exemplo em distros Ubuntu/Debian):
   ```bash
   sudo apt-get update
   sudo apt-get install flex bison
   ```

2. Dentro da pasta do projeto, rode:
   ```bash
   make
   ```
   Isso vai executar:
   - `bison -d parser.y` → gerando `parser.tab.c` + `parser.tab.h`
   - `flex scanner.l` → gerando `lex.yy.c`
   - `gcc ... -lfl` → compilando tudo em um binário **parser**.

3. Ao final, você terá um executável chamado **parser** na mesma pasta.

## Como executar

Depois de rodar `make`, inicie o programa:

```bash
./parser
```

1. Digite uma expressão, por exemplo: `3+4*2`.
2. Em seguida, pressione **Ctrl+D** (Linux/macOS) ou **Ctrl+Z** (Windows) para sinalizar fim da entrada (EOF).

Caso queira enviar de uma só vez sem precisar pressionar Ctrl+D, você pode usar:

```bash
echo "3+4*2" | ./parser
```

### Comportamento de saída

- Se a **expressão for reconhecida** corretamente pela gramática, **nada** será impresso no caso deste exemplo mínimo. O programa simplesmente retorna ao terminal, indicando sucesso.
- Se a **expressão estiver incorreta**, o analisador sintático exibirá uma mensagem de erro do tipo:
  ```
  Erro sintático: ...
  ```
  e continuará (ou finalizará) de acordo com as regras definidas.

Se quiser exibir mensagens mesmo quando a expressão for correta, você pode ajustar a gramática (por exemplo, imprimir o valor da expressão ou apenas um “expressão reconhecida!”).

## Observação importante

Este projeto **não** imprime confirmação em caso de sucesso. Ele **silenciosamente** encerra, indicando que o parse foi bem-sucedido. Caso deseje um feedback ao usuário, basta inserir uma ação no final da gramática, por exemplo:

```yacc
/* Dentro de expr ou regra principal:
   { printf(\"Expressao valida!\n\"); }
```

## Como limpar

Para remover todos os arquivos gerados (executável, .c, .h), use:

```bash
make clean
```

## Exemplos de uso

- **Exemplo de entrada válida**:  
  ```
  ./parser
  10+20*3
  ^D
  ```
  (Sem nenhuma mensagem de erro, o programa termina silenciosamente com sucesso.)
- **Exemplo de entrada inválida**:
  ```
  ./parser
  (3+5))*
  ^D
  ```
  O parser exibirá algo como:
  ```
  Erro sintático: syntax error
  ```
  indicando que encontrou uma discrepância na gramática.

## Possíveis ajustes

- **Retornar valor**: você pode modificar o código para avaliar a expressão e imprimir seu resultado.
- **Finalizar após 1 linha**: inserir regras para que o parser entenda um caractere como `;` ou `\n` como final de expressão.
- **Reconhecer múltiplas linhas**: estender a gramática para processar diversas expressões seguidas.

---

**Bom estudo e boas práticas no desenvolvimento de compiladores!**