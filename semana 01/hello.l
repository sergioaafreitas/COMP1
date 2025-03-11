%{
#include "hello.tab.h"  /* Importante para reconhecer HELLO e WORLD */
#include <stdio.h>
%}

%%

"Hello"    { return HELLO; }
"World"    { return WORLD; }

[ \t\n]+   { /* ignora espaços e quebras de linha */ }

.          { /* ignora qualquer outro caractere */ }

%%

int yywrap(void) {
    return 1;
}

int main(int argc, char **argv) {
    return yyparse();  /* Chama o parser gerado pelo Bison */
}
