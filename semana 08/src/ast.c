#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"

static int temp_id = 0;

NoAST *criarNoNum(int val) {
    NoAST *no = malloc(sizeof(NoAST));
    no->valor = val;
    no->nome[0] = '\0';
    no->operador = 0;
    no->esquerda = no->direita = NULL;
    no->tipo = TIPO_INT;
    return no;
}

NoAST *criarNoId(char *nome, Tipo tipo) {
    NoAST *no = malloc(sizeof(NoAST));
    strcpy(no->nome, nome);
    no->operador = 0;
    no->valor = 0;
    no->esquerda = no->direita = NULL;
    no->tipo = tipo;
    return no;
}

NoAST *criarNoOp(char op, NoAST *esq, NoAST *dir) {
    NoAST *no = malloc(sizeof(NoAST));
    no->operador = op;
    no->esquerda = esq;
    no->direita = dir;
    no->valor = 0;
    no->nome[0] = '\0';
    no->tipo = TIPO_INT;
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

char* novaTemp() {
    static char nome[10];
    sprintf(nome, "t%d", temp_id++);
    return strdup(nome);
}

char* gerarTAC(NoAST *no) {
    if (!no) return NULL;

    if (!no->operador) {
        if (strlen(no->nome) > 0) return strdup(no->nome);
        char *tmp = malloc(10);
        sprintf(tmp, "%d", no->valor);
        return tmp;
    }

    char *esq = gerarTAC(no->esquerda);
    char *dir = gerarTAC(no->direita);
    char *tmp = novaTemp();
    printf("%s = %s %c %s\n", tmp, esq, no->operador, dir);
    free(esq);
    free(dir);
    return tmp;
}