# *Guia rápido* das expressões regulares mais usadas **no Flex**

## 1. Sintaxe básica de expressões regulares no Flex

No arquivo `.l` (Flex), cada regra é definida no formato:

```
Padrão    { /* ação em C/C++ */ }
```

Onde *Padrão* é uma expressão regular que descreve quais cadeias o analisador léxico deve reconhecer, e a *ação* (entre chaves) é o código a ser executado quando esse padrão for encontrado.

### Exemplos de padrões simples

- **Letras minúsculas**: `[a-z]`
- **Dígitos**: `[0-9]`
- **Combinação de letras e dígitos**: `[a-zA-Z0-9]`
- **Espaço em branco**: `[ \t]`
- **Tabulação e quebras de linha**: `[ \t\n]`
- **Qualquer caractere**: `.` (no Flex, o ponto corresponde a qualquer caractere **exceto** quebra de linha; para incluir quebras de linha, usar `[.\n]` ou algo semelhante)
- **Combinação de símbolos**: `[+\-*/]`

---

## 2. Operadores de repetição

- `*` : Zero ou mais ocorrências  
  - Ex: `[0-9]*` → sequência de dígitos de comprimento variável, inclusive vazio  
- `+` : Uma ou mais ocorrências  
  - Ex: `[a-z]+` → pelo menos uma letra minúscula  
- `?` : Zero ou uma ocorrência  
  - Ex: `[+\-]?[0-9]+` → um número que pode ter sinal + ou - opcional  
- `{n}` : Exatamente *n* ocorrências  
  - Ex: `[0-9]{3}` → exatamente 3 dígitos  
- `{n,}` : Pelo menos *n* ocorrências  
  - Ex: `[0-9]{2,}` → 2 ou mais dígitos  
- `{n,m}` : De *n* até *m* ocorrências  
  - Ex: `[0-9]{1,10}` → entre 1 e 10 dígitos

---

## 3. Agrupamento, alternância e classes

- **Parênteses**: `(...)`  
  - Agrupam subpadrões e permitem aplicar operadores de repetição ao grupo.  
- **Barra de alternância**: `|`  
  - Indica “OU” entre padrões. Ex: `(while|for|if)`  
- **Classes de caracteres**: `[ ... ]`  
  - Lista de caracteres que podem aparecer em uma posição.  
  - Pode usar intervalos. Ex: `[a-zA-Z]`, `[0-9]`, `[0-9A-Fa-f]`  
- **Negação** em classes: `[^ ... ]`  
  - Ex: `[^0-9]` para qualquer coisa que **não seja** dígito.

---

## 4. Âncoras de início e fim de linha

- **`^`** : corresponde ao início da linha.  
- **`$`** : corresponde ao final da linha.  
- Exemplo: `^[a-zA-Z_][a-zA-Z0-9_]*$`  
  - Reconheceria apenas strings que, do começo ao fim da linha, sejam identificadores.  
- Lembre que no Flex, por padrão, o analisador está lendo fluxo contínuo, então `^` e `$` podem se comportar um pouco diferente do *grep* tradicional; a depender do modo (inclusão de `option REJECT` ou `option noyywrap`), pode haver nuances.

---

## 5. Metacaracteres comuns

Para usar caracteres que têm significado especial em expressões regulares (ex.: `*`, `+`, `?`, `|`, `(`, `)`, `[`, `]`, `.`, `^`, `$`, `\`), é preciso **escapar** com `\` quando desejamos o caráter literal:

- Exemplo: `\*` → corresponde ao caractere `*` literal.  
- Em classes de caracteres, alguns metacaracteres podem não precisar de escape (depende do contexto).

---

## 6. Tratamento de espaços em branco e ignorados

Em geral, para ignorar espaços, tabulações e quebras de linha, define-se algo como:

```c
[ \t\n]+    { /* não faz nada, ignora */ }
```

Isso faz com que qualquer sequência de espaços, tabulações e quebras de linha não produza *tokens* e seja descartada.

---

## 7. Retorno de tokens para o Bison

Cada padrão, quando correspondido, **retorna** um *token* (definido no arquivo `.y`), por exemplo:

```c
"if"    { return IF; }
"+"     { return PLUS; }
"-"     { return MINUS; }
```

Para tokens que transportam um valor semântico (ex.: números inteiros), definimos algo como:

```c
[0-9]+  {
    /* converte string para inteiro */
    yylval.intValue = atoi(yytext); 
    return NUM;
}
```

No arquivo `.y`, precisamos ter:

```c
%union {
    int intValue; 
}
%token <intValue> NUM
```

---

## 8. Exemplo rápido

### Arquivo `.l` (Flex)

```c
%{
#include "calc.tab.h"   /* Para Bison: #include do arquivo gerado, contendo tokens */
#include <stdlib.h>
%}

%%

[ \t\n]+              /* ignora espaços */
[0-9]+  {
    yylval.intValue = atoi(yytext);
    return NUM;
}
"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return TIMES; }
"/"     { return DIV; }
"("     { return LPAREN; }
")"     { return RPAREN; }
.       { /* tudo mais é ignorado ou tratável como erro */ }

%%
int yywrap() { return 1; }
```

### Arquivo `.y` (Bison)

```c
%{
#include <stdio.h>
#include <stdlib.h>
%}

%union {
    int intValue;
}

%token <intValue> NUM
%token PLUS MINUS TIMES DIV LPAREN RPAREN

%%

expr:
    expr PLUS expr    { $$ = $1 + $3; }
  | expr MINUS expr   { $$ = $1 - $3; }
  | expr TIMES expr   { $$ = $1 * $3; }
  | expr DIV expr     { $$ = $1 / $3; }
  | LPAREN expr RPAREN{ $$ = $2; }
  | NUM               { $$ = $1; }
  ;

%%
int main(void) {
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}
```

Em resumo: **Flex** aceita entradas que correspondem a expressões regulares (padrões) e para cada correspondência, executa uma ação que normalmente **retorna um token** para o **Bison**, o qual então aplica suas regras de gramática para compor a análise sintática.

---

## 9. Dicas Finais

1. **Cuidado com caracteres especiais**: use barras invertidas para escapá-los, se necessário.  
2. **Modo de leitura**: por padrão, Flex lê **toda a linha**? Ele continua lendo até não encontrar mais correspondências? Estude as seções “global declaration”, “rules” e “user code” no manual do Flex.  
3. **Ignorar vs. gerar erro**: muitas vezes, usamos `.` para ignorar caracteres não reconhecidos. Em uma aplicação real, pode ser útil gerar uma mensagem de erro:  
   ```c
   . { fprintf(stderr, "Caractere invalido: %s\n", yytext); }
   ```
4. **Testar incrementalmente**: teste cada regra, usando entradas específicas, para ver se o Flex as reconhece conforme esperado.  
5. **Integração com Bison**: lembre-se de declarar `%union` e `%token` no arquivo `.y` para que tokens que carregam valor possam ser acessados via `yylval`.  

Este guia deve servir como **referência rápida** para quem está iniciando o uso de **expressões regulares no Flex**, com foco em análise léxica e *handshake* com o **Bison**.