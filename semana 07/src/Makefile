all: parser

parser: parser.tab.c lex.yy.c ast.o tabela.o
	gcc -o parser parser.tab.c lex.yy.c ast.o tabela.o -lfl

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

ast.o: ast.c ast.h
	gcc -c ast.c

tabela.o: tabela.c tabela.h
	gcc -c tabela.c

clean:
	rm -f *.o *.tab.c *.tab.h lex.yy.c parser