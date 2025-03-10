%{
#include "exemplo.tab.h"  /* Inclusão do cabeçalho gerado pelo Bison, que contém as definições de tokens */
%}

/* Definições de padrões de token e ações */
%%

[ \t\n]+              { /* Não faz nada, apenas ignora */ }

[+\-]?[0-9]{1,10}     {
                        /* Converter o lexema para inteiro (pode estourar se for maior que INT, 
                           mas servirá como exemplo didático) */
                        yylval.intValue = atoi(yytext);
                        return NUM;
                      }


%%

/* Função auxiliar do Flex (quando termina o arquivo de entrada) */
int yywrap(void) {
    return 1;
}

/* Função principal: chamará o parser ao ser executado */
int main(int argc, char **argv) {
    /* Se houver arquivo de entrada como parâmetro, redireciona o yyin */
    if (argc > 1) {
        FILE *f = fopen(argv[1], "r");
        if (f) {
            yyin = f;
        }
    }
    return yyparse();
}
