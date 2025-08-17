# Guia simplificado: passos para criação de um interpretador

Este guia apresenta etapas para a implementação prática de um interpretador usando as ferramentas Flex e Bison.

## 1. Definir a linguagem interpretada
- Definir claramente sintaxe e semântica da linguagem interpretada.
- Elaborar a gramática formal adequada à interpretação (por exemplo, operações matemáticas simples, variáveis e comandos básicos).

## 2. Implementar a análise léxica com Flex
- Criar regras no Flex para identificar tokens.
- Definir expressões regulares que reconheçam padrões do texto e retornem tokens ao analisador sintático.

## 3. Construir o analisador sintático com Bison
- Escrever a gramática compatível com o formato do Bison.
- Associar tokens a regras gramaticais.
- Definir ações semânticas no Bison para construção de uma árvore sintática abstrata (AST).

## 3.1 Gerar árvore sintática abstrata (AST)
- Modificar ações semânticas do parser para produzir uma AST durante a análise sintática, simplificando o processo de interpretação posterior.

## 4. Implementar análise semântica básica
- Avaliar a coerência semântica diretamente na AST gerada (ex.: verificação de tipos, variáveis declaradas e inicializadas).
- Reportar erros semânticos identificados antes da execução.

## 5. Implementar a interpretação da AST (em substituição à geração de código intermediário)
- Percorrer recursivamente a AST para avaliar expressões e executar comandos diretamente.
- Implementar estruturas básicas, como atribuição de valores a variáveis e operações aritméticas.

## 6. Otimização na interpretação (passo opcional)
- Aplicar técnicas simples, como simplificação de expressões constantes antes da execução da AST, para aumentar eficiência durante a interpretação.

## 7. Execução direta do programa interpretado
- Implementar um loop principal que receba comandos ou scripts, interpretando-os diretamente durante a execução.
- Testar a interpretação com exemplos práticos definidos previamente.


---

## Sugestão de Sprints para a construção de um interpretador na disciplina

### Sprint 1   
- **Objetivos Principais**  
  - Formar as equipes e organizar o ambiente de trabalho (configurar repositórios, ferramentas, Flex, Bison etc.).  
  - Definir a linguagem-fonte do **interpretador** (sintaxe e semântica básica).  
  - Elaborar a primeira versão da gramática formal (livre de contexto) para fins de interpretação.  

- **Principais Entregas**  
  - Documento inicial descrevendo a linguagem (tokens, estruturas, exemplos de código).  
  - Protótipo de gramática reconhecida pelo Bison (ainda não funcional, mas já planejada).  
  - Ambiente configurado e testado (cada membro deve conseguir compilar e rodar um “hello world” com Flex/Bison).  

- **Tarefas e Atividades**  
  1. **Definir o escopo do interpretador**: quais construções essenciais da linguagem serão suportadas (tipos de dados, operadores, estruturas de controle etc.).  
  2. **Configurar repositório** (GitHub ou similar) e adicionar todos os membros (incluindo o professor: “sergioaafreitas” ou “sergiofreitas@unb.br”).  
  3. **Configurar ferramentas**: Flex, Bison, compilador C/C++ (ou outra linguagem) no ambiente local.  
  4. **Criar gramática inicial** no Bison (arquivo `.y`) e o arquivo de regras léxicas no Flex (arquivo `.l`), ainda que incompletos.  

- **Observações**  
  - Aproveitar as quartas-feiras para “rodar” daily meetings rápidas, verificando se alguém tem pendências ou dificuldades.  
  - Cada integrante deve se familiarizar com Git/GitHub para evitar atrasos futuros.  

---

### Sprint 2   
- **Objetivos Principais**  
  - Concluir a análise léxica com Flex (definição dos tokens da linguagem).  
  - Implementar as regras básicas do analisador sintático com Bison.  
  - Preparar a apresentação do **Ponto de Controle P1**.  

- **Principais Entregas**  
  - Arquivo `.l` completo para reconhecimento de tokens (identificadores, números, símbolos, palavras-chave).  
  - Primeiras regras sintáticas no arquivo `.y`, permitindo testar códigos simples na linguagem.  
  - Formulário de P1 preenchido, com apresentação.  

- **Tarefas e Atividades**  
  1. **Finalizar** as expressões regulares no arquivo `.l` (tratando espaços, comentários, etc.).  
  2. **Desenvolver** regras sintáticas no Bison (estruturas básicas de atribuição, expressões, comandos simples).  
  3. **Testar** tokens e parser em pequenos exemplos, validando o fluxo léxico-sintático.  
  4. **Preparar** material de apresentação (P1) sobre o progresso (mostrar tokens reconhecidos e regras sintáticas iniciais).  

- **Observações**  
  - O Sprint fecha com a **apresentação** do P1 (máximo de 5 minutos por equipe).  

---

### Sprint 3   
- **Objetivos Principais**  
  - Criar a **árvore sintática abstrata (AST)** para representar construções da linguagem.  
  - Iniciar a **análise semântica** básica, verificando coerência de variáveis e tipos (caso se apliquem).  
  - Aprimorar o parser para lidar com mensagens de erro mais claras.  

- **Principais Entregas**  
  - AST consolidada (estruturas de dados ou classes para cada tipo de nó: expressões, comandos, etc.).  
  - Módulo de análise semântica inicial (por exemplo, verificação de variáveis declaradas e tipos simples).  
  - Parser que já constrói a AST durante a análise sintática, facilitando a etapa de interpretação futura.  

- **Tarefas e Atividades**  
  1. **Implementar** as ações semânticas no arquivo `.y` de modo a criar nós da AST para cada construção reconhecida.  
  2. **Criar tabela de símbolos** (se for necessária) para verificar declarações de variáveis, escopos, etc.  
  3. **Tratar** erros sintáticos e semânticos básicos, exibindo mensagens significativas ao usuário.  
  4. **Testar** a AST em pequenos programas (tanto corretos quanto com falhas de sintaxe/semântica).  

- **Observações**  
  - As quartas-feiras são dedicadas ao desenvolvimento prático e integração das tarefas.  
  - Mantenham commit estáveis no repositório para evitar regressões (e documentem bem a AST).  

---

### Sprint 4   
- **Objetivos Principais**  
  - Implementar a **interpretação** da AST (em vez de gerar código, o programa executa diretamente cada nó).  
  - Aprimorar a análise semântica, tratando construções mais complexas (if, while, funções, se a linguagem definir).  
  - Preparar o **Ponto de Controle P2**.  

- **Principais Entregas**  
  - **Módulo interpretador**: capaz de percorrer a AST e executar instruções (atribuições, expressões, fluxos de controle).  
  - Análise semântica mais robusta (ex.: tipos, escopo, variáveis não declaradas, e possíveis alertas em tempo de execução).  
  - Formulário de P2 preenchido e apresentação realizada.  

- **Tarefas e Atividades**  
  1. **Criar** a lógica de interpretação recursiva (ex.: `interpretNode()`, que avalia nós de expressão/comando).  
  2. **Consolidar** estruturas de controle (if, while, etc.), garantindo que a AST as represente adequadamente.  
  3. **Testar** o interpretador com programas de exemplo que demonstrem a execução de comandos básicos.  
  4. **Preparar** a apresentação P2, mostrando as novidades desde o P1 e a interpretação funcionando.  

- **Observações**  
  - Use as aulas práticas para integrar e corrigir bugs.  
  - O Sprint termina com a **apresentação** P2.  

---

### Sprint 5   
- **Objetivos Principais**  
  - Adicionar **otimizações** opcionais na interpretação (ex.: simplificação de expressões constantes).  
  - Incluir **recursos adicionais** na linguagem, caso haja tempo (funções, arrays, strings, etc.).  
  - Realizar testes integrados, assegurando que o interpretador cobre todo o escopo definido.  
  - Preparar a **entrega final**.  

- **Principais Entregas**  
  - Interpretador ampliado, com eventuais otimizações e funcionalidades extras.  
  - Testes de integração em diversos programas de exemplo.  
  - Versão final pronta para entrega via Teams.  

- **Tarefas e Atividades**  
  1. **Implementar otimizações** simples (constant folding, remoção de nós redundantes, etc.).  
  2. **Estender** a linguagem com novos recursos (desde que caiba no cronograma).  
  3. **Testar** intensivamente (abordando construções avançadas e casos-limite).  
  4. **Entregar** o projeto final (repositório atualizado, acesso ao professor, e arquivo zip, se exigido).  

- **Observações**  
  - Quartas-feiras são fundamentais para corrigir bugs e integrar tudo.  
  - Não deixem a entrega para o último segundo. Planejem-se para evitar imprevistos.  

---

### Sprint 6   
- **Objetivos Principais**  
  - Participar das **entrevistas finais** com o professor.  
  - Corrigir pendências/bugs emergentes.  
  - Concluir a documentação e encerrar a disciplina.  

- **Principais Entregas**  
  - **Entrevistas** de entrega do projeto final (toda a equipe deve estar presente).  
  - **Documentação** completa (README, manual de uso, explicações sobre a AST e a execução).  
  - Ajustes finais (caso o professor detecte problemas).  

- **Tarefas e Atividades**  
  1. **Preparar-se** para as entrevistas: cada membro deve entender bem o parser, a AST, a análise semântica e o interpretador.  
  2. **Corrigir** eventuais falhas apontadas pelo professor durante as entrevistas ou testes.  
  3. **Finalizar** documentação e organizar exemplos de uso.  

- **Observações**  
  - Consulte o plano de ensino para verificar as datas das entrevistas. Falta de comparecimento pode zerar a nota da apresentação final.   

## Dicas Finais

1. **Use as quartas-feiras** para rodar as “dailies” e revisar backlog de tarefas, mantendo transparência sobre o que cada um está fazendo.  
2. Planeje **reuniões de review** no fim de cada Sprint (preferencialmente na própria quarta-feira) para demonstrar o que foi concluído e alinhar o que entra no próximo Sprint.  
3. Sempre que possível, mantenha **testes automatizados** (ainda que simples) para cada fase: léxica, sintática, semântica, geração de código e execução final.  
4. Fiquem atentos às **datas dos formulários (P1 e P2)** e às **apresentações** — qualquer falha na entrega ou no preenchimento derruba a nota daquela avaliação.  
5. Considerem a possibilidade de perda de um integrante depois da metade da disciplina: distribuam conhecimento e documentem o máximo possível para não perderem ritmo.  
6. Não se esqueçam de manter **folga no cronograma** para lidar com imprevistos (bugs complexos, prazos de outras disciplinas, feriados e eventos).  

Esse planejamento é apenas um **exemplo** — cada equipe pode ajustá-lo conforme seu ritmo, desde que respeitem os marcos (P1, P2, entregas finais e entrevistas). O importante é manter a transparência e o comprometimento com as entregas, sempre priorizando a qualidade e a compreensão de cada parte do compilador.