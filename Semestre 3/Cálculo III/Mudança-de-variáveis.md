# Coordenadas Polares

## Círculo

Além do caso usual em que fazemos:

$$
x = r\cos\theta \\
y = r\sin\theta 
$$

Se o domínio de integração for da forma:

$$
x² + y² = a²
$$

Podemos fazer (verifique):

$$
x = ar\cos\theta \\
y = ar\sin\theta
$$

Que também funciona, considerando os seguintes limites de integração:
$$
\int\int_Df(x, y)dxdy = \int_0^{2\pi}\int_0^1f(r, \theta)\cdot a^2r\cdot drd\theta
$$

Note que o módulo do jacobiano é $|J| = a^2r$. Verifique através da definição.

## Elipse

Se o domínio for da forma:
$$
\frac{x^2}{a^2} + \frac{y^2}{b^2} = 1
$$

Podemos fazer:

$$
x = ar\cos\theta \\
y = br\sin\theta
$$

A ideia é analága aqui, com o jacobiano sendo:
$$
|J| = abr
$$

## Círculo Transladado

### Mudança com Translação

Dado o domínio:

$$
(x - x_0)^2 + (y - y_0)^2 = a^2
$$

Como o círculo está translado, pode ser útil fazer:

$$
x = x_0 + r\cos\theta \\
y = y_0 + r\sin\theta
$$

Nesse caso, veja que o jacobiano não muda.


### Mundança com Translação

Se a função $f(x, y)$ envolver raízes, pode não ser muito útil fazer uma translação na mudança de coordenadas.

#### Exemplo

Domínio: $x^2 + (y - a)^2 = a^2$

Função: $f(x, y) = \sqrt{4a^2 - (x^2 + y^2)}$

Teremos $x = r\cos\theta$. Veja a diferença entre as opções:

1. $y = a + r\sin\theta$

Nesse caso, teremos

$$
\int_0^{2\pi}\int_0^a  \sqrt{4a^2 - (r\cos\theta + a + r\sin\theta)^2}\cdot r\cdot drd\theta
$$

Isso não é trivial.

2. $y = r\sin\theta$

Aqui, o intervalo de $\theta$ e $r$ vai mudar, pois não estamos mais no centro de coordenadas (use o *desmos* como auxílio):

$\theta \in [0, \pi]$, pois o círculo está no primeiro e segundo quadrantes.

Além disso

$$
r^2\cos^2\theta + (r\sin\theta - a)^2 = a^2 \implies \boxed{r = 2a\sin\theta}
$$

Logo, teremos:

$$
\int_0^{\pi}\int_0^{2a\sin\theta}\sqrt{4a^2 - r^2}\cdot r \cdot drd\theta
$$

Veja que temos $r^2$ na raiz e $r$ fora da raiz, o que torna esta integral dupla muito mais tranquila.



