# FGA0003 – Compiladores 1  
**Aula prática 5:** continuação do parser + tratamento de erros sintáticos

Este projeto exemplifica como, em Flex e Bison, podemos prosseguir no desenvolvimento do parser iniciado em aulas anteriores, incluindo estratégias de **recuperação de erros** sintáticos e **declarações de precedência** para eliminar conflitos. Faz parte do cronograma do plano de ensino e do backlog de sprints sugerido no projeto de um compilador.

---

## Estrutura do repositório

```
.
├── Makefile      (arquivo para compilar automaticamente)
├── parser.y      (arquivo Bison: regras gramaticais + ações semânticas)
├── scanner.l     (arquivo Flex: regras léxicas para tokens)
├── README.md     (este documento)
└── (arquivos gerados após compilação, ex.: parser.tab.c, parser.tab.h, lex.yy.c)
```

### Destaques dos arquivos

1. **parser.y**  
   - Define uma gramática que reconhece expressões aritméticas (com +, -, *, /, parênteses e números) e exige que cada expressão termine em `;`.  
   - Inclui declarações de precedência (%left para +, -, * e /) para **evitar shift/reduce conflicts**.  
   - Exibe mensagens de erro específicas e demonstra uma forma simples de recuperar-se de erros sintáticos usando `error` e descartando tokens até encontrar `;`.  

2. **scanner.l**  
   - Usa expressões regulares para reconhecer números, operadores, parênteses e ponto e vírgula.  
   - Ignora espaços e quebras de linha.  
   - Emite uma mensagem se encontrar caracteres desconhecidos.  

3. **Makefile**  
   - Oferece alvos para compilar (`make`) e limpar (`make clean`) os artefatos gerados.  
   - Executa `bison -d parser.y`, `flex scanner.l` e por fim compila tudo em um binário **parser**.

---

## Passos para compilação

1. **Verificar** se *Bison* e *Flex* estão instalados. Em ambientes baseados em Debian/Ubuntu, por exemplo:
   ```bash
   sudo apt-get update
   sudo apt-get install flex bison
   ```
2. **Compilar** com:
   ```bash
   make
   ```
   Isso roda o Bison, o Flex e o compilador C, gerando o executável **parser**.

---

## Como executar

Após `make`, rode:
```bash
./parser
```
1. Digite a expressão, **seguida de `;`**, por exemplo:
   ```
   3+4*2;
   ```
2. Em seguida, **Envie EOF** (Ctrl+D) se estiver no Linux/macOS, ou Ctrl+Z (Windows).  

### Exemplo de execução

```bash
$ ./parser
Digite expressoes, terminadas com ';'. Pressione Ctrl+D para encerrar.
3+4*2;
Resultado: 11
(3+5)*2;
Resultado: 16
3++2;
[ERRO SINTATICO] Erro recuperado ate ';'
^D
$
```

- No caso de `3++2;`, o parser detecta erro e descarta tudo até encontrar `;`, exibindo `[ERRO SINTATICO] ...`.

---

## Tratamento de erros sintáticos

- No arquivo **parser.y**, há uma regra que reconhece `error SEMI`, imprimindo uma mensagem e chamando `yyerrok;` e `yyclearin;`.  
- Isso permite que o parser continue analisando expressões subsequentes, em vez de abortar toda a análise após o primeiro erro.

---

## Limpando artefatos

Para remover arquivos intermediários (por exemplo, `parser.tab.c`, `parser.tab.h`, `lex.yy.c`) e o binário **parser**:
```bash
make clean
```

---

## Possíveis problemas e dicas

1. **Shift/Reduce conflicts**: normalmente eliminados pelo uso de  
   ```yacc
   %left PLUS MINUS
   %left TIMES DIVIDE
   ```
   no arquivo `.y`. Caso persistam avisos de conflito, verifique se há ambiguidades adicionais na gramática.  
2. **Caracteres “curvos”**: use aspas retas `" "` para evitar erros de “missing '"' at end of line”.  
3. **EOF**: se o parser não encerrar ao digitar a expressão, lembre-se de apertar **Ctrl+D** (Linux/macOS) ou **Ctrl+Z** (Windows) para enviar EOF.  
4. **Retorno de valor**: o exemplo imprime `Resultado: <valor>` ao reduzir `expr`, mas você pode modificar para armazenar resultados num contexto maior ou para construir uma AST.

---

## Adaptação ao projeto

- **Inserir** tokens e regras para as construções específicas da linguagem alvo do seu compilador (declarações, comandos de controle de fluxo, etc.).  
- **Estender** a lógica de tratamento de erros para lidar com diferentes contextos (ex.: se faltar `}`, tentar recuperar até a próxima linha ou token especial).  
- **Manter** a compatibilidade com as *sprints* planejadas no projeto. Por exemplo, dedicar parte do *backlog* a robustez do parser e mensagens de erro mais claras.

---

## Conclusão

Este **exemplo** ilustra uma prática fundamental no desenvolvimento de compiladores: **lida com precedência de operadores** para expressões aritméticas e mostra um **mecanismo simples de tratamento de erros** que não encerra a análise no primeiro erro. Cada equipe pode usar esse modelo como base, adaptando-o às necessidades de sua linguagem e integrando-o com outras partes do compilador (análise semântica, AST, geração de código etc.).

**Bom desenvolvimento e até a próxima aula prática!**
```