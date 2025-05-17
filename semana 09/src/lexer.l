%{
#include "parser.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+          { yylval.num = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.id = strdup(yytext); return ID; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return TIMES; }
"/"             { return DIVIDE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
[ \t\n]+        { /* ignore whitespace */ }
.               { fprintf(stderr, "Caractere inválido: %s\n", yytext); }

%%

int yywrap(void) { return 1; }
