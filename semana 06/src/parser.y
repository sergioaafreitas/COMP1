%{
#include <stdio.h>
#include <stdlib.h>
#include "ast.h"
#include "tabela.h"

void yyerror(const char *s);
extern int yylex(void);
NoAST *root = NULL;
%}

%code requires {
#include "ast.h"
}

%union {
    int intval;
    char *id;
    NoAST *ast;
}

%token <intval> NUM
%token <id> ID
%token PLUS MINUS
%left PLUS MINUS

%type <ast> expr

%%

program:
      /* vazio */
    | program line
    ;

line:
      expr '\n' {
          root = $1;
          printf("\nÁrvore Sintática Abstrata (AST):\n");
          imprimirAST(root);
          printf("\n");
          imprimirTabela();
      }
    | expr {
          root = $1;
          printf("\nÁrvore Sintática Abstrata (AST):\n");
          imprimirAST(root);
          printf("\n");
          imprimirTabela();
      }
    | '\n' { }
    | error '\n' { yyerror("syntax error"); yyclearin; }
    ;

expr:
      expr PLUS expr {
          $$ = criarNoOp('+', $1, $3);
      }
    | expr MINUS expr {
          $$ = criarNoOp('-', $1, $3);
      }
    | NUM {
          $$ = criarNoNum($1);
      }
    | ID {
          $$ = criarNoId($1);
          inserirSimbolo($1, "int");
          free($1);
      }
    | '(' expr ')' {
          $$ = $2;
      }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}

int main(void) {
    printf("Digite as expressões:\n");
    yyparse();
    return 0;
}
