# COMP1 - FGA0003

Disciplina de Compiladores 1 do curso de Engenharia de Software da UnB.

Este repositório contém exemplos de código (Flex e Bison), guias de estudo, tutoriais sobre compiladores e interpretadores, além de materiais de referência (glossários e instruções para configurar o ambiente de desenvolvimento). O conteúdo está organizado em pastas por semana, com arquivos `.l` (Flex), `.y` (Bison) e demais recursos necessários para o aprendizado e práticas de laboratório.

## Estrutura do repositório

```
COMP1
├── semana 01
│   ├── Glossário de termos.md
│   ├── Guia - Configuração do ambiente de desenvolvimento.md
│   ├── Guia - Projeto de um compilador.md
│   ├── Guia - Projeto de um interpretador.md
│   ├── hello.l
│   ├── hello.README.md
│   └── hello.y
├── semana 02
│   ├── entrada.txt
│   ├── exemplo.l
│   ├── exemplo.README.md
│   ├── exemplo.y
│   ├── Guia - Expressões regulares no flex.md
│   └── Makefile
├── (... outras semanas serão adicionadas futuramente ...)
├── LICENSE
└── README.md
```

### Descrição das pastas

- **semana 01**  
  - Contém materiais introdutórios, incluindo glossário de termos, guias de configuração do ambiente de desenvolvimento, primeiros passos para criar compiladores/interpretadores e um exemplo simples (**hello.l** e **hello.y**) usando Flex e Bison.  
  - *hello.l / hello.y*: Exemplo mínimo de analisador léxico e parser que reconhece e imprime “Hello, World!”.  
  - *hello.README.md*: Instruções específicas de compilação e execução do exemplo “hello”.

- **semana 02**  
  - Inclui exemplos mais avançados, como o *exemplo.l / exemplo.y*, que reconhece números e demonstra como retornar valores semânticos para o parser. Também há um `Makefile` para automatizar a compilação, além de arquivos auxiliares e um guia sobre expressões regulares no Flex.  
  - *exemplo.l / exemplo.y*: Exemplo de analisador que reconhece números inteiros (positivos ou negativos) de até 10 dígitos, ilustrando boas práticas de código em Flex e Bison.  
  - *Makefile*: Automação da compilação (gera o executável, limpa arquivos temporários etc.).  
  - *exemplo.README.md*: Explica em detalhes como compilar e executar o exemplo.

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
   - **Semana 01**: Abra os arquivos *hello.l* e *hello.y*, revise os guias (`.md`). Para compilar manualmente:  
     ```bash
     bison -d hello.y
     flex hello.l
     gcc -o hello hello.tab.c lex.yy.c -lfl
     ./hello
     ```  
   - **Semana 02**: Confira o `Makefile` e os arquivos *exemplo.l*, *exemplo.y*. Para compilar:  
     ```bash
     make
     ./parser entrada.txt
     ```  
     ou digite manualmente valores no terminal após `./parser`.  

4. **Consultar guias e glossários**  
   - Na pasta **semana 01**, você encontra:  
     - *Glossário de termos.md*: definições importantes de compiladores e ferramentas.  
     - *Guia - Configuração do ambiente de desenvolvimento.md*: orientações para instalar Flex, Bison e compiladores C/C++.  
     - *Guia - Projeto de um compilador.md* e *Guia - Projeto de um interpretador.md*: conceitua cada fase (análise léxica, análise sintática, geração de código etc.).  
   - Na pasta **semana 02**, há o *Guia - Expressões regulares no flex.md*, explicando em mais detalhes o uso de ERs para reconhecer tokens.  
   - Novos guias e exemplos aparecerão nas próximas semanas, conforme a disciplina avançar.

---

## Contribuindo

Se você deseja contribuir com exemplos adicionais, correções ou melhorias:
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
- [Universidade de Brasília (UnB)](https://www.unb.br/) – FCTE  

Em caso de dúvidas, sugestões ou problemas, abra uma *issue* ou envie um e-mail diretamente.

---

**Bom estudo e boas práticas no desenvolvimento de compiladores!**