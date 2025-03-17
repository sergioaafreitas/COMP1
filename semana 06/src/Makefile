CC = gcc
LEX = flex
YACC = bison -d

TARGET = parser

all: $(TARGET)

$(TARGET): parser.o lex.yy.o ast.o tabela.o
	$(CC) -o $(TARGET) parser.o lex.yy.o ast.o tabela.o -ll

parser.o: parser.tab.c ast.h tabela.h tipos.h
	$(CC) -c parser.tab.c -o parser.o

lex.yy.o: lex.yy.c
	$(CC) -c lex.yy.c -o lex.yy.o

parser.tab.c parser.tab.h: parser.y
	$(YACC) parser.y

ast.o: ast.c ast.h tipos.h
	$(CC) -c ast.c -o ast.o

tabela.o: tabela.c tabela.h
	$(CC) -c tabela.c -o tabela.o

lex.yy.c: lexer.l
	$(LEX) lexer.l

clean:
	rm -f $(TARGET) *.o lex.yy.c parser.tab.c parser.tab.h
