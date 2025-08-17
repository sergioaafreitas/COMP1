# Guia simplificado: passos para criação de um compilador

Este guia apresenta etapas para a implementação prática de um compilador.

## 1. Definir a linguagem-fonte
- Descrever a sintaxe e a semântica básica da linguagem.
- Elaborar a gramática formal (por exemplo, gramática livre de contexto).

## 2. Análise léxica com Flex
- Criar regras para identificar tokens.
- Definir expressões regulares para reconhecer padrões de texto e gerar tokens.

## 3. Implementar o analisador sintático com Bison
- Criar a gramática em formato reconhecido pelo Bison.
- Associar tokens com regras gramaticais e ações semânticas simples.

## 4. Criar a análise semântica básica
- Verificar tipos das variáveis e escopo.
- Reportar erros semânticos (como incompatibilidade de tipos ou variáveis não declaradas).

## 5. Gerar código intermediário simples
- Definir uma representação intermediária (por exemplo, código de três endereços).
- Converter a árvore sintática para essa representação intermediária.

## 6. Otimizar o código intermediário (passo opcional)
- Aplicar técnicas básicas, como remoção de código morto e otimização de expressões simples.

## 7. Gerar o código final (linguagem-alvo)
- Traduzir o código intermediário para linguagem assembly ou código de máquina simples.
- Testar geração do código com programas-exemplo.

---

## Sugestão de Sprints para a construção de um compilador na disciplina

### Sprint 1
- **Objetivos Principais**  
  - Formar as equipes e organizar o ambiente de trabalho (configurar repositórios, ferramentas, Flex, Bison etc.).  
  - Definir a linguagem-fonte do compilador (sintaxe e semântica básica).  
  - Elaborar a primeira versão da gramática formal (livre de contexto).  

- **Principais Entregas**  
  - Documento inicial descrevendo a linguagem (tokens, estruturas, exemplos de código).  
  - Protótipo de gramática reconhecida pelo Bison (ainda não funcional, mas já planejada).  
  - Ambiente configurado e testado (cada membro deve conseguir compilar e rodar um “hello world” do Flex/Bison).

- **Tarefas e Atividades**  
  1. **Definir o escopo do compilador**: quais construções essenciais da linguagem serão suportadas.  
  2. **Configurar repositório** (GitHub ou similar) e adicionar todos os membros (incluindo o professor: “sergioaafreitas” ou “sergiofreitas@unb.br”).  
  3. **Configurar Ferramentas**: Flex, Bison, compilador C/C++ (ou outra linguagem) no ambiente local.  
  4. **Criar gramática inicial** no Bison (arquivo .y) e o arquivo de regras léxicas no Flex (arquivo .l), ainda que incompletos.  

- **Observações**  
  - Aproveitar as quartas-feiras para “rodar” a daily meeting rápida e verificar tarefas pendentes.  
  - Garantir que todos estejam confortáveis com Git/GitHub para evitar atrasos futuros.

---

### Sprint 2 
- **Objetivos Principais**  
  - Concluir a **análise léxica** (Flex) e iniciar a **análise sintática** (Bison).  
  - Implementar identificação de tokens e testar o reconhecimento básico da linguagem.  
  - Preparar o material para o Ponto de Controle P1 .  

- **Principais Entregas**  
  - Analisador léxico funcional (arquivo .l completo), reconhecendo os tokens definidos.  
  - Primeiras regras sintáticas implementadas no arquivo .y (sem grande profundidade semântica ainda).  
  - Formulário de apresentação do P1 preenchido .  
  - Apresentação P1 (máximo de 5 minutos).  

- **Tarefas e Atividades**  
  1. **Finalizar as expressões regulares** no Flex para todos os tokens principais.  
  2. **Iniciar o parser** no Bison (regras gramaticais básicas e ações semânticas simples).  
  3. **Testar**: criar exemplos de entrada e verificar se o analisador léxico e o parser inicial funcionam.  
  4. **Preparar slides/demonstrativo** para o P1 (conforme orientações do professor).  
  5. **Preencher o formulário do P1** no link fornecido.  

- **Observações**  
  - Sprint termina no dia da apresentação P1, mas se planejem para testar e ensaiar antes.

---

### Sprint 3 
- **Objetivos Principais**  
  - Evoluir o **analisador sintático** com novas produções gramaticais.  
  - Iniciar a **estrutura interna** do compilador (árvore sintática, tabela de símbolos).  
  - Dar os primeiros passos na **análise semântica** (tipo de variáveis, escopos).  

- **Principais Entregas**  
  - Parser com cobertura mais ampla da gramática (incluindo estruturas de controle, declarações etc.).  
  - Estrutura de dados (AST e tabela de símbolos) definidas e parcialmente implementadas.  
  - Analisador semântico inicial identificando erros básicos (variáveis não declaradas, tipos simples).  

- **Tarefas e Atividades**  
  1. **Estender as regras gramaticais** no Bison, cobrindo as principais construções da linguagem.  
  2. **Criar e popular a tabela de símbolos** durante a análise sintática.  
  3. **Construir a AST** (árvore sintática abstrata) ou outra representação intermediária para facilitar a análise semântica.  
  4. **Implementar verificação de tipos** e de escopo simples (reportar erros se algo estiver fora das regras).  

- **Observações**  
  - As **quartas-feiras** continuam sendo essenciais para o hands-on do compilador.  
  - Mantenham testes de unidade (pequenos trechos de código-fonte) para validar o parser e a semântica.  
  - Já comecem a pensar em como integrar a geração de código intermediário, pois isso virá na próxima Sprint.

---

### Sprint 4
- **Objetivos Principais**  
  - **Concluir** análise semântica principal.  
  - Implementar a **geração de código intermediário** (código de três endereços ou equivalente).  
  - Preparar o ponto de controle P2.  

- **Principais Entregas**  
  - Analisador semântico robusto (tratando coerência de tipos, escopos, variáveis).  
  - Módulo de geração de código intermediário, ainda que sem otimizações avançadas.  
  - Formulário do P2 preenchido.  
  - Apresentação do ponto de controle P2.  

- **Tarefas e Atividades**  
  1. **Refinar a análise semântica** para lidar com construções complexas (funções, estruturas, etc., se estiverem previstas na linguagem).  
  2. **Criar gerador de código intermediário**: ao percorrer a AST, traduzir cada construção para instruções de três endereços ou outra representação escolhida.  
  3. **Configurar testes**: produzir exemplos que gerem instruções intermediárias e verificar a consistência.  
  4. **Preparar apresentação P2** (foco no que evoluiu após o P1) e garantir o preenchimento do formulário.  

- **Observações**  
  - O trabalho está entrando na parte central de “vida” do compilador, então lembrem-se de dedicar tempo às quartas-feiras para integrar código e resolver conflitos.  
  - Nesta fase, pode ocorrer a saída de 1 membro da equipe (por motivos externos); planejem-se para redistribuir tarefas se isso acontecer.

---

### Sprint 5
- **Objetivos Principais**  
  - Introduzir e testar **otimizações** no código intermediário (opcional, mas recomendável).  
  - Implementar a **geração de código final** (assembly simples ou outra linguagem-alvo).  
  - Realizar **testes integrados** e correções de bugs.  
  - Entregar o compilador final  no Teams.  

- **Principais Entregas**  
  - Módulo de otimização básico (remoção de código morto, simplificação de expressões).  
  - Módulo de geração de código final.  
  - Compilador “rodando de ponta a ponta” em exemplos representativos.  

- **Tarefas e Atividades**  
  1. **Projetar e implementar otimizações** simples: remover instruções redundantes, constante folding etc.  
  2. **Criar tradutor final**: do código intermediário para assembly ou outra linguagem de saída escolhida.  
  3. **Testar** em múltiplos programas de exemplo para verificar integridade (da análise léxica até a execução final).  
  4. **Entregar o compilador** (via Teams) e garantir o repositório acessível ao professor.  

- **Observações**  
  - As quartas-feiras devem ser focadas em testes e integração.  
  - Mantenham versões de backup, pois qualquer problema grave de última hora pode ser mitigado se vocês tiverem commits estáveis.

---

### Sprint 6 
- **Objetivos Principais**  
  - Realizar as **entrevistas finais**.  
  - Ajustar eventuais pendências do compilador.  
  - Concluir a documentação e finalizar a disciplina.  

- **Principais Entregas**  
  - Apresentação do compilador nas entrevistas (cada membro deve entender e saber explicar o projeto).  
  - Correções finais (se necessárias) e documentação completa (manual de uso, README, passos de compilação).  

- **Tarefas e Atividades**  
  1. **Entrevistas de entrega**: garantir que todos dominem o que foi desenvolvido; o professor poderá perguntar detalhes específicos.  
  2. **Corrigir issues** identificadas durante as entrevistas ou nos testes de última hora.  
  3. **Documentar**: elaborar um README ou manual que descreva claramente como compilar, rodar e testar o compilador.  

- **Observações**  
  - As entrevistas acontecem conforme o cronograma. É obrigatório que toda a equipe compareça na data/hora agendada.  
  - Após essa etapa, a disciplina se encaminha para o encerramento. Qualquer revisão de menção ocorre na semana seguinte.


## Dicas Finais

1. **Use as quartas-feiras** para rodar as “dailies” e revisar backlog de tarefas, mantendo transparência sobre o que cada um está fazendo.  
2. Planeje **reuniões de review** no fim de cada Sprint (preferencialmente na própria quarta-feira) para demonstrar o que foi concluído e alinhar o que entra no próximo Sprint.  
3. Sempre que possível, mantenha **testes automatizados** (ainda que simples) para cada fase: léxica, sintática, semântica, geração de código e execução final.  
4. Fiquem atentos às **datas dos formulários (P1 e P2)** e às **apresentações** — qualquer falha na entrega ou no preenchimento derruba a nota daquela avaliação.  
5. Considerem a possibilidade de perda de um integrante depois da metade da disciplina: distribuam conhecimento e documentem o máximo possível para não perderem ritmo.  
6. Não se esqueçam de manter **folga no cronograma** para lidar com imprevistos (bugs complexos, prazos de outras disciplinas, feriados e eventos).  

Esse planejamento é apenas um **exemplo** — cada equipe pode ajustá-lo conforme seu ritmo, desde que respeitem os marcos (P1, P2, entregas finais e entrevistas). O importante é manter a transparência e o comprometimento com as entregas, sempre priorizando a qualidade e a compreensão de cada parte do compilador.