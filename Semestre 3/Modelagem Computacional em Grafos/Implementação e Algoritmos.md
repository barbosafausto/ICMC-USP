# Estruturas de Dados

## Matriz de Adjacências

> Caro: complexidade espacial $O(n^2)$.

### Complexidade Temporal

* Busca, remoção ou inserção de aresta $e_{ij}$: $O(1)$. 


## Estrutura de Adjacências

> Mais elaborado: complexidade espacial $O(n + m)$

### Complexidade Temporal

* Busca ou remoção de aresta $e_{ij}$: $i$: $O(d_i)$.
* Inserção de aresta $e_{ij}$: $O(1)$.


# Algoritmos

## Buscas

### Depth-First Search (DFS)
> Em profundidade

Noção de *timestamp*.
* tin, tout.

```
DFS_visit(u)
    color[u] <- gray
    d[u] <- time + 1            // tin

    for each v in Adj[u]
        if color[v] == white
            p[v] <- u           // predecessor
            DFS_visit(v)

    color[u] <- black
    f[u] <- time <- time + 1    // tout
```


### Breadh-First Search (BFS)
> Em largura


## Ordenação Topológica

Ideia: nós com grau nulo são colocados numa fila.



## Componentes Fortemente Conectados



