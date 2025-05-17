#include "ast.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

Node* makeNumNode(int value) {
    Node* n = malloc(sizeof(Node));
    n->type = NODE_NUM;
    n->value = value;
    n->name = NULL;
    n->left = n->right = NULL;
    return n;
}

Node* makeVarNode(char* name) {
    Node* n = malloc(sizeof(Node));
    n->type = NODE_VAR;
    n->name = strdup(name);
    n->left = n->right = NULL;
    return n;
}

Node* makeOpNode(char op, Node* left, Node* right) {
    Node* n = malloc(sizeof(Node));
    n->type = NODE_OP;
    n->op = op;
    n->left = left;
    n->right = right;
    return n;
}

void printNode(Node* node) {
    if (!node) return;
    switch (node->type) {
        case NODE_NUM:
            printf("%d", node->value);
            break;
        case NODE_VAR:
            printf("%s", node->name);
            break;
        case NODE_OP:
            printf("(");
            printNode(node->left);
            printf(" %c ", node->op);
            printNode(node->right);
            printf(")");
            break;
    }
}

void freeNode(Node* node) {
    if (!node) return;
    freeNode(node->left);
    freeNode(node->right);
    if (node->type == NODE_VAR) free(node->name);
    free(node);
}
