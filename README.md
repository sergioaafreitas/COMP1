# COMP1 - FGA0003

Disciplina de Compiladores 1 do curso de Engenharia de Software da UnB.

Este repositório contém exemplos de código (Flex e Bison), guias de estudo, tutoriais sobre compiladores e interpretadores, além de materiais de referência (glossários e instruções para configurar o ambiente de desenvolvimento). O conteúdo está organizado em pastas por semana, cada uma contendo:

- Uma pasta **docs**, com guias e materiais de leitura.  
- Uma pasta **src**, com exemplos de código `.l` (Flex), `.y` (Bison) e demais arquivos necessários para o aprendizado e práticas de laboratório.

## Estrutura do repositório

```
COMP1
├── semana 01
│   ├── docs
│   │   ├── Glossário de termos.md
│   │   ├── Guia - Configuração do ambiente de desenvolvimento.md
│   │   ├── Guia - Projeto de um compilador.md
│   │   └── Guia - Projeto de um interpretador.md
│   └── src
│       ├── hello.l
│       ├── hello.README.md
│       └── hello.y
├── semana 02
│   ├── docs
│   │   └── Guia - Expressões regulares no flex.md
│   └── src
│       ├── entrada.txt
│       ├── exemplo.l
│       ├── exemplo.README.md
│       ├── exemplo.y
│       └── Makefile
├── LICENSE
└── README.md
```

### Descrição das pastas

- **semana 01**  
  - **docs**:  
    - *Glossário de termos.md*: definições importantes de compiladores e ferramentas.  
    - *Guia - Configuração do ambiente de desenvolvimento.md*: instruções para instalar Flex, Bison e compiladores C/C++.  
    - *Guia - Projeto de um compilador.md* e *Guia - Projeto de um interpretador.md*: conceitos sobre fases de análise léxica, análise sintática, geração de código etc.  
  - **src**:  
    - *hello.l* / *hello.y*: exemplo mínimo de analisador léxico e parser que reconhece e imprime “Hello, World!” (usando Flex e Bison).  
    - *hello.README.md*: instruções específicas para compilar e executar o exemplo “hello”.

- **semana 02**  
  - **docs**:  
    - *Guia - Expressões regulares no flex.md*: explicando em mais detalhes o uso de ERs para reconhecer tokens.  
  - **src**:  
    - *exemplo.l / exemplo.y*: exemplo de analisador que reconhece números inteiros (positivos ou negativos) de até 10 dígitos, ilustrando boas práticas de código em Flex e Bison.  
    - *entrada.txt*: arquivo de teste para o exemplo acima.  
    - *Makefile*: automação da compilação (gera o executável, limpa arquivos temporários etc.).  
    - *exemplo.README.md*: explica em detalhes como compilar e executar o exemplo.  

- **Futuras semanas**  
  - Serão adicionadas ao repositório à medida que a disciplina avançar e novos exemplos, guias e exercícios forem produzidos.

- **LICENSE**  
  - Arquivo com a licença **MIT** para o projeto.

- **README.md**  
  - Este arquivo, com instruções gerais sobre o repositório.

---

## Como usar

1. **Clonar o repositório**  
   ```bash
   git clone https://github.com/sergioaafreitas/COMP1.git
   cd COMP1
   ```

2. **Instalar dependências**  
   - É necessário ter **Flex** e **Bison** instalados no sistema.  
   - Em distribuições Linux baseadas em Debian/Ubuntu, por exemplo:  
     ```bash
     sudo apt-get update
     sudo apt-get install flex bison
     ```  
   - Em outras plataformas, consulte a documentação para instalar Flex/Bison.

3. **Explorar os exemplos**  
   - **Semana 01**:  
     - Acesse a pasta `semana 01/src`.  
     - Revise os guias em `semana 01/docs` caso queira mais detalhes de instalação ou de conceito.  
     - Para compilar manualmente o exemplo “hello”:  
       ```bash
       bison -d hello.y
       flex hello.l
       gcc -o hello hello.tab.c lex.yy.c -lfl
       ./hello
       ```  
   - **Semana 02**:  
     - Confira `semana 02/src`, onde há um `Makefile` e arquivos *exemplo.l*, *exemplo.y*. Para compilar:  
       ```bash
       make
       ./parser entrada.txt
       ```  
       ou digitar valores no terminal após `./parser`.  
     - O arquivo `semana 02/docs/Guia - Expressões regulares no flex.md` traz mais detalhes sobre ERs.

4. **Consultar guias e glossários**  
   - Em cada pasta `docs`, há materiais de referência, guias e tutoriais. Consulte-os antes de iniciar as práticas para ter uma visão mais clara dos conceitos e da configuração do ambiente.  
   - Novos guias e exemplos aparecerão nas próximas semanas, conforme a disciplina avançar.

---

## Contribuindo

Caso deseje contribuir com exemplos adicionais, correções ou melhorias:
1. Faça um *fork* do repositório.
2. Crie uma *branch* para suas alterações:  
   ```bash
   git checkout -b minha-feature
   ```
3. Faça *commit* das modificações e envie um *pull request*.

---

## Licença

Este projeto está licenciado sob os termos da [Licença MIT](LICENSE).  

---

## Contato

- **Professor**: *Sergio A. A. Freitas*  
- **E-mail**: *sergiofreitas@unb.br*  
- [Universidade de Brasília (UnB)](https://www.unb.br/) – [FCTE](https://fcte.unb.br/) – [CEDIS](https://cedis.unb.br/)

Em caso de dúvidas, sugestões ou problemas, abra uma *issue* ou envie um e-mail diretamente.

---

**Bom estudo e boas práticas no desenvolvimento de compiladores!**