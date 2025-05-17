#include <stdlib.h>
#include "ast.h"

Node *createLeaf(int value) {
    Node *n = malloc(sizeof(Node));
    n->value = value;
    n->left = n->right = NULL;
    return n;
}

Node *createNode(char op, Node *l, Node *r) {
    Node *n = malloc(sizeof(Node));
    n->op = op;
    n->left = l;
    n->right = r;
    return n;
}
