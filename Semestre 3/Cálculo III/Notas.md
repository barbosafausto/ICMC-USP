# Apresentação da Disciplina

> Prof. Alexandre Nolasco de Carvalho

> Atendimento às terça-feiras (14h - 16h)

🥇<span style="color: GREEN; font-weight: BOLD;"> Interessante estudar pelas listas e combiná-las à apostila que o professor usa.
</span>

## Definição de Integral Dupla

Uma integral dupla consiste na soma de Riemann em 2D:

$$
\int_a^b \Big( \int_c^d f(x, y)dx \Big) dy = \lim_{\Delta x, \Delta y \to 0}\sum_{j=1}^m\Big(\sum_{i=1}^nf(x, y)\Delta x_i\Big) \Delta y_j
$$

### Rede e Malha

* **Rede**: número finito de planos (alguns limitados, outros não) n-1 dimensionais no $R^n$ paralelos aos planos coordenados.

* **Malha**: maior tamanho dos lados dos retângulos que formam a rede.

### Domínio Não-Retangular (2D)

Se o domínio $D$ limitado de uma função não for retangular, podemos circunscrever um retângulo $[a, b] \times [c, d]$ em $D$ e criar uma função auxiliar:

$$
g(x, y) =
\begin{cases}
 f(x, y), \text{ se } (x, y) \in D \\
 0, \text{ se } (x, y) \notin D
\end{cases}
$$

Assim, integramos $g(x, y)$, de modo que:

$$
\int\int_D f(x,y)dA := \int_a^b\int_c^dg(x, y)dxdy
$$

### Conjunto Suave

> Conjunto de volume nulo.

Pense em encaixar a imagem de uma função de $m$ dimensões em outra de $n$ dimensões, com $m < n$.

## Teorema de Fubini

> Caso o domínio $D$ seja tal que um dos eixos depende do outro ($y = g(x)$), deve-se integrar primeiro na variável dependente.

$$
\int\int_D f(x, y)dA = \int_a^b \Big( \int_{g_1(x)}^{g_2(x)} f(x)dy \Big) dx
$$

Assim, fixa-se um $x = x_0 \in [a, b]$ e começa-se integrando no intervalo $[g_1(x_0), g_2(x_0)]$





