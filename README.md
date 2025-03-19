# COMP1 – FGA0003

Disciplina de *Compiladores 1* do curso de Engenharia de Software da **Universidade de Brasília (UnB)**.

Este repositório contém exemplos de código usando **Flex** e **Bison** (exclusivamente), guias de estudo, tutoriais sobre compiladores e interpretadores, além de materiais de referência (glossários, instruções de configuração e roteiros de projeto). O conteúdo está organizado em pastas por semana, cada uma contendo (quando aplicável):

- Uma pasta **docs**, com guias e materiais de leitura.  
- Uma pasta **src**, com exemplos de código `.l` (Flex), `.y` (Bison) e demais arquivos necessários para as práticas.

---

## Estrutura do repositório

```
.
├── LICENSE
├── README.md
├── listadir.txt
├── semana 01
│   ├── docs
│   │   ├── Glossário de termos.md
│   │   ├── Guia - Configuração do ambiente de desenvolvimento.md
│   │   ├── Guia - Projeto de um compilador.md
│   │   ├── Guia - Projeto de um interpretador.md
│   │   └── Trabalho de Compiladores.md
│   └── src
│       ├── hello.README.md
│       ├── hello.l
│       └── hello.y
├── semana 02
│   ├── docs
│   │   └── Guia - Expressões regulares no flex.md
│   └── src
│       ├── Makefile
│       ├── entrada.txt
│       ├── exemplo.README.md
│       ├── exemplo.l
│       └── exemplo.y
├── semana 03
│   └── src
│       └── scanner.l
├── semana 04
│   └── src
│       ├── Makefile
│       ├── README.md
│       ├── parser.y
│       └── scanner.l
├── semana 05
│   └── src
│       ├── Makefile
│       ├── README.md
│       ├── parser.y
│       └── scanner.l
└── semana 06
    └── src
        ├── Makefile
        ├── README.md
        ├── ast.c
        ├── ast.h
        ├── lexer.l
        ├── parser.y
        ├── tabela.c
        ├── tabela.h
        └── tipos.h
```

### Descrição das pastas

- **semana 01**  
  - **docs**:  
    - *Glossário de termos.md*: definições importantes de compiladores e ferramentas.  
    - *Guia - Configuração do ambiente de desenvolvimento.md*: instruções para instalar Flex, Bison e compiladores C/C++.  
    - *Guia - Projeto de um compilador.md* e *Guia - Projeto de um interpretador.md*: conceitos sobre fases de análise léxica, análise sintática, geração de código etc.  
    - *Trabalho de Compiladores.md*: detalha a proposta geral (uso de PBL, equipes, entregas P1 e P2, entrevista final).  
  - **src**:  
    - *hello.l* / *hello.y*: exemplo mínimo que reconhece e imprime “Hello, World!” (Flex e Bison).  
    - *hello.README.md*: explica como compilar e executar o exemplo “hello”.

- **semana 02**  
  - **docs**:  
    - *Guia - Expressões regulares no flex.md*: apresenta as ERs mais usadas para tokens no Flex.  
  - **src**:  
    - *exemplo.l / exemplo.y*: analisador que reconhece números e operadores simples, demonstrando boas práticas em Flex/Bison.  
    - *entrada.txt*: arquivo de teste.  
    - *Makefile*: automação de compilação (gera o binário `parser`).  
    - *exemplo.README.md*: instruções para compilar e executar o “exemplo”.

- **semana 03**  
  - **src**:  
    - *scanner.l*: projeto inicial do compilador focado em **fase léxica** (tokens principais), conforme aula prática.

- **semana 04**  
  - **src**:  
    - *Makefile*, *parser.y*, *scanner.l*: **implementação inicial do parser**, integrando com o scanner para reconhecer construções básicas.  
    - *README.md*: instruções desta semana, explicando compilação e testes.

- **semana 05**  
  - **src**:  
    - *Makefile*, *parser.y*, *scanner.l*: **continuação do parser** com tratamento de erros sintáticos (descartar tokens até certo símbolo, ex. `;`).  
    - *README.md*: descreve tarefas práticas e possíveis adaptações ao projeto.

- **semana 06**  
  - **src**:  
    - *lexer.l*, *parser.y*: versão mais avançada, incluindo análise semântica, manipulação de AST, tabelas de símbolos, tipos, etc.  
    - *ast.c, ast.h*: estruturas e funções para a árvore sintática abstrata.  
    - *tabela.c, tabela.h, tipos.h*: gerenciamento de símbolos e tipagem.  
    - *Makefile*, *README.md*: automação e documentação final do compilador.

---

## Como usar

1. **Clonar o repositório**
   ```bash
   git clone https://github.com/sergioaafreitas/COMP1.git
   cd COMP1
   ```

2. **Instalar dependências**
   - É necessário ter **Flex** e **Bison** instalados no sistema.  
   - Em distribuições Linux baseadas em Debian/Ubuntu:
     ```bash
     sudo apt-get update
     sudo apt-get install flex bison
     ```
   - Em outras plataformas, consulte a documentação.

3. **Explorar os exemplos**
   - **Semana 01**:
     - Entre em `semana 01/src`.
     - Revise o material em `semana 01/docs`.
     - Para compilar “hello” manualmente:
       ```bash
       bison -d hello.y
       flex hello.l
       gcc -o hello hello.tab.c lex.yy.c -lfl
       ./hello
       ```
   - **Semana 02**:
     - Em `semana 02/src`, rode:
       ```bash
       make
       ./parser entrada.txt
       ```
       ou `./parser` e digite valores manualmente.
     - Consulte o arquivo `semana 02/docs/Guia - Expressões regulares no flex.md`.

4. **Consultar guias e glossários**
   - Cada pasta **docs** possui materiais de referência para instalação, expressões regulares, e roteiros de construção do compilador/interpretador.
   - Novos conteúdos surgirão em semanas posteriores (análise semântica, geração de código etc.).

---

## Contribuindo

1. Faça um *fork* do repositório.
2. Crie uma *branch* para suas alterações:
   ```bash
   git checkout -b minha-feature
   ```
3. Faça *commit* e envie um *pull request*.

---

## Licença

Este projeto está licenciado sob os termos da [Licença MIT](LICENSE).  
Se usar ou distribuir o código, **cite** o repositório original e mantenha os avisos de copyright.

---

## Contato

- **Professor**: *Sergio A. A. Freitas*  
- **E-mail**: *sergiofreitas@unb.br*  
- [Universidade de Brasília (UnB)](https://www.unb.br/) – [FCTE](https://fcte.unb.br/) – [CEDIS](https://cedis.unb.br)

Em caso de dúvidas, sugestões ou problemas, abra uma *issue* ou envie um e-mail diretamente.

---

**Bom estudo e boas práticas no desenvolvimento de compiladores!**