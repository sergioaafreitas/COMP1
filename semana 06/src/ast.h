//*********************************************************
// FGA0003 - Compiladores 1
// Curso de Engenharia de Software
// Universidade de Brasília (UnB)
// Exemplo Completo: AST, Tabela de Símbolos, Flex e Bison
//*********************************************************

#ifndef AST_H
#define AST_H

#include "tipos.h"

NoAST *criarNoNum(int valor);
NoAST *criarNoId(char *nome);
NoAST *criarNoOp(char operador, NoAST *esq, NoAST *dir);
void imprimirAST(NoAST *raiz);

#endif
