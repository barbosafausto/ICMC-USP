#include "../../item/item.h"

#ifndef AVL_H
    #define AVL_H

        #include <stdbool.h>

        #define max(a, b) ((a > b) ? a : b)

        typedef struct avl AVL;

        AVL *abb_criar(void);
        bool abb_inserir(AVL *tree, ITEM *item);


#endif