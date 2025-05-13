#ifndef AST_H
#define AST_H

typedef enum { TIPO_INT, TIPO_FLOAT } Tipo;

typedef struct noAST {
    char operador;
    int valor;
    char nome[32];
    Tipo tipo;
    struct noAST *esquerda;
    struct noAST *direita;
} NoAST;

NoAST *criarNoNum(int val);
NoAST *criarNoId(char *nome, Tipo tipo);
NoAST *criarNoOp(char op, NoAST *esq, NoAST *dir);
void imprimirAST(NoAST *no);
char* gerarTAC(NoAST *no);

#endif