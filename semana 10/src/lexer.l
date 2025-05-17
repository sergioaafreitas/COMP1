%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%
int             return INT;
[0-9]+          { yylval.ival = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*  { yylval.sval = strdup(yytext); return ID; }
"="             return '=';
";"             return ';';
"+"             return '+';
[ \t\n]+       ;
.               ;
%%

int yywrap() { return 1; }
