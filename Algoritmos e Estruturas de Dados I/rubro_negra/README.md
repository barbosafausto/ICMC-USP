# Left Leaning Red-Black Tree (LLRB)

* É uma ABB
* Arestas coloridas (Vermelha, Preta)


## Regras
> Aresta vermelha sempre no filho esquerdo

> Todo nó possui, no máximo, uma aresta vermelha

> Balanceamento negro perfeito
    >> Todo filho nulo está à mesma distância da raiz - distância negra;
    >> Contar apenas arestas negras.

## Violações
* Vermelho à direita $\implies$ Rotação à esquerda
* Nó com dois filhos vermelhos $\implies$ Inversão de cores
 * Dois filhos vermelhos seguidos 
    * à esquerda $\implies$ Rotação à direita & Inversão de cores
    * à esquerda, depois à direita $\implies$ Rotação à esquerda & Rotação à direita & Inversão de cores

## Comparação com AVL

* Melhor para busca: **AVL**
    * Menor altura
* Melhor para inserções e remoções: **RBT**
    * Rebalanceamento da RBT não exige operações matemáticas
        * Apenas comparações
        * Sem fator de balanceamento
            

## Características

*  Altura no pior caso: $h \leq 2\log(n)$

* Inserção: Igual ABB
    > Toda aresta incidente é vermelha

* Remoção: 
