# Apresentação da Disciplina

> Prof. Alexandre Nolasco de Carvalho

> Atendimento às terça-feiras (14h - 16h)

🥇<span style="color: GREEN; font-weight: BOLD;"> Interessante estudar pelas listas e combiná-las à apostila que o professor usa.
</span>

## Definição de Integral Dupla

Uma integral dupla consiste na soma de Riemann em 2D:

$$
\int_a^b \Big( \int_c^d f(x, y)dx \Big) dy = \sum_{j=1}^n\Big(\sum_{i=1}^nf(x, y)\Delta x_i\Big) \Delta y_j
$$

## Teorema de Fubini

> Caso o domínio $D$ seja tal que um dos eixos depende do outro ($y = g(x)$), deve-se integrar primeiro na variável independente.

$$
\int\int_D f(x)dx = \int_a^b \Big( \int_{g_1(x)}^{g_2(x)} f(x)dy \Big) dx
$$

Assim, fixa-se um $x = x_0 \in [a, b]$ e começa-se integrando no intervalo $[g_1(x_0), g_2(x_0)]$
