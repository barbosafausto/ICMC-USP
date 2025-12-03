#include "avl.h"
#include <stdlib.h>
#include <stdio.h>

typedef struct no NO;
struct no {

    ITEM *item;
    NO *esq;
    NO *dir;
    int altura;
};

struct avl {

    NO *raiz;
};

AVL* avl_criar() {

    AVL *arvore = (AVL*) malloc(sizeof(AVL));

    if (arvore) {

        arvore-> raiz = NULL;
    }

    return arvore;
}

NO *avl_cria_no(ITEM *item) {

    NO *new = (NO*) malloc(sizeof(NO));
    
    new->item = item;
    new->esq = NULL;
    new->dir = NULL;
    new->altura = 0;
    
    return new;

}

int avl_altura_no(NO* raiz) {

    if (!raiz) return -1;
    else return raiz->altura;

}

void avl_apagar_aux(NO *raiz) {

    if (raiz != NULL) {

        avl_apagar_aux(raiz->esq);
        avl_apagar_aux(raiz->dir);
        item_apagar(&raiz->item);

        free(raiz);
    }
}

void avl_apagar(AVL **arvore) {

    avl_apagar_aux((*arvore)->raiz);

    free(*arvore);
    *arvore = NULL;
}


NO *rodar_direita(NO *A) {

    NO *B = A->esq;

    A->esq = B->dir;
    B->dir = A;

    A->altura = max(A->esq->altura, A->dir->altura) + 1;
    //Altura de B não muda

    return B;
}

NO *rodar_esquerda(NO *A) {

    NO *B = A->dir;

    A->dir = B->esq;
    B->esq = A;

    A->altura = max(A->esq->altura, A->dir->altura) + 1;
    //Altura de B não muda

    return B;
}

NO *rodar_esq_dir(NO *A) {

    A->esq = rodar_esquerda(A->esq);
    return rodar_direita(A);
}

NO *rodar_dir_esq(NO *A) {

    A->dir = rodar_direita(A->dir);
    return rodar_esquerda(A);
}

NO *avl_inserir_no(NO *raiz, ITEM *item) {

    if (raiz == NULL)
        raiz = avl_cria_no(item);

    else {

        int new_chave = item_get_chave(item);
        int chave = item_get_chave(raiz->item);

        if (new_chave < chave) raiz->esq = avl_inserir_no(raiz->esq, item);
        else if (new_chave > chave) raiz->dir = avl_inserir_no(raiz->dir, item);
    }

    raiz->altura = max(avl_altura_no(raiz->esq), avl_altura_no(raiz->dir)) + 1;

    int fator = avl_altura_no(raiz->esq) - avl_altura_no(raiz->dir);
    if (fator > 1) {

        if (avl_altura_no(raiz->esq->esq) - avl_altura_no(raiz->esq->dir) >= 0)
            raiz = rodar_dir_esq(raiz);

        else raiz = rodar_dir_esq(raiz);   
    }

    if (fator < 1) {

        if (avl_altura_no(raiz->dir->esq) - avl_altura_no(raiz->dir->dir) <= 0) 
            raiz = rodar_esquerda(raiz);

        else raiz = rodar_dir_esq(raiz);
    }
    
    return raiz;
}

bool avl_inserir(AVL *arvore, ITEM *item) {

    return ((arvore->raiz = avl_inserir_no(arvore->raiz, item)) != NULL);
}

void troca_max_esq(NO *troca, NO *raiz, NO *pai) {

    if (troca->dir) {

        troca_max_esq(troca->dir, raiz, troca);
        return;
    }

    NO *aux;
    if (raiz == pai) 
        pai->esq = troca->esq;
    else 
        pai->dir = troca->esq;

    item_apagar(&raiz->item);
    raiz->item = troca->item;

    free(troca);
    troca = NULL;
}

NO *avl_remover_no(NO *raiz, int chave) {
    
    if (!raiz) return NULL;

    int no_chave = item_get_chave(raiz->item);

    if (chave < no_chave) raiz->esq = avl_remover_no(raiz->esq, chave);
    else if (chave > no_chave) raiz->dir = avl_remover_no(raiz->dir, chave);
    else {

        if (raiz->esq == NULL || raiz->dir == NULL) {

            NO *aux;
            if (raiz->esq == NULL) {

                aux = raiz->dir;
                
                item_apagar(&raiz->item);

                raiz->dir = NULL;
                free(raiz);
                raiz = NULL;

                return aux;
            }

            else if (raiz->dir == NULL) {

                aux = raiz->esq;
                
                item_apagar(&raiz->item);

                raiz->esq = NULL;
                free(raiz);
                raiz = NULL;

                return aux;
            }
        }
        else {
            troca_max_esq(raiz->esq, raiz, raiz);            
        }
    }

    //If para o caso de a árvore ter apenas 1 elemento
   if (raiz) {

        raiz->altura = max(avl_altura_no(raiz->esq), avl_altura_no(raiz->dir)) + 1;

        int a_esq = avl_altura_no(raiz->esq);
        int a_dir = avl_altura_no(raiz->dir);

        if (a_esq - a_dir == -2) {

            if (avl_altura_no(raiz->dir->esq) - avl_altura_no(raiz->dir->dir) <= 0)
                raiz = rodar_esquerda(raiz);

            else
                raiz = rodar_dir_esq(raiz);
        }
        else if (a_esq - a_dir == 2) {
            
            if (avl_altura_no(raiz->esq->esq) - avl_altura_no(raiz->esq->dir) >= 0) 
                raiz = rodar_direita(raiz);

            else
                raiz = rodar_esq_dir(raiz);
        }
   }

   return raiz;
}

bool avl_remover(AVL *arvore, int chave) {

    if (!arvore) return false;

    return ((arvore->raiz = avl_remover_no(arvore->raiz, chave)) != NULL);
    
}