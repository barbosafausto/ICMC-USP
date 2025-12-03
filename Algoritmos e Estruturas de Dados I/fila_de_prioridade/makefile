all: item.o hea.o main.o
	gcc item.o heap.o main.o -o main -std=c99 -Wall

verifica: item.o heap.o main.o
	gcc -fsanitize=address -g item.o heap.o main.o -o main -std=c99 -Wall 

item.o:
	gcc -c ../../item/item.c 

heap.o:
	gcc -c heap.c 


main.o:
	gcc -c main.c

run:
	./main

clean:
	rm ./main
	rm *.o