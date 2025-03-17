#include "tabela.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

Simbolo *tabela = NULL;

void inserirSimbolo(char *nome, char *tipo) {
    // Verifica se o símbolo já foi inserido
    Simbolo *s = tabela;
    while (s) {
        if (strcmp(s->nome, nome) == 0)
            return;
        s = s->prox;
    }
    Simbolo *novo = malloc(sizeof(Simbolo));
    strcpy(novo->nome, nome);
    strcpy(novo->tipo, tipo);
    novo->prox = NULL;
    if (tabela == NULL) {
        tabela = novo;
    } else {
        Simbolo *last = tabela;
        while (last->prox)
            last = last->prox;
        last->prox = novo;
    }
}

Simbolo *buscarSimbolo(char *nome) {
    for (Simbolo *s = tabela; s; s = s->prox)
        if (strcmp(s->nome, nome) == 0)
            return s;
    return NULL;
}

void imprimirTabela() {
    printf("\nTabela de Símbolos:\n");
    for (Simbolo *s = tabela; s; s = s->prox)
        printf("Nome: %s, Tipo: %s\n", s->nome, s->tipo);
}
