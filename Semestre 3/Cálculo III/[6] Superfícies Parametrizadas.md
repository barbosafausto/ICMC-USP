# Superfícies Parametrizadas

Vamos começar a trabalhar com campos vetoriais em superfícies, também chamados de fluxos.

As funções usuais desta parte serão da forma:
$$
f:\mathbb{R}^2 \to \mathbb{R}^3
$$

i.e., $R^2$ usualmente descreverá alguma característica de uma superfície no espaço $R^3$.

## Plano

Dado o plano:
$$
ax + by + cz + d = 0
$$

A parametrização $f(x, y, z) \to f(u, v)$ é dada por:
$$
x = u \\
y = v \\
z = \frac{-au -bv - d}{c}
$$

Em suma, escolhemos duas variáveis para atribuir a $u$ e $v$ e deduzimos a outra via equação geral.

## Esfera

Dada a esfera:
$$
x^2 + y^2 + z^2 = a^2
$$

A parametrização usual é dada por $f(x, y, z) \to f(\theta, \phi)$
$$
x = a\cos\theta\sin\phi \\
y = a\sin\theta\sin\phi \\
z = a\cos\phi 
$$

⚠️ Note que a única diferença entre essa parametrização e a usada em integrais triplas é que $a$, aqui, é constante.


## Cilindro

O cilindro segue uma lógica parecida com as integrais triplas:

Temos:
$$
x^2 + y^2 = a^2
$$

Parametrizando $f(x, y, z) \to f(\theta, z)$:
$$
x = a\cos\theta \\
y = a\sin\theta \\
z = z
$$

## Cone

Dada a equação do cone:
$$
z^2 = x^2 + y^2 \quad (z \geq 0)
$$

Temos duas formas de parametrizar $f(x, y, z) \to f(u, v)$

<center>

| Forma 1 | Forma 2 |
| --- | --- |
| $x = u$ | $x = r\cos\theta$ |
| $y = v$ | $y = r\sin\theta$ |
| $z = \sqrt{u^2 + v^2}$ | $z = r$ |

</center>

## Plano Tangente

Dizemos que uma superfície é <u>regular</u> se ela admite plano tangente em todos os seus pontos.

Disso isso, o plano tangente é dado por:
$$
X = X_0 + \lambda\gamma_1'(u)+ \mu\gamma_2'(v), \quad \lambda, \mu \in \mathbb{R}
$$

Em que $\gamma'_1(u)$ e $\gamma'_2(v)$ são os vetores tangentes às curvas com $v = v_0$ e $u = u_0$, respectivamente.

Matematicamente:
$$
\gamma_1'(u) = \frac{\partial \gamma}{\partial u}; \quad \gamma_2'(v) = \frac{\partial \gamma}{\partial v}
$$

Note que:
$$
\gamma_1'(u) \times \gamma_2'(v) \neq \vec{0}
$$

Caso contrário, não existe plano tangente à superfície.

## Área de Superfícies

🟢 Nota pessoal: esse tópico é muito elegante, sério! 🥹

### Método 1

Suponha que você tem uma função $f: \mathbb{R^2} \to \mathbb{R^3}$. Vamos fazer a seguinte transformação, que leva um domínio plano $D_{uv}$ a uma superfície $S$ em $D_{xyz}$.
$$
f(u, v) \to f(x(u, v), y(u, v), z(u, v))
$$

Dito isso, queremos a área de uma superfície $S$. Como calculamos essa área a partir das variáveis $u$ e $v$?

> Vamos particionar $D_{uv}$ em retângulos.

A área de uma partição em $D_{uv}$ será $\Delta u\cdot \Delta v$ (os lados os retângulo). Na superfície $S$, esses retângulos serão <distorcidos> em paralelogramos.

Recordando do Teorema do Valor Médio, a área de um desses paralelogramos será dada por:
$$
dA = || (f_u\cdot du)\times (f_v\cdot dv)|| = ||(f_u \times f_v)||dudv
$$

Logo, a área da superfície será a soma de Riemann de todas essas pequenas área. Dito isso, temos a área da superfície:
$$
\boxed{\text{Área}(S) = \int\int_{D_{uv}} ||f_u \times f_v||dudv}
$$

❗A norma deste produto vetorial $||f_u \times f_v||$ atua como o fator de escala (análogo ao Jacobiano) desta transformação. Ela nos diz o quanto a área do retângulo original $dudv$ "esticou" ao ir para o espaço 3D.
### Método 2

Outra forma de calcular a área de uma superfície é usar a sua projeção no plano $xy$ como domínio de integração.

A ideia é análoga:
$$
dA = (f_x \cdot dx) \times (f_y \cdot dy) = (f_x \times f_y)dxdy 
$$
$$
\text{Área}(S) = \int\int_{D_{xy}} (f_x \times f_y)dxdy
$$


A diferença é que sabemos o seguinte:
$$
f_x = \left(1, 0, \frac{\partial z}{\partial x}\right); \quad  

f_y = \left(0, 1, \frac{\partial z}{\partial y}\right); 
$$

Usando o <u>Teorema de Laplace</u> para calcular o produto vetorial:

$$f_x \times f_y = \left( -\frac{\partial z}{\partial x}, -\frac{\partial z}{\partial y}, 1 \right)$$

Concluímos, então, que a área da superfície será dada por:

$$
\boxed{\text{Área}(S) = \int\int_{D_{xy}} \sqrt{1 + \left( \frac{\partial z}{\partial x} \right)^2 + \left( \frac{\partial z}{\partial y} \right)^2 }dxdy}
$$

