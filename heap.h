#ifndef HEAP_H
    #define HEAP_H
    #include "../../item/item.h" 
    #include <stdbool.h>
    
    typedef struct heap_sequencial HEAP;

    HEAP *heap_sequencial_criar(void);

    bool heap_sequencial_inserir(HEAP *h, ITEM *item);
    ITEM *heap_sequencial_remover(HEAP *h);

#endif