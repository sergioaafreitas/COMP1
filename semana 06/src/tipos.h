#ifndef TIPOS_H
#define TIPOS_H

typedef struct noAST {
    char operador;
    int valor;
    char nome[32];
    struct noAST *esquerda;
    struct noAST *direita;
} NoAST;

#endif
