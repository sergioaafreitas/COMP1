/* exemplo.y */

%{
#include <stdio.h>
#include <stdlib.h>

/* 
   Declarações explícitas para evitar warnings de 
   “implicit declaration of function yylex/yyerror”
*/
int yylex(void);
void yyerror(const char *s);

%}

%token NUM

%union {
    int intValue;
}

%type <intValue> NUM

%%
/* A gramática */
programa:
    lista_numeros
    ;

lista_numeros:
      lista_numeros NUM { printf("Número lido: %d\n", $2); }
    | NUM               { printf("Número lido: %d\n", $1); }
    ;
%%

/* Definição de yyerror */
void yyerror(const char *s) {
    fprintf(stderr, "Erro sintático: %s\n", s);
}
