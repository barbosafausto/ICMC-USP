# Fluxo

Dados o campo vetorial $\vec{F}(x, y, z)$ e uma superfície $S$ ($S \subset dom(\vec{F}$)) regular, orientável e orientada por um campo vetorial $\vec{n}$, em que $\vec{n}$ é o versor que representa uma das duas possíveis orientações da superfície, define-se **Fluxo de $F$ através de $S$**:
$$
\int\int_S \langle \vec{F},\vec{n} \rangle \text{ } dA =

\int\int_{D_{uv}} \langle \vec{F}, \frac{\vec{\gamma}_u \times \vec{\gamma}_v}{||\vec{\gamma}_u \times \vec{\gamma}_v||} \rangle ||\vec{\gamma}_u \times \vec{\gamma}_v|| dudv
$$
$$
\therefore \boxed{\int\int_{D_{uv}} \langle \vec{F}, \vec{\gamma}_u \times \vec{\gamma}_v \rangle dudv}
$$

⚠️ A dedução é análoga à de integrais de linha, em que queremos calcular a componente de $\vec{F}$ paralela a $\vec{n}$ no domínio de interesse. 

⚠️ O módulo de $\vec{\gamma}_u \times \vec{\gamma}_v$ representa o fator de correção (análogo do Jacobiano) da transformação $f(x, y, z) \to f(u, v)$.

## Notação Alternativa

O integrando $\langle F, \vec{\gamma}_u \times \vec{\gamma}_v \rangle dudv$ pode ser reescrito em termos de $(x ,y ,z)$:

$$
\vec{\gamma}_u \times \vec{\gamma}_v = \left(

\begin{vmatrix}
\frac{\partial y}{\partial u} \quad \frac{\partial z}{\partial u}
\\
\\
\frac{\partial y}{\partial v} \quad \frac{\partial z}{\partial v} \\

\end{vmatrix}
,

-
\begin{vmatrix}
\frac{\partial x}{\partial u} \quad \frac{\partial z}{\partial u}
\\
\\
\frac{\partial x}{\partial v} \quad \frac{\partial z}{\partial v} \\

\end{vmatrix}

,

\begin{vmatrix}
\frac{\partial x}{\partial u} \quad \frac{\partial y}{\partial u}
\\
\\
\frac{\partial x}{\partial v} \quad \frac{\partial y}{\partial v} \\

\end{vmatrix}

\right)
$$

$$
\vec{\gamma}_u \times \vec{\gamma}_v = (dy \wedge dz, dz \wedge dx, dx \wedge dy)
$$

Logo, a integral fica com a forma:
$$

\boxed{\int\int_S P(dy \wedge dz) + Q(dz \wedge dx) + R(dx \wedge dy)}
$$


## Campo $\vec{F} = \frac{\vec{r}}{r^3}$

Similar ao campo $d\theta$, esse campo tem fluxo constante em superfícies fechadas. Ele não depende da superfície.

Vamos calcular o seu fluxo na superfície $S$ da esfera:
$$
x^2 + y^2 + z^2 = r^2
$$

Logo, como o vetor normal a $S$ corresponde ao vetor radial:
$$
\oiint_S \vec{F}\cdot \hat{n}\text{ } ds = \oiint_S \frac{\vec{r}}{r^3}\cdot \frac{\vec{r}}{r} \text{ }ds = \oiint_S \frac{r^2}{r^4}\cdot \text{ }ds = \frac{1}{r^2}\oiint_S ds 
$$

Como a integral dupla de $f(x) = 1$ em uma superfície é a área da superfície,
$$
= \frac{1}{r^2}\cdot 4\pi r^2 = \boxed{4\pi}
$$

⚠️ Importante: div $\vec{F}$ = 0.
* Depois, vamos ver que esse campo tem fluxo nulo se a superfície não envelopar a origem.
* Acabamos de ver a definição de ângulo sólido. 🆒




