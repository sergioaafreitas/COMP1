%code requires {
#include "src/ast.h"
}
%{
/* FGA0003 - Compiladores 1
   Curso de Engenharia de Software
   Universidade de Brasília (UnB)
*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "src/ast.h"

Node* root;
int yylex(void);
void yyerror(const char *s);
%}

%union {
    int num;
    char* id;
    Node* node;
}

%token <num> NUM
%token <id> ID
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN

%type <node> expr term factor

%%

input:
    expr { root = $1; }
    ;

expr:
    expr PLUS term   { $$ = makeOpNode('+', $1, $3); }
  | expr MINUS term  { $$ = makeOpNode('-', $1, $3); }
  | term             { $$ = $1; }
  ;

term:
    term TIMES factor { $$ = makeOpNode('*', $1, $3); }
  | term DIVIDE factor{ $$ = makeOpNode('/', $1, $3); }
  | factor            { $$ = $1; }
  ;

factor:
    LPAREN expr RPAREN { $$ = $2; }
  | NUM                { $$ = makeNumNode($1); }
  | ID                 { $$ = makeVarNode($1); }
  ;

%%

Node* optimize(Node* node) {
    if (!node) return NULL;
    node->left = optimize(node->left);
    node->right = optimize(node->right);
    if (node->type == NODE_OP &&
        node->left->type == NODE_NUM &&
        node->right->type == NODE_NUM) {
        int a = node->left->value;
        int b = node->right->value;
        int result;
        switch (node->op) {
            case '+': result = a + b; break;
            case '-': result = a - b; break;
            case '*': result = a * b; break;
            case '/': result = (b != 0 ? a / b : 0); break;
            default: result = 0;
        }
        freeNode(node->left);
        freeNode(node->right);
        node->left = node->right = NULL;  /* evita ponteiros para memória liberada */
        node->type = NODE_NUM;
        node->value = result;
    }
    return node;
}

int main(void) {
    if (yyparse() == 0) {
        optimize(root);
        printNode(root);
        printf("\n");
        freeNode(root);
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Erro: %s\n", s);
}
