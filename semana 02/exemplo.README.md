## Passos para compilar e executar

1. **Gerar o arquivo do Bison**  
   ```bash
   bison -d exemplo.y
   ```
   - Isso criará dois arquivos: `exemplo.tab.c` e `exemplo.tab.h` (o `-d` gera o `.h` que contém as definições dos tokens).

2. **Gerar o arquivo do Flex**  
   ```bash
   flex exemplo.l
   ```
   - Isso criará um arquivo `lex.yy.c`.

3. **Compilar tudo junto**  
   Use um compilador C (por exemplo, *gcc*) para gerar o executável:
   ```bash
   gcc -o parser exemplo.tab.c lex.yy.c -lfl
   ```
   - A opção `-lfl` linka a biblioteca do Flex. Em algumas distros, pode ser necessário `-ll` (ou `-lfl -ll`) dependendo das versões, mas normalmente `-lfl` é suficiente.

4. **Executar o programa**  
   - Se quiser digitar manualmente os dados:
     ```bash
     ./parser
     ```
     Em seguida, digite os números na tela e pressione *Enter* ao final de cada. Para encerrar, pressione `Ctrl+D` (em sistemas Unix) ou `Ctrl+Z` (em Windows).
   - Se quiser processar o arquivo `entrada.txt`:
     ```bash
     ./parser entrada.txt
     ```

5. **Verificar a saída**  
   - A cada número reconhecido, o programa imprime `Número lido: <valor>`.
   - O que não bater com `[+\-]?[0-9]{1,10}` será ignorado ou tratado conforme suas regras.  
   - Caso queira tratar caracteres não reconhecidos como erro, basta ajustar a regra `.` no arquivo `.l` para gerar alguma mensagem ou retornar um token de erro.
