#ifndef TABELA_H
#define TABELA_H

typedef struct simbolo {
    char nome[32];
    char tipo[16];
    struct simbolo *prox;
} Simbolo;

void inserirSimbolo(char *nome, char *tipo);
Simbolo *buscarSimbolo(char *nome);
void imprimirTabela();

#endif
