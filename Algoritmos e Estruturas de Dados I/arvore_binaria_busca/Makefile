all: item.o abb.o main.o
	gcc item.o abb.o main.o -o main -std=c99 -Wall -lm

item.o:
	gcc -c ../../item/item.c -o item.o

abb.o:
	gcc -c abb.c -o abb.o 

main.o:
	gcc -c main.c -o main.o

run:
	./main

clean:
	rm *.o
	rm main
