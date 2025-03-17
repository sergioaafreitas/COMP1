/******************************************************
FGA0003 - Compiladores 1
Curso de Engenharia de Software
Universidade de Brasília (UnB)

Arquivo: parser.y
Descrição: Exemplo de gramática para expressão aritmética
******************************************************/


%{
#include <stdio.h>
#include <stdlib.h>
/* Declarações para evitar avisos de função implícita */
int yylex(void);
void yyerror(const char *s);
%}

/* Define valor semântico (intValue) */
%union {
    int intValue;
}

/* Token que carrega valor semântico */
%token <intValue> NUM

/* Tokens sem valor semântico, mas com precedência */
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN

/* Declara precedência:
   - PLUS e MINUS têm menor precedência
   - TIMES e DIVIDE têm maior precedência */
%left PLUS MINUS
%left TIMES DIVIDE

/* Associa o não terminal expr ao tipo intValue */
%type <intValue> expr

%%

expr:
      expr PLUS expr    { $$ = $1 + $3; }
    | expr MINUS expr   { $$ = $1 - $3; }
    | expr TIMES expr   { $$ = $1 * $3; }
    | expr DIVIDE expr  { $$ = $1 / $3; }
    | LPAREN expr RPAREN{ $$ = $2; }
    | NUM               { $$ = $1; }
    ;

%%

int main(void) {
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Erro sintático: %s\n", s);
}
