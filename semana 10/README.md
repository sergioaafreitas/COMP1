# Exemplo de Geração de Código (Bitcode simples)

**Disciplina:** FGA0003 – Compiladores 1  
**Professor:** Dr. Sergio Antônio Andrade de Freitas  
**Objetivo:** Demonstrar geração de bitcode a partir de código-fonte Java simples utilizando Flex e Bison.

## Estrutura
- `src/` – arquivos de código fonte (Flex, Bison, AST).
- `tests/` – arquivos `.java` de entrada de teste.
- `Makefile` – automatiza compilação, testes e limpeza.

## Uso

### Compilar
```bash
make
```

### Executar testes
```bash
make test
```

### Limpar arquivos gerados
```bash
make clean
```

## Exemplo de entrada
Arquivo: `tests/hello.java`
```java
int x = 3 + 4;
```

## Exemplo de saída
```
LOAD_CONST 3
LOAD_CONST 4
ADD
STORE x
```

## Observação
Este projeto é simplificado e usa Flex+Bison para gerar uma representação intermediária (bitcode textual).