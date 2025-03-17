# Nome do executável final
EXEC = parser

# Arquivos-fonte do Bison e do Flex
BISON_FILE = parser.y
FLEX_FILE  = scanner.l

# Arquivos que o Bison vai gerar
BISON_C   = parser.tab.c
BISON_H   = parser.tab.h

# Arquivo gerado pelo Flex
FLEX_C    = lex.yy.c

# Parâmetros opcionais ao Bison e Flex
BISON_FLAGS = -d   # -d gera o arquivo .h (token definitions)
FLEX_FLAGS  =      # deixe vazio ou acrescente opções, se necessário

# Parâmetros de compilação
CC      = gcc
CFLAGS  =
LDFLAGS = -lfl     # biblioteca do Flex (em algumas distros, pode ser -ll)

# Regra padrão (alvo 'all' vai gerar o executável)
all: $(EXEC)

# Regra para gerar o executável: depende dos arquivos gerados por Bison e Flex
$(EXEC): $(BISON_C) $(FLEX_C)
	$(CC) $(CFLAGS) -o $@ $(BISON_C) $(FLEX_C) $(LDFLAGS)

# Regra para rodar o Bison: gera parser.tab.c e parser.tab.h
$(BISON_C) $(BISON_H): $(BISON_FILE)
	bison $(BISON_FLAGS) $(BISON_FILE)

# Regra para rodar o Flex: gera lex.yy.c
$(FLEX_C): $(FLEX_FILE)
	flex $(FLEX_FLAGS) $(FLEX_FILE)

# Regra de limpeza: remove arquivos gerados
clean:
	rm -f $(EXEC) $(BISON_C) $(BISON_H) $(FLEX_C)
