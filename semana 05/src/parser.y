/******************************************************
FGA0003 - Compiladores 1
Curso de Engenharia de Software
Universidade de Brasília (UnB)

Arquivo: parser.y
Descrição: Aula prática n. 5: continuação do parser + tratamento de erros
Exemplo de parser
******************************************************/

%{
#include <stdio.h>
#include <stdlib.h>

/* Prototipos para evitar avisos de funcao implicita */
int yylex(void);
void yyerror(const char *s);
%}

/* UNION para valores semanticos */
%union {
    int intValue;
}

/* Declaracao de tokens e seus tipos */
%token <intValue> NUM
%token PLUS MINUS TIMES DIVIDE LPAREN RPAREN SEMI
%type <intValue> expr

/* Regras de precedencia e associatividade */
%left PLUS MINUS
%left TIMES DIVIDE

/* Simbolo inicial */
%start input

%%

/* Regras da gramatica */
input:
      /* vazio */
    | input expr SEMI      { printf("Resultado: %d\n", $2); }
    | input error SEMI     { 
          fprintf(stderr, "[ERRO SINTATICO] Erro recuperado ate ';'\n");
          yyerrok; /* reset de erro */
          yyclearin; /* limpamos o token de lookahead */
      }
    ;

expr:
      expr PLUS expr       { $$ = $1 + $3; }
    | expr MINUS expr      { $$ = $1 - $3; }
    | expr TIMES expr      { $$ = $1 * $3; }
    | expr DIVIDE expr     { 
          if ($3 == 0) {
             fprintf(stderr, "[ERRO SEMANTICO] Divisao por zero!\n");
             $$ = 0; 
          } else {
             $$ = $1 / $3;
          }
        }
    | LPAREN expr RPAREN   { $$ = $2; }
    | NUM                  { $$ = $1; }
    ;

%%

int main(void) {
    /* Poderiamos exibir instrucoes, se quiser */
    printf("Digite expressoes, terminadas com ';'. Pressione Ctrl+D para encerrar.\n");
    return yyparse();
}

void yyerror(const char *s) {
    /* Mensagem de erro padrao de Bison */
    fprintf(stderr, "Erro sintatico: %s\n", s);
}
