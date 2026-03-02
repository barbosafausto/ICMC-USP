# Disciplina

> Prof. Alneu

> Atendimento

* Exercício em aula: 4 pessoas $\Longrightarrow$ reforço de conceitos
* Levar PC para a aula (programar!)
* <span style="color: ORANGE;  font-weight: bold"> Trabalhos práticos a serem divulgados no e-disciplinas </span>

> Avanço em grafos na disciplina de "Redes Complexas" (trilha IA).


## Definições

### Grafo

> Um grafo é tipo de representação simultânea de objetos (vértices, entidades) que possuem alguma relação entre si (arestas). Matematicamente, seja $E$ um conjunto de arestas e $V$ um conjunto de vértices, um grafo $G$ é dado por $G = (V, E)$. 
* Ordem de um grafo: $|V|$

Grafos orientados também são chamados de <u>dígrafos</u>.

⚠️ **Utilidade:** modelam sistemas/contextos de relacionamentos ordenados e contextualizados pela situação em si.


### Multigrafo

> Grafo que possui mais de uma aresta conectando um mesmo par de vértices.
 * Um grafo simples possui no máximo uma aresta por par de vértices.


### Grafo Trivial e Vazio
> Trivial: $V = \{v_1\}$, $E = \{\empty\}$

> Vazio: $G = \{\empty, \empty \}$


### Laço

> Consiste em uma aresta circular.
* $ V = \{v_1\}$, $E = \{(v_1, v_1)\}$


### Grafo Completo

> Um grafo no qual todos os seus vértices são adjacentes: extremos de uma mesma aresta.

$$
|E| = C_n^2 = \frac{n(n-1)}{2}
$$

É conexo.

### Grau

> O grau $d(v)$ de um vértice $v$ corresponde ao número de arestas incidentes (convergentes) a $v$.

#### Grafo Direcionado

Em grafos direcionados, dividimos $d(v)$ em $d_{in}(v)$ e $d_{out}(v)$, sendo o <u>grau de saída</u> $(d_{out})$ o número de arestas divergentes a $v$.

$$
\text{sorvedouro} \implies d_{out} = 0; \text{ fonte} \implies d_{in} = 0
$$

#### Grafo Regular

Um grafo regular possui o mesmo grau em todos os seus vértices.


### Grafo Valorado

> Possui pesos.

Nesse caso, cada aresta $A$ é composta pela tripla $\{v, w, valor\}$.


## Caminho

> Um caminho entre dois vértices $x$ e $y$ é uma sequência de vértices e arestas que une $x$ e $y$.
* Um caminho de $k$ vértices possa por $k-1$ arestas.
* Se o grafo não for **valorado**, o comprimento do caminho é a quantidade de arestas percorridas.


### Caminho (Não) Simples

> **Simples**: é composto apenas por vértices distintos.

> **Não simples**: pode possuir vértices iguais.


### Circuito 

> É um caminho $P = v_1, v_2,..., v_k, v_{k+1}$ em que $v_{k+1} = v_1$. Em outras palavras, um circuito é um ciclo onde todos os vértices distintos, exceto pelo primeiro e pelo último.
* Se um grafo tem ao menos um ciclo, ele é cíclico.

###  Caminho Euliriano $vs$ Caminho Hamiltoniano

> **Euliriano:** Caminho que passa por <span style="color: ORANGE">**todas as arestas**</span> de um grafo, de modo a passar em <span style="color: ORANGE">**cada aresta apenas uma vez**</span>.

> **Hamiltoniano:** Caminho que passa em <span style="color: ORANGE">**todos os vértices**</span> de um grafo visitando cada <span style="color: ORANGE">**vértice apenas uma vez**</span>.

$$
E \implies A; \quad 
H \implies V
$$


<span style="color:RED;">**Isso está certo?**</span>

### Grafo Fortemente Conexo

> É um grafo orientado no qual há um caminho entre todos os vértices.



