#include <stdlib.h>
#include "heap.h"

#define maxn 100

//Toda heap é uma árvore binária completa
// O último nível, se não completo, está com os nós sempre mais à esquerda
// O penúltimo nível está obrigatoriamente completo

// Convenção: último nó está mais à direita no último nível

struct heap_sequencial {

    ITEM *vetor[maxn]; 
    int fim;
    int tam;
};

HEAP* heap_sequencial_criar() {

    HEAP *h = (HEAP*) malloc(sizeof(HEAP));

    if (h) {
        h->fim = -1;
    }

    return h;
};

bool heap_sequencial_vazia(HEAP *h) {

    if (!h) return true;

    return (h->fim == -1);
}

bool heap_sequencial_cheia(HEAP *h) {

    if (!h) return true;

    return (h->fim == maxn-1);
}

void heap_swap(HEAP *h, int i, int j) {

    ITEM *tmp = h->vetor[i];
    h->vetor[i] = h->vetor[j];
    h->vetor[j] = tmp;
}

void fix_up(HEAP *h) {

    int w = h->fim;
    int pai = (w-1)/2;

    while (w > 0 && item_get_chave(h->vetor[w]) > item_get_chave(h->vetor[pai])) {

        heap_swap(h, w, pai);
        w = pai;

        pai = (pai-1)/2;
    }
}

void fix_down(HEAP *h) {

    int p = 0; //pai
    int filho1 = 2*p + 1;
    int filho2 = 2*p + 2;

    int menor = p;
    while (filho1 <= h->fim) { //Enquanto o filho1 for válido
        
        //Min-Heap: menor precisa subir
        if (item_get_chave(h->vetor[filho1]) < item_get_chave(h->vetor[menor]))
            menor = filho1;

        //Necessário verificar se o filho2 é válido
        if (filho2 <= h->fim && item_get_chave(h->vetor[filho2]) < item_get_chave(h->vetor[menor]))
            menor = filho2;

        if (menor != p) heap_swap(h, p, menor);
        else break;

        p = menor;
        filho1 = 2*p + 1;
        filho2 = 2*p + 2;
    }
}

bool heap_sequencial_inserir(HEAP* h, ITEM *item) {

    if (h && !heap_sequencial_cheia(h)) {
        
        h->fim++;
        h->vetor[h->fim] = item;        

        return true;
    }

    return false;
}

ITEM* heap_sequencial_remover(HEAP* h) {

    if (h && !heap_sequencial_cheia(h)) {

        ITEM *aux = h->vetor[0];

        h->vetor[0] = h->vetor[h->fim];
        h->fim--;

        fix_down(h);

        return aux;
    }

    return NULL;

}