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
\int\int_D f(x, y)dA = \int_a^b \Big( \int_{g_1(x)}^{g_2(x)} f(x, y)dy \Big) dx
$$

Assim, fixa-se o $x$ e começa-se integrando no intervalo $[g_1(x), g_2(x)]$.


## Mudança de Variáveis

> Mudança de variáveis consiste na "melhora" do nosso domínio de integração por meio de um mapeamento entre domínios.

Se temos uma função $f(x, y)$ no domínio $D$, podemos trabalhar num domínio $R$ fazendo o mapeamento:

$$
\phi(u, v)  \to (x(u, v), y(u, v)) \therefore f(\phi(u, v)) = f(x, y)
$$

Essa relação nos faz associar uma partição em $R$ com uma partição em $D$ que não necessariamente possuem a mesma área. Para corrigir esta área, usamos o Jacobiano $(J)$:
$$
\det(J) = 
\begin{vmatrix}
\frac{\partial x}{\partial u} \quad \frac{\partial y}{\partial u} \\
\\
\frac{\partial x}{\partial v} \quad \frac{\partial y}{\partial v}
\end{vmatrix}
$$

De modo que:
$$
\int\int_D f(x, y)dxdy = \int\int_Rf(\phi(u, v))|J|dudv
$$

❗A ideia é análoga para integrais triplas. 

No apêndice A, você pode ver o porquê disso ser verdade.

### Coordenadas Polares

Em coordenadas polares: $(x, y) = (r\cos\theta, r\sin\theta)$, o Jacobiano será:
$$
\boxed{J = r}
$$


## Apêndice A: Jacobiano

### O Problema

Peguemos um retângulo infinitesimal no plano $u \times v$. Esse retângulo tem área $A_r = \Delta u\cdot \Delta v$, mas ele é mapeado de modo distorcido para o plano $x \times y$. Logo, fica o desafio: **como corrigir esta área**?

### A Solução

No plano $x \times y$, $\Delta u$ e $\Delta v$ estão distorcidos de modo a aproximar um paralelogramo.

Para calcular a área do paralelogramo, precisamos aproximar a medida dos seus lados $a$ e $b$:

$$
a = \Big(\frac{\partial x}{\partial u}du, \frac{\partial y}{\partial u}du\Big)(î, ĵ) 

\quad 

b = \Big( \frac{\partial x}{\partial v}dv, \frac{\partial y}{\partial v}dv \Big) (î, ĵ)
$$

Dadas essas aproximações, sabemos que a área será dada pelo módulo do produto vetorial $a \times b$. Calculando o produto vetorial, fica claro que o módulo é dado por:

$$

dA = |det(J)| = ||a \times b|| = |
\begin{vmatrix}
\frac{\partial x}{\partial u} \quad \frac{\partial y}{\partial u} \\
\\
\frac{\partial x}{\partial v} \quad \frac{\partial y}{\partial v}
\end{vmatrix} |
du dv
$$



## Apêndice B: Momento Angular $(M)$

#### Reta

$$
M_{x=x_0} = \sum m_i(x_i - x_0) 
$$

#### Plano

$$
M_{x=x_0} = \int\int_D (x - x_0)\delta(x, y)dA
$$

Em que $\delta(x, y)$ é a densidade superficial no ponto $(x, y)$.

> Idem para $M_{y=y_0}$.


### Centro de Gravidade $(x_G)$

#### Reta

$$
M_{x=x_G} = 0 \implies \sum m_i(x_i - x_G) = 0
$$

$$
\sum x_im_i = x_G\sum m_i \implies \boxed{x_G = \frac{\sum x_im_i}{\sum m_i}}
$$

#### Plano

$$
\boxed{M_{x = x_G} = 0 = M_{y=y_G}}
$$

$$
x_G = \frac{\int\int_D x\cdot\delta(x,y)dA}{\int\int_D \delta(x,y)dA}
$$

> Idem para $y_G$.

> Note, então, que o Centro de Gravidade é o Momento em relação à origem dividido pela Massa.

