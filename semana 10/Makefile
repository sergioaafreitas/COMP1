CC = gcc
FLEX = flex
BISON = bison
CFLAGS = -Wall -g -Wno-unused-function -Isrc
LDFLAGS = -lfl
TARGET = generate
SRC = src/ast.c
LEX = src/lexer.l
YACC = src/parser.y
TESTS = $(wildcard tests/*.java)

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
		echo "=== $$f ==="; \
		cat $$f; \
		echo "=== bitcode ==="; \
		./$(TARGET) < $$f; \
		echo ""; \
	done

clean:
	rm -f parser.tab.c parser.tab.h lex.yy.c $(TARGET)

.PHONY: all test clean
