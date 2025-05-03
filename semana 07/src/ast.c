#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"

NoAST *criarNoOp(char op, NoAST *esq, NoAST *dir) {
    NoAST *no = malloc(sizeof(NoAST));
    no->operador = op;
    no->esquerda = esq;
    no->direita = dir;
    no->tipo = (esq->tipo == dir->tipo) ? esq->tipo : TIPO_ERRO;
    return no;
}

NoAST *criarNoNum(int val) {
    NoAST *no = malloc(sizeof(NoAST));
    no->valor = val;
    no->operador = 0;
    no->tipo = TIPO_INT;
    no->esquerda = no->direita = NULL;
    return no;
}

NoAST *criarNoId(char *nome, Tipo tipo) {
    NoAST *no = malloc(sizeof(NoAST));
    strcpy(no->nome, nome);
    no->operador = 0;
    no->tipo = tipo;
    no->esquerda = no->direita = NULL;
    return no;
}

void imprimirAST(NoAST *no) {
    if (!no) return;
    if (no->operador) {
        printf("(");
        imprimirAST(no->esquerda);
        printf(" %c ", no->operador);
        imprimirAST(no->direita);
        printf(")");
    } else if (strlen(no->nome) > 0) {
        printf("%s", no->nome);
    } else {
        printf("%d", no->valor);
    }
}

int tiposCompativeis(Tipo t1, Tipo t2) {
    return t1 == t2;
}