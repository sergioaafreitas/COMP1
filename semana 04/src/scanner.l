/******************************************************
FGA0003 - Compiladores 1
Curso de Engenharia de Software
Universidade de Brasília (UnB)

Arquivo: lexer.l
Descrição: Exemplo de analisador léxico (tokens aritméticos)
******************************************************/

%{
#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"  /* contém definições geradas pelo Bison (NUM, PLUS, etc.) */
%}

%%

[0-9]+  {
    yylval.intValue = atoi(yytext);
    return NUM;
}
"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return TIMES; }
"/"     { return DIVIDE; }
"("     { return LPAREN; }
")"     { return RPAREN; }

[ \t\n]+  { /* não faz nada */ }

.        { printf("Caractere não reconhecido: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
