# Teorema de Gauss

A taxa de uma grandeza que sai de um cubo muito pequeno pode ser descrita pelo seu divergente. Seja $\vec{F} = (P, Q, R)$ o campo vetorial que descreve essa grandeza, o seu divergente é dado por:
$$
\text{div }\vec{F} = \frac{\partial{P}}{\partial x} + \frac{\partial{Q}}{\partial y} + \frac{\partial{R}}{\partial z}
$$

❗Note que o divergente de um campo vetorial é um valor escalar.

⚠️ Para um objeto grande, basta integrar (somar) essa quantidade para vários cubos muito pequenos.

📓 div $= 0 \implies$ campo incompressível. 

Gauss notou que é possível relacionar o divergente de $\vec{F}$ em um objeto <u>fechado</u> no espaço com o fluxo de $\vec{F}$ na superfície $\partial V$, regular por partes, desse objeto (sentido para fora). Matematicamente:
$$
\iiint_{V} \text{div } \vec{F} \text{ } dV = \oiint_{\partial V} \vec{F}\cdot \vec{n} \text{ } dA
$$

De fato, analisar a quantidade $\vec{F}$ que sai de um corpo é analisar o que passa pela sua superfície.

# Teorema de Stokes

O Teorema de Stokes é o análogo em 3D do Teorema de Green. Essencialmente, ele associa a integral de uma superfície aberta $S$ com a integral de linha na fronteira de $S$. 

Matematicamente, mantendo os símbolos que já vimos:
$$
\iint_S \text{rot }\vec{F}\cdot \vec{n} = \oint_{\partial S} Pdx + Qdy + Rdz
$$

Para o teorema ser válido, são necessárias as condições:
* O bordo de $S$ é percorrido somente uma vez.
* $\partial S$ é formado por curvas regulares por partes.
* O sentido correto da curva $\partial S$ segue a regra da mão direita.

❗ Em superfícies fechadas, normalmente $\partial S = \emptyset$.