all: main

main: main.o ast.o
	gcc -o main main.o ast.o

main.o: main.c ast.h
	gcc -c main.c

ast.o: ast.c ast.h
	gcc -c ast.c

clean:
	rm -f *.o main