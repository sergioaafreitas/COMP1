/******************************************************
FGA0003 - Compiladores 1
Curso de Engenharia de Software
Universidade de Brasília (UnB)

Arquivo: parser.y
Descrição: Aula prática n. 5: continuação do parser + tratamento de erros
Exemplo de scanner
******************************************************/

%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h" /* tokens + union */
%}

/* Definicoes de padrao e acao */
%%

[0-9]+      { yylval.intValue = atoi(yytext); return NUM; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return TIMES; }
"/"         { return DIVIDE; }
"("         { return LPAREN; }
")"         { return RPAREN; }
";"         { return SEMI; }

[ \t\n\r]+  { /* nao faz nada */ }

.           { printf("Caractere nao reconhecido: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
