# Minimum Spanning Tree (MST)

## Algoritmo de Prim

* $O(E\log V)$

```C
Prim-MST (G)

    Init da fila de prioridade fp com todos os nós
    Init dos peso[u] = infinito para todo vértice u
    Init antecessor[u] = -1 (NIL) para todo vértice u
    Init peso[raiz] = 0

    enquanto não vazia(fp)
        u <- extrai_minimo(fp)
        para cada v <- adjacente[u]

            Se na_fila(fp, v) e w(u, v) <= peso[v]
                antecessor[v] = u
                peso[v] = w(u, v)
                
                //V precisa ter um peso menor agora
                fp.decrease_keys(v, peso[v]) 
            fim-se
        fim-para
    fim-enquanto
```

* $O(E \log E)$ se feito com Union-Find
```C
Kruskal-MST(G)

    Definir Conjunto Sj: {vj}, 1 <= j <= n, Et = vazio
    Init fp com arestas do conjunto
    Enquanto houver arestas na fila faça
        e = unqueue(fp)
        seja (v, w) o par de vértices de e
        Se v in Sp e w in Sq, disjuntos, então
        Sp = Sp U Sq
        Eliminar Sq
        Et = Et U e
    Fim Enquanto
        
```