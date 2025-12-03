#include <stdbool.h>
#include <stdlib.h>

typedef struct no NO;
typedef struct llrb LLRB;

struct no {

    int info;
    NO *esq, *dir;
    bool cor; //Vermelho: 1; Preto: 0

};

struct llrb {
    NO *raiz;
};

void llrb_inverte(NO *r) {

    r->cor = !r->cor;
    
    r->esq->cor = !r->esq->cor;
    r->dir->cor = !r->dir->cor;
}

NO *llrb_roda_direita(NO *A) {

    NO *B = A->esq;

    A->esq = B->dir;
    B->dir = A;

    B->cor = A->cor;
    A->cor = true;

    return B;
}

bool eh_vermelho(NO *node) {

    if (node == NULL) return false;
    
    return (node->cor == true);

}

NO *llrb_criar_no(int data) {

    NO *node = (NO*) malloc(sizeof(NO));

    node->esq = node->dir = NULL;
    node->cor = true;

    return node;
}

NO *llrb_roda_esquerda(NO *A) {

    NO *B = A->dir;

    A->dir = B->esq;
    B->esq = A;

    B->cor = A->cor;
    A->cor = true;

    return B;
}

NO* llrb_inserir(NO *node, int data) {

    if (!node) return (llrb_criar_no(data));

    if (data < node->info)
        node->esq = llrb_inserir(node->esq, data);
    else if (data > node->info)
        node->dir = llrb_inserir(node->dir, data);
    
        if (eh_vermelho(node->dir) && !eh_vermelho(node->esq)) node = llrb_roda_esquerda(node);
        if (eh_vermelho(node->esq) && eh_vermelho(node->esq->esq)) node = llrb_roda_direita(node);
        if (eh_vermelho(node->esq) && eh_vermelho(node->dir)) llrb_inverte(node);

    return node;
}













NO *llrb_propaga_esquerda(NO *raiz) {

    //if (!eh_vermelho(raiz->esq) && !eh_vermelho(raiz->esq->esq))  {

        llrb_inverte(raiz);

        if (eh_vermelho(raiz->dir->esq)) {

            raiz->dir = llrb_roda_direita(raiz->dir);
            raiz = llrb_roda_esquerda(raiz);
            llrb_inverte(raiz);
        }

    //}

    return raiz;
}

NO *llrb_propaga_direita(NO *raiz) {

    /*
    if (eh_vermelho(raiz->esq)) {

        raiz = llrb_roda_direita(raiz);
    }*/

    //if (!eh_vermelho(raiz->dir) && !eh_vermelho(raiz->dir->esq)) {

        llrb_inverte(raiz);

        if (eh_vermelho(raiz->esq->esq)) {

            raiz = llrb_roda_direita(raiz);
            llrb_inverte(raiz);
        }
    //}

    return raiz;
}

NO *llrb_restaura(NO *node) {

    if (!node) return NULL;

    if (eh_vermelho(node->dir) && !eh_vermelho(node->esq)) node = llrb_roda_esquerda(node);
    if (eh_vermelho(node->esq) && eh_vermelho(node->esq->esq)) node = llrb_roda_direita(node);
    if (eh_vermelho(node->esq) && eh_vermelho(node->dir)) llrb_inverte(node);

    return node;
}

NO *llrb_min(NO *raiz) {

    while (raiz->esq) {

        raiz = raiz->esq;
    }

    return raiz;
}


NO *llrb_remove_min(NO *raiz) {

    if (raiz->esq) {

        if (!eh_vermelho(raiz->esq) && !eh_vermelho(raiz->esq->esq))
            raiz = llrb_propaga_esquerda(raiz);
        raiz->esq = llrb_remove_min(raiz->esq);
    }
    else {

        free(raiz);
        raiz = NULL;
    }

    return llrb_restaura(raiz);
}

NO* llrb_remover(NO *raiz, int data) {

    if (!raiz) return NULL;

    if (data < raiz->info) {

        //Condição de propagação
        if (!eh_vermelho(raiz->esq) && !eh_vermelho(raiz->esq->esq))
            raiz = llrb_propaga_esquerda(raiz);

        raiz->esq = llrb_remover(raiz->esq, data);

    }

    else { //Agora, o nó pode ser maior ou igual ao dado
        
        if (eh_vermelho(raiz->esq))
            raiz = llrb_roda_direita(raiz);

        //Verificação após rotação (apenas 1 filho)
        if (data == raiz->info && raiz->dir == NULL) {
            free(raiz);
            return NULL;
        } 
        //Não precisa verificar o caso em que o nó da esquerda é NULL
        //Se o da esquerda for NULL, ela será vermelho e a função de rotação acima já terá rotacionado ele
        //Se ele for preto, a distância negra será violada
        
        //Condição de propagação
        if (!eh_vermelho(raiz->dir) && !eh_vermelho(raiz->dir->esq)) 
            raiz = llrb_propaga_direita(raiz);

        if (data == raiz->info) { //Verificação com rotação feita

            NO *x = llrb_min(raiz->dir);
            raiz->info = x->info;
            raiz->dir = llrb_remove_min(raiz->dir);
        }
        else {
            raiz->dir = llrb_remover(raiz->dir, data);
        }
    }

    return llrb_restaura(raiz);
}












