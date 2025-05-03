%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "ast.h"
#include "tabela.h"

int yylex();
void yyerror(const char *s);
NoAST *raiz;
%}

%union {
    int valor;
    char nome[32];
    NoAST *no;
}

%token <valor> NUM
%token <nome> ID
%token INT
%type <no> expr stmt

%left '+' '-'
%right '='

%%

input:
    /* vazio */
  | input stmt '\n'
  | input stmt
;

stmt:
    INT ID ';' {
        if (buscarSimbolo($2)) yyerror("Redeclaracao de variavel");
        else inserirSimbolo($2, TIPO_INT);
        $$ = NULL;
    }
  | ID '=' expr {
        Simbolo *s = buscarSimbolo($1);
        if (!s) {
            yyerror("Identificador nao declarado");
            $$ = criarNoNum(0);
        } else {
            $$ = criarNoOp('=', criarNoId($1, s->tipo), $3);
        }
        printf("\nAST: ");
        imprimirAST($$);
    }
  | expr {
        $$ = $1;
        printf("\nAST: ");
        imprimirAST($$);
    }
;

expr:
    expr '+' expr {
        if (!tiposCompativeis($1->tipo, $3->tipo)) yyerror("Tipos incompativeis para '+'");
        $$ = criarNoOp('+', $1, $3);
    }
  | expr '-' expr {
        if (!tiposCompativeis($1->tipo, $3->tipo)) yyerror("Tipos incompativeis para '-'");
        $$ = criarNoOp('-', $1, $3);
    }
  | NUM { $$ = criarNoNum($1); }
  | ID {
        Simbolo *s = buscarSimbolo($1);
        if (!s) { yyerror("Identificador nao declarado"); $$ = criarNoNum(0); }
        else $$ = criarNoId($1, s->tipo);
    }
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro semantico: %s\n", s);
}

int main() {
    yyparse();
    printf("\nTabela de Simbolos:\n");
    imprimirTabela();
    return 0;
}