#include "abb.h"

int main() {

    ABB *tree = abb_criar();

    ITEM *it = item_criar(17);
    abb_inserir(tree, it);

    item_set_chave(it, 12);
    abb_inserir(tree, it);

    item_set_chave(it, 20);
    abb_inserir(tree, it);

    return 0;
}