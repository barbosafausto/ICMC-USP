# Teorema de Green

O Teorema de Green relaciona integrais de linha com integrais duplas.

Formalmente, é possível igualar a integral de um campo vetorial sobre a fronteira $\partial D$ de um domínio $D$ à integral do rotacional desse campo em $D$.

Matematicamente, temos o Teorema de Green:
$$
\oint_{\partial D} Pdx + Qdy = \int\int_D \left(\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y} \right)dA
$$

Ou, em notação vetorial:
$$
\oint_{\partial D}\vec{F}d\vec{r} = \int\int_D \text{rot } \vec{(F)}\cdot\vec{k}\text{ }dA
$$

### Nota

Observe que, se $\text{rot }(\vec{F})\cdot\vec{k} = 1$, então $\oint_{\partial D}\vec{F}d\vec{r} = \text{Área}(D)$
## Restrições

O domínio $D$ precisa ser compacto (Fechado e Limitado) e a sua fronteira deve ser composta por uma quantidade finita de curvas:
* Regulares por partes
    * A derivada só pode ser nula em pontos, os quais possuem comprimento nulo.
* Simples
* Disjuntas
* Positivamente orientada
    * No sentido do percursos, o domínio $D$ deve ficar à esquerda;

## Campos Conservativos

O Teorema de Green permite concluir o seguinte:

❗Se o domínio $D$ de um campo é <u>Simplesmente Conexo</u>, vale a implicação:
$$
\text{rot }\vec{F} = \vec{0} \implies \text{O campo é conservativo.}
$$

$D$ é simplesmente conexo se ele não possui buracos. Formalmente, isso ocorre se, para qualquer curva $\gamma \subset D$, pode-se comprimir $\gamma$ a um único ponto e o domínio de $\gamma$ continua contido em $D$.