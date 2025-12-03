#include <stdio.h>
#include <stdlib.h>

#include "heap.h"

int main() {

    HEAP *h = heap_sequencial_criar();

    ITEM *item = item_criar(5);

    heap_sequencial_inserir(h, item);
    ITEM *item_removido = heap_sequencial_remover(h);

    printf("Item removido: %d\n", item_get_chave(item_removido));


    item_apagar(&item_removido);
    free(h);
}