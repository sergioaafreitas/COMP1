%code requires {
#include "src/ast.h"
}
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);
%}

%union {
    int ival;
    char *sval;
    struct Node *node;
}

%token <ival> NUM
%token <sval> ID
%token INT

%type <node> expr stmt

%left '+'

%%

program:
    stmt
    ;

stmt:
    INT ID '=' expr ';' {
        printf("LOAD_CONST %d\n", $4->left->value);
        printf("LOAD_CONST %d\n", $4->right->value);
        printf("ADD\n");
        printf("STORE %s\n", $2);
    }
    ;

expr:
    NUM '+' NUM {
        $$ = createNode('+', createLeaf($1), createLeaf($3));
    }
    ;

%%

int main() {
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}
