## Roteiro: configuração do ambiente para compiladores (Flex e Bison)

Este roteiro apresenta os procedimentos para instalação e configuração das ferramentas Flex, Bison e Git, tanto para usuários Windows quanto para Linux (Ubuntu), visando preparar estudantes para o desenvolvimento de projetos acadêmicos de compiladores.

### 1. Introdução

O objetivo deste roteiro é preparar o ambiente de desenvolvimento com as seguintes ferramentas:

- **Flex:** para análise léxica.
- **Bison:** para análise sintática.
- **Git e GitHub:** controle de versão e colaboração.

---

## 1. Instalação e configuração do ambiente

### 1.1 Windows

Recomenda-se o uso do WSL (Windows Subsystem for Linux) para simplificar o uso de Flex e Bison no Windows.

**1.1.1 Ativação do WSL:**

- Abra o PowerShell como administrador e execute:
```powershell
wsl --install
```

Após reiniciar o computador, instale as ferramentas no Ubuntu disponível pelo WSL.

**1.1.2 Instalação do Flex, Bison e Git no WSL (Ubuntu):**

```bash
sudo apt update
sudo apt install flex bison build-essential git -y
```

---

### 1.2 Linux (Ubuntu)

Execute os comandos:

```bash
sudo apt update
sudo apt install flex bison build-essential git -y
```

---

### 1.3 Verificação das instalações

Verifique as versões para garantir a instalação correta:

```bash
flex --version
bison --version
git --version
```

---

## 2. Configuração do Git e integração com o GitHub

### 2.1 Configurar o Git

Configure nome e e-mail (substitua pelo seu nome e e-mail):

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@exemplo.com"
```

### 1.3 Criação e configuração de repositório no GitHub

- Acesse o GitHub e crie um novo repositório, por exemplo: `compiladores-flex-bison`.
- Clone o repositório para sua máquina:

```bash
git clone https://github.com/usuario/repo-compiladores.git
cd nome-do-repositorio
```

---

## 2. Estrutura inicial do projeto

Sugestão para organização inicial do projeto:

```
compiladores-projeto
│
├── lexer
│   └── lexer.l
├── parser
│   └── parser.y
├── src
│   └── main.c
├── Makefile
└── README.md
```

---

## 3. Arquivos iniciais: Flex e Bison

### 2.1 Exemplo inicial para o arquivo Flex (`lexer.l`):

```c
%{
#include "parser.tab.h"
%}

%%

[0-9]+          { yylval = atoi(yytext); return NUM; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIVIDE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
[ \t\n]+        { /* Ignorar espaços em branco */ }
.               { printf("Caractere inválido: %s\n", yytext); }

%%
```

---

## 3. Configuração do analisador sintático (Bison):

Crie o arquivo `parser.y` com estrutura básica:

```yacc
%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUM PLUS MINUS TIMES DIVIDE LPAREN RPAREN

%%

expressao:
    expressao PLUS expressao
  | expressao MINUS expressao
  | expressao TIMES expressao
  | expressao DIVIDE expressao
  | LPAREN expressao RPAREN
  | NUM
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro sintático: %s\n", s);
}

int main(void) {
    yyparse();
    return 0;
}
```

---

## 3. Compilação do projeto

### 3.1 Compilação dos arquivos Flex e Bison

A partir da raiz do projeto, execute os seguintes comandos:

```bash
flex lexer/lexer.l
bison -d parser/parser.y
```

### 3.2 Compilação do executável usando GCC

```bash
gcc -o compilador lex.yy.c parser.tab.c -lfl
```

### 3.2 Execução do programa compilado

Execute o programa com o comando:

```bash
./a.out
```

Teste digitando uma expressão como:

```
3 + 4
```

Após digitar, pressione `Ctrl+D` (Linux/WSL) ou `Ctrl+Z` (Windows) para encerrar.

---

## 4. Gerenciamento do projeto no GitHub

### 4.1 Subir código para o GitHub:

```bash
git init
git add .
git commit -m "Estrutura inicial do projeto com Flex e Bison"
git remote add origin URL_DO_SEU_REPOSITÓRIO_GITHUB
git branch -M main
git push -u origin main
```

---

## 5. Termos específicos do projeto (flex e bison)

- **lexer.l:** arquivo contendo as regras léxicas (tokens).
- **parser.y:** arquivo com regras gramaticais (parser).
- **yylex:** função gerada por Flex que obtém tokens.
- **yyparse:** função gerada por Bison que realiza análise sintática.
- **yylval:** variável que armazena o valor semântico do token reconhecido.
- **yytext:** armazena texto do token identificado pelo lexer.

---

## 6. Considerações finais

Este roteiro guia a instalação e configuração inicial das ferramentas Flex e Bison, além do Git e GitHub, estruturando o desenvolvimento de projetos de compiladores de forma organizada e integrada.