# Protótipo de Geração de Código Intermediário (TAC)

**Disciplina:** FGA0003 – Compiladores 1  
**Professor:** Dr. Sergio Antônio Andrade de Freitas

## Objetivo
Implementar a geração de Código de Três Endereços (TAC) a partir de uma AST construída manualmente.

## Compilação
```bash
make
```

## Execução
```bash
./main
```

## Saída esperada
```text
Código TAC gerado:
t0 = b * c
t1 = a + t0
t2 = x = t1
```

## Extensões sugeridas
- Suporte a múltiplas expressões.
- Geração de código para funções e controle de fluxo.

## Testes Automatizados

A pasta `tests/` contém exemplos de entradas com expressões aritméticas e atribuições.  
O script `run_tests.sh` executa cada uma delas e imprime o TAC correspondente.

### Como rodar os testes
```bash
./run_tests.sh
```

