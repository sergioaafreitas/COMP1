%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
%}

digit   [0-9]
letter  [a-zA-Z]
id      {letter}({letter}|{digit})*
number  {digit}+

%%

[ \t]+               ; /* ignora espaços em branco */

{number}{letter}+   { printf("Caractere inválido: %s\n", yytext); exit(1); }
{number}            { yylval.intval = atoi(yytext); return NUM; }
{id}                { yylval.id = strdup(yytext); return ID; }
"("                 { return '('; }
")"                 { return ')'; }
"+"                 { return PLUS; }
"-"                 { return MINUS; }
\n                  { return '\n'; }
.                   { printf("Caractere inválido: %s\n", yytext); exit(1); }

%%

int yywrap(void) {
    return 1;
}
