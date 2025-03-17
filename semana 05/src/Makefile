EXEC = parser
BISON_FILE = parser.y
FLEX_FILE  = scanner.l
BISON_C = parser.tab.c
BISON_H = parser.tab.h
FLEX_C  = lex.yy.c

all: $(EXEC)

$(EXEC): $(BISON_C) $(FLEX_C)
	gcc -o $@ $(BISON_C) $(FLEX_C) -lfl

$(BISON_C) $(BISON_H): $(BISON_FILE)
	bison -d $(BISON_FILE)

$(FLEX_C): $(FLEX_FILE)
	flex $(FLEX_FILE)

clean:
	rm -f $(EXEC) $(BISON_C) $(BISON_H) $(FLEX_C)
