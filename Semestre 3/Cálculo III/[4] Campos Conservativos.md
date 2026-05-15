# Campos Conservativos

Para um campo vetorial $\vec{F}$ ser conservativo, ele deve atender a pelo menos 1 dos 3 requisitos <u>equivalentes</u>:

## Requisitos

Para os casos a seguir, $\exists\phi: \mathbb{R}^3 \to \mathbb{R}$. Em que chamamos $\phi$ de <u>potencial</u>.

1. $\vec{\nabla}\phi = \vec{F}$

    * $\vec{F}$ precisa ser o vetor gradiente de alguma função $\phi$.

2. $\int_a^b \langle F(\gamma(t)), \gamma'(t)\rangle dt = \phi(\gamma(b)) - \phi(\gamma(a))$
    * O trabalho do campo vetorial sobre uma curva não depende da curva.

3. $\int_a^b \langle F(\gamma(t)), \gamma'(t)\rangle dt = 0, \text{ se } \gamma(b) = \gamma(a)$
    * O trabalho do campo vetorial é nulo em qualquer curva fechada.
    * Nota: a integral acima pode ser reescrita como: 
    $$
    \oint_\gamma \vec{F}d\vec{r} = 0
    $$
    
