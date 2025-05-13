#include <stdio.h>
#include "ast.h"

int main() {
    // Exemplo: x = a + b * c

    NoAST *a = criarNoId("a", TIPO_INT);
    NoAST *b = criarNoId("b", TIPO_INT);
    NoAST *c = criarNoId("c", TIPO_INT);

    NoAST *mult = criarNoOp('*', b, c);
    NoAST *soma = criarNoOp('+', a, mult);
    NoAST *atrib = criarNoOp('=', criarNoId("x", TIPO_INT), soma);

    printf("Código TAC gerado:\n");
    gerarTAC(atrib);
    return 0;
}