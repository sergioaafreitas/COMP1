#ifndef TABELA_H
#define TABELA_H

#include "ast.h"

typedef struct simbolo {
    char nome[32];
    Tipo tipo;
    struct simbolo *proximo;
} Simbolo;

void inserirSimbolo(char *nome, Tipo tipo);
Simbolo *buscarSimbolo(char *nome);
void imprimirTabela();

#endif