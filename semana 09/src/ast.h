#ifndef AST_H
#define AST_H

typedef enum { NODE_NUM, NODE_VAR, NODE_OP } NodeType;

typedef struct Node {
    NodeType type;
    int value;
    char* name;
    char op;
    struct Node* left;
    struct Node* right;
} Node;

Node* makeNumNode(int value);
Node* makeVarNode(char* name);
Node* makeOpNode(char op, Node* left, Node* right);
void printNode(Node* node);
Node* optimize(Node* node);
void freeNode(Node* node);

#endif
