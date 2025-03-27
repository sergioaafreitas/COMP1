%{
#include <stdio.h>
#include <stdHelib.h>
#include <string.h>

/* Declara a função yylex (gerada pelo Flex) e 
   a função yyerror, para evitar avisos de declaração implícita. */
int yylex(void);
void yyerror(const char *s);
%}

/* Definições dos tokens usados no .l */
%token HELLO 
%token WORLD

%%
/* Regra de gramática simples: ao ver HELLO seguido de WORLD, imprime mensagem */
start:
    HELLO WORLD { printf("Hello, World!\n"); }
  ;
%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro sintático: %s\n", s);
}
