#include "../../item/item.h"

#ifndef AB_H
    #define AB_H

        #include <stdbool.h>

        typedef struct abb ABB;

        ABB *abb_criar(void);
        bool abb_inserir(ABB *tree, ITEM *item);


#endif