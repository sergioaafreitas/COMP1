CC = gcc
FLEX = flex
BISON = bison
CFLAGS = -Wall -Wno-unused-function -Isrc
LDFLAGS = -lfl
SRC = src/ast.c
LEX = src/lexer.l
YACC = src/parser.y
TARGET = optimize
TESTS = $(wildcard tests/*.in)

all: $(TARGET)

parser.tab.c parser.tab.h: $(YACC)
	$(BISON) -d $(YACC) -o parser.tab.c

lex.yy.c: $(LEX) parser.tab.h
	$(FLEX) $(LEX)

$(TARGET): parser.tab.c lex.yy.c $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) parser.tab.c lex.yy.c $(SRC) $(LDFLAGS)

test: all
	@echo "Executando testes"
	@for f in $(TESTS); do \
	    echo "=== Teste $$f ==="; \
	    printf "Entrada: "; cat $$f; \
	    printf "Saída: "; ./$(TARGET) < $$f; \
	    echo; \
	done

clean:
	rm -f parser.tab.c parser.tab.h lex.yy.c $(TARGET)

.PHONY: all test clean
