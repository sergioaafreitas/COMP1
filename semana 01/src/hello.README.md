Para compilar e executar o exemplo **hello.l** + **hello.y**, você precisa:

`1. **Gerar os arquivos do *Bison*** (no terminal, no mesmo diretório):  
   ```bash
   bison -d hello.y
   ```
   - Isso criará **hello.tab.c** (com o código C do parser) e **hello.tab.h** (com as definições dos tokens).

2. **Gerar o arquivo do *Flex***:  
   ```bash
   flex hello.l
   ```
   - Isso criará **lex.yy.c** (código C do analisador léxico).

3. **Compilar tudo junto** (com *gcc* ou outro compilador C):  
   ```bash
   gcc -o hello hello.tab.c lex.yy.c -lfl
   ```
   - A opção `-lfl` linka a biblioteca do Flex (em algumas distros, pode ser `-ll`).

4. **Executar** o binário gerado:  
   ```bash
   ./hello
   ```
   - Se você digitar *HelloWorld* (ou usar um arquivo de entrada contendo `Hello World`) o parser deve reconhecer e imprimir *Hello, World!* na tela (de acordo com as regras de gramática definidas).