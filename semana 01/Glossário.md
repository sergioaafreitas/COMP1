### Termos gerais em compiladores

1. **Compilador**
   - Programa que traduz código-fonte em uma linguagem de alto nível para código de máquina ou linguagem intermediária.

2. **Interpretador**
   - Executa diretamente as instruções escritas em uma linguagem de programação, sem gerar código intermediário ou executável.

3. **Linguagem-fonte**
   - Linguagem em que o programador escreve seu código (ex.: C, Java, Python).

4. **Linguagem-alvo**
   - Linguagem resultante após o processo de compilação, geralmente código de máquina ou uma linguagem intermediária.

5. **Linguagem intermediária**
   - Representação interna do código-fonte, gerada durante o processo de compilação, que facilita otimizações e traduções posteriores.

6. **Analisador léxico (scanner)**
   - Primeira fase do compilador, que transforma o código-fonte em uma sequência de tokens.

7. **Analisador sintático (parser)**
   - Fase que verifica se a sequência de tokens segue as regras gramaticais da linguagem, produzindo uma árvore sintática.

8. **Analisador semântico**
   - Verifica se a estrutura sintática tem significado válido na linguagem de programação, incluindo tipos e escopo das variáveis.

9. **Gerador de código intermediário**
   - Produz uma representação intermediária da estrutura sintática validada, simplificando a geração de código final.

10. **Otimizador**
    - Melhora a eficiência do código intermediário ou final, reduzindo tempo de execução ou consumo de memória.

11. **Gerador de código final**
    - Transforma a representação intermediária otimizada em código executável específico para uma arquitetura computacional.

12. **Tabela de símbolos**
    - Estrutura de dados que armazena informações sobre identificadores usados no programa, como nomes, tipos e escopos.

13. **Token**
    - Unidade básica da análise léxica, representando palavras-chave, identificadores, operadores, constantes e símbolos.

14. **Gramática**
    - Conjunto de regras que definem a estrutura válida de sentenças em uma linguagem.

15. **Árvore sintática**
    - Estrutura hierárquica resultante da análise sintática, que representa as construções gramaticais do código-fonte.

16. **Back-end**
    - Parte do compilador que realiza otimização e gera o código-alvo.

17. **Front-end**
    - Parte do compilador que realiza análise léxica, sintática e semântica, produzindo uma representação intermediária.

18. **Ambiguidade**
    - Situação em que uma mesma sentença pode ser interpretada de múltiplas formas pela gramática.

19. **Erro sintático**
    - Violação das regras gramaticais identificada pelo parser.

20. **Erro semântico**
    - Erro relacionado ao significado das construções sintáticas válidas, como incompatibilidade de tipos.

---

### Termos específicos para ferramentas Flex e Bison

#### Flex (analisador léxico)

21. **Lexema**
    - Sequência específica de caracteres que forma um token reconhecido pelo analisador léxico.

22. **Expressão regular**
    - Padrão usado para descrever tokens na definição de regras léxicas.

23. **Padrão (pattern)**
    - Descrição formal em expressões regulares para reconhecimento de tokens.

24. **Ação (action)**
    - Código executado ao reconhecer um padrão definido na expressão regular.

25. **Arquivo `.l`**
    - Arquivo de entrada usado pelo Flex contendo especificações léxicas em expressões regulares e ações.

26. **Estado inicial (INITIAL state)**
    - Estado padrão em que o analisador léxico inicia seu processamento.

27. **yytext**
    - Variável global que armazena o lexema correspondente ao padrão reconhecido pelo Flex.

28. **yyleng**
    - Variável que indica o comprimento do lexema armazenado em `yytext`.

29. **yylex()**
    - Função gerada pelo Flex responsável pela análise léxica, retornando tokens ao parser.

30. **Tokenização**
    - Processo de dividir o fluxo de entrada em tokens válidos.

---

#### Bison (analisador sintático)

31. **Regra gramatical**
    - Descrição formal que define como sentenças são formadas a partir de símbolos terminais e não terminais.

32. **Símbolo terminal**
    - Símbolo básico da gramática, equivalente a um token reconhecido pelo analisador léxico.

33. **Símbolo não terminal**
    - Símbolo abstrato utilizado para definir regras gramaticais, representando construções complexas da linguagem.

34. **Produção**
    - Regra específica na gramática do Bison, composta por um símbolo não terminal seguido de símbolos terminais e/ou não terminais.

35. **Arquivo `.y`**
    - Arquivo de entrada usado pelo Bison contendo especificações gramaticais e ações associadas.

36. **yyparse()**
    - Função gerada pelo Bison que realiza a análise sintática com base na gramática definida.

37. **Conflito shift/reduce**
    - Situação onde o parser não sabe se deve deslocar um novo símbolo ou reduzir pela regra existente, indicando ambiguidade.

38. **Conflito reduce/reduce**
    - Situação onde existem múltiplas regras válidas para reduzir a mesma sequência de tokens, indicando ambiguidade na gramática.

39. **Associatividade**
    - Especifica a ordem de avaliação de operadores em situações de precedência igual (esquerda, direita ou nenhuma).

40. **Precedência**
    - Indica a ordem relativa de operadores, determinando quais operações são executadas primeiro.

41. **Ação semântica**
    - Código associado às produções gramaticais executado durante a análise sintática para construção de árvores, avaliações ou geração intermediária.

42. **$$, $1, $2, etc.**
    - Variáveis especiais usadas nas ações semânticas no Bison: `$$` representa o valor da produção atual, enquanto `$1`, `$2`, etc., representam os valores dos símbolos da regra.
