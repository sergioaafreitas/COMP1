#include "ast.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

NoAST *criarNoNum(int valor) {
    NoAST *novo = malloc(sizeof(NoAST));
    novo->operador = ' ';
    novo->valor = valor;
    novo->esquerda = novo->direita = NULL;
    return novo;
}

NoAST *criarNoId(char *nome) {
    NoAST *novo = malloc(sizeof(NoAST));
    novo->operador = 'i';
    strcpy(novo->nome, nome);
    novo->esquerda = novo->direita = NULL;
    return novo;
}

NoAST *criarNoOp(char operador, NoAST *esq, NoAST *dir) {
    NoAST *novo = malloc(sizeof(NoAST));
    novo->operador = operador;
    novo->esquerda = esq;
    novo->direita = dir;
    return novo;
}

void imprimirAST(NoAST *raiz) {
    if (raiz) {
        if (raiz->operador == ' ')
            printf("%d", raiz->valor);
        else if (raiz->operador == 'i')
            printf("%s", raiz->nome);
        else {
            printf("(");
            imprimirAST(raiz->esquerda);
            printf(" %c ", raiz->operador);
            imprimirAST(raiz->direita);
            printf(")");
        }
    }
}
