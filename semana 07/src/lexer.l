%{
#include "ast.h"
#include "parser.tab.h"
#include <string.h>
%}

%%
"int"                  { return INT; }
";"                    { return ';'; }
"="                    { return '='; }
[0-9]+                 { yylval.valor = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]* { strcpy(yylval.nome, yytext); return ID; }
[\n]                   { return '\n'; }
[+\-]                  { return yytext[0]; }
[ \t]+                 { /* ignora */ }
.                      { printf("Caractere inválido: %s\n", yytext); }
%%

int yywrap() { return 1; }