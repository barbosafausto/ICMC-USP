#include "abb.h"
#include <stdlib.h>
#include <stdio.h>

//Árvore Binária de Busca: nó de sub-árvore à direita > nó de sub-árvore à esquerda
//Busca Em-Ordem: esquerda -> raiz -> direita (ordem crescente)
    // Permite busca em O(log n)

typedef struct no NO;
struct no {

    ITEM *item;
    NO *esq;
    NO *dir;
};

struct abb {
    NO *raiz;
    int profundidade;

};

ABB *abb_criar() {

    ABB *t = (ABB*) malloc(sizeof(ABB));

    if (t) {
        t->raiz = NULL;
        t->profundidade = -1;

    }
    
    return t;
}

NO *abb_cria_no(ITEM *item) {

    NO *new = (NO*) malloc(sizeof(NO));
    
    new->item = item;
    new->esq = NULL;
    new->dir = NULL;
    
    return new;

}

bool abb_cheia(ABB *tree) {

        NO *new = (NO*) malloc(sizeof(NO));

        if (new) {

            free(new);
            new = NULL;

            return false;
        }

        return true;
}


//Inserção: começa da raiz
    //Procurar local de inserção
    //Achar o primeiro local nulo

NO *abb_inserir_no(NO* node, NO* new) {

    int chave = item_get_chave(new->item);

    if (node == NULL) {

        return node = new;
    }

    if (chave < item_get_chave(node->item)) node->esq = abb_inserir_no(node->esq, new);
    else if (chave > item_get_chave(node->item)) node->dir = abb_inserir_no(node->dir, new);

    return node;
}

bool abb_inserir(ABB *tree, ITEM *item) {

    if (!tree) {

        fputs("Ponteiro inválido.\n", stderr);
        return false;
    }

    if (abb_cheia(tree)) {

        fputs("A árvore está cheia.\n", stderr);
        return false;
    }


    NO *new = abb_cria_no(item);
    if (new) {
        tree->raiz = abb_inserir_no(tree->raiz, new);
        return true;
    }

    return false;
}

ITEM *abb_buscar_no(NO *raiz, int chave) {

    if (!raiz) return NULL;

    if (chave == item_get_chave(raiz->item))
        return raiz->item;

    else if (chave < item_get_chave(raiz->item)) return abb_buscar_no(raiz->esq, chave);
    else return abb_buscar_no(raiz->dir, chave);
}

ITEM *abb_buscar(ABB *tree, int chave) {

    return abb_buscar_no(tree->raiz, chave);
}

void troca_max_esq(NO *troca, NO *raiz, NO *ant) {
    
    if (troca->dir) {

        troca_max_esq(troca->dir, raiz, troca);
        return;
    }

    if (raiz == ant) 
        ant->esq = troca->esq;
    else 
        ant->dir = troca->esq;

    raiz->item = troca->item;
    free(troca); troca = NULL;

}

//Algoritmo remove apenas o nó, mas não remove o item
bool abb_remover_aux (NO **raiz, int chave) {

    NO *p;
    if (*raiz == NULL) return false;

    if (chave == item_get_chave((*raiz)->item)) {
        
        if ((*raiz)->esq == NULL || (*raiz)->dir == NULL) {

            p = *raiz;
            if ((*raiz)->esq == NULL)
                *raiz = (*raiz)->dir;

            else
                *raiz = (*raiz)->esq;
             
            free(p);        
        }

        else 
            troca_max_esq((*raiz)->esq, *raiz, *raiz);
        
        return true;
    }

    else {
        if (chave < item_get_chave((*raiz)->item)) return abb_remover_aux(&(*raiz)->esq, chave):
        else return abb_remover_aux(&(*raiz)->dir, chave);
    }
  
}

bool abb_remover(ABB *tree, int chave) {

    if (tree) return abb_remover_aux(&tree->raiz, chave);

    return false;
}


//Funções Extras
bool abb_inserir_iterativo(ABB *tree, ITEM *item) {


}