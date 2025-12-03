all: item.o avl.o main.o
	gcc item.o avl.o main.o -o main -std=c99 -Wall -lm

item.o:
	gcc -c ../../item/item.c -o item.o

avl.o:
	gcc -c avl.c -o avl.o 

main.o:
	gcc -c main.c -o main.o

run:
	./main

clean:
	rm *.o
	rm main
