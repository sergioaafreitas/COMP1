#ifndef AST_H
#define AST_H

typedef struct Node {
    char op;
    int value;
    struct Node *left, *right;
} Node;

Node *createLeaf(int value);
Node *createNode(char op, Node *l, Node *r);

#endif
