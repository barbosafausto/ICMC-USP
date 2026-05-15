# Integrais de Linha

## Parametrização

Exemplo clássico: circunferência.

Equação geral:
$$
(x - x_0)^2 + (y - y_0)^2 = r^2  
$$

Parametrização:
$$
\gamma(t) = (x_0 + r\cos t, y_0 + r\sin t) \text{ (sentido anti-horário)}\\
$$

Generalização de uma parametrização de $\mathbb{R}^3$:
$$ 
\gamma(t) = (x(t), y(t), z(t))
$$

## Reta Tangente a uma Curva

O vetor direcional da reta é a própria derivada da curva $\gamma(t)$. Dito isso, a reta será dada por:

$$
X = \gamma(t_0) + \lambda\gamma'(t), \lambda \in \mathbb{R}
$$


## Definições

1. Uma <u>curva regular</u> num domínio $[a, b]$ é uma curva em que $\gamma'(t) \neq \vec{0}, \forall t \in [a, b]$.

2. Um <u>ponto múltiplo</u> é um ponto da curva tal que $\gamma(t_1) = \gamma(t_2)$. Em outras palavras, um ponto múltiplo é imagem de múltiplos valores de $t$.

3. Uma <u>curva fechada</u> no domínio $[a, b]$ é tal que $\gamma(a) = \gamma(b)$.

4. Uma <u>curva simples</u> não pontos múltiplos.

5. Uma <u>curva fechada simples</u> possui apenas 1 ponto múltiplo: $\gamma(a) = \gamma(b)$.

## A Integral de Linha

Dada uma curva, é possível traçar uma corda entre dois pontos $a$ e $b$ da curva para obter uma aproximação do comprimento dela.

O comprimento da corda será, usando o Teorema do Valor Médio:

$$
\vec{s} = (x(t) - x(t_0), y(t) - y(t_0)) \Rightarrow \vec{s} = (x'(\bar{t_1})\Delta t, y'(\bar{t_2})\Delta t)
$$ 


Logo, teremos:

$$
s = ||\gamma'(\bar{t})||\Delta t
$$

Veja que pegamos o módulo de $\gamma'(\bar{t})$, pois queremos o módulo da corda (seu comprimento).


Dessa maneira, é possível que somemos todas essas cordas:

$$
S = \sum_{i=1}^n ||\gamma'(t_i)||\Delta t_i
$$

Nesse caso, no limite em que $\Delta t \to 0$, o comprimento das cordas tenderão à se aproximar cada vez mais ao da curva. Logo, a seguinte Integral de Linha descreve o comprimento da curva $\gamma(t)$:


$$
\boxed{\int_a^b ||\gamma'(t)||dt}
$$

Em que $t \in [a, b]$.


## Integrais de Linha de Campo

### Funções $f: R^2 \to R^2  \text{ } (R^3 \to R^3)$

Podemos definir um campo vetorial através de uma função da seguinte forma:
$$
f(x, y) = (-y, x) \implies \text{Exemplo: } f(2, 3) = (-3, 2)
$$

Em suma, no plano cartesiano, temos o vetor $(-3, 2)$ cuja origem está em $(2, 3)$. 

### Vetor radial

Definimos o vetor radial $\vec{r}$ como a distância de um ponto à origem. Desse modo:
$$
\vec{r} = r(x, y) = x\hat{i} + y \hat{i} \\ \therefore ||\vec{r}|| = \sqrt{x^2 + y^2}
$$

### Rotacional de um Campo

⚠️ Simplificando o conceito: a rotacional de um campo vetorial mede a tendência de rotação (em torno de si próprio) de um corpo extenso submetido a este campo.

Dada a função a seguir, que define um campo vetorial:
$$
\vec{F}(x, y, z) = (P(x, y ,z), Q(x, y, z), R(x, y, z))
$$

A rotacional de $\vec{F}$ é dada por:
$$
rot(\vec{F}) = 
\begin{vmatrix}
\hat{i} & \hat{j} & \hat{k} \\

\\

\frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\

\\

P & Q & R

\end{vmatrix} 
$$

Cuja resolução pode ser obtida através do <u>Teorema de Laplace</u>.

❗Em 2D, $R(x, y, z) = 0$. 

#### Campo em $\mathbb{R}^2$

Vale resssaltar que a rotacional de um campo vetorial num plano leva a um campo perpendicular ao plano. 


### Trabalho de um Campo

Para equacionar o trabalho de um campo vetorial, vamos usar o conceito de trabalho:
$$
\tau = \int_{\gamma} \vec{F}d\vec{r} 
$$

Dito isso, o trabalho do campo em cada trecho da curva $\gamma(t)$ será o produto da projeção de $\vec{F}$ na direção de $\gamma'(t)$ pelo comprimento do trecho.

Matematicamente:
$$
\tau = \int_a^b \langle F(\gamma(t)), \frac{\gamma'(t)}{||\gamma'(t)||} \rangle \cdot ||\gamma'(t)||dt
$$

Como escalares podem entrar no produto escalar, podemos cancelar $||\gamma'(t)||$. Como isso, temos a conclusão para o trabalho de um campo vetorial:

$$
\boxed{\tau = \int_a^b \langle F(\gamma(t)), \gamma'(t) \rangle dt}
$$

Essencialmente, isso significa que precisamos integrar o produto escalar no intervalo $[a, b]$ para obter o trabalho $\tau$, não havendo a necessidade de usarmos o versor $\frac{\gamma'(t)}{||\gamma'(t)||}$.

#### Notação Alternativa

É possível que uma questão apresente o trabalho de um campo através de uma integral diferente, mas que representa a mesma coisa.

Suponha que $\vec{F} = (P, Q, R)$ e $\gamma'(t) = (x', y', z')$. Uma notação correta para $\tau$ poderia ser desenvolvida da seguinte forma:
$$
\tau = \int_a^b (P, Q, R)\cdot (x', y', z') dt
$$
$$
\tau = \int_a^b (Px'dt + Qy'dt + Rz'dt)
$$

Sabemos que $x'dt = dx$, pois $x'$ é a derivada em $t$. Com isso, temos o que procuramos:
$$
\boxed{\tau = \int_\gamma (Pdx + Qdy + Rdz)}
$$

#### Campo Vetorial $d\theta$

A integral a seguir representa o trabalho do campo vetorial $d\theta$:
$$
\int_\gamma \frac{-y}{x^2 + y^2}dx + \frac{x}{x^2 + y^2}dy
$$

Note que essa é a integral do trabalho da força $\vec{F}(x, y) = (\frac{-y}{r^2}, \frac{x}{r^2})$, em que $r^2 = x^2 + y^2$, numa curva específica $\gamma(t)$.


Esse campo é muito importante porque ele permite concluir o seguinte: 
* Em <u>Campos Conservativos</u>, a integral de linha do campo em uma curva fechada deve ser zero. 
* Todavia, não pode-se dizer que, se o rotacional de um campo é zero, então ele é conservativo. O campo vetorial $d\theta$ é o contra-exemplo disso.


# Apêndice A: Densidade Linear

Se temos uma função que descreve a densidade linear de uma curva, podemos calcular a sua massa $M$ a partir da integral de linha da curva aplicada à densidade:

$$
M = \int_C \delta(x, y, z)ds = \int_a^b \delta (\gamma(t))||\gamma'(t)|| dt
$$

Note que $ds$ é o diferencial do comprimento de um arco da curva. Nesse sentido, estamos somando as massas de cada pequeno arco da curva.


# Apêndice B: $||\gamma(\theta)||$

Neste apêndice, vamos calcular o comprimento de uma curva descrita em coordenadas polares.

Em suma, se a curva é descrita pela equação $r = f(\theta)$, como podemos calcular o seu comprimento?

[Em breve.]