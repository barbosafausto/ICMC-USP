# Tipos Customizados e I/O

**Disciplina:** Programação Funcional
**Linguagem:** Haskell

---

## 1. Tipos Customizados (`data` e *Record Syntax*)

Em Haskell, a maneira mais robusta de criar estruturas complexas (semelhantes a `structs` em C ou classes em Java) é usando a **Sintaxe de Registro** (*Record Syntax*). 

```haskell
data Data = Data {
    ano :: Integer,
    mes :: Integer,
    dia :: Integer
} deriving (Show, Read)
```

### 1.1. Os Campos são Funções! (Getters)
A grande mágica do *Record Syntax* é que o compilador transforma cada campo automaticamente em uma função de extração (*getter*).
* `ano` é, na verdade, uma função: `ano :: Data -> Integer`
* Se você tiver um dado `d1 = Data 2026 5 21`, chamar `ano d1` retornará `2026`.

### 1.2. Instanciação Parcial e Perigos
É possível instanciar um tipo preenchendo apenas alguns campos:
```haskell
d4 = Data {ano = 1990}
```
**Atenção:** O Haskell permite isso na compilação, mas se o programa tentar ler ou imprimir (através de `Show`) um campo vazio durante a execução, o programa vai **crashar** (erro de *bottom* ou *undefined*). Use com extrema cautela.

---

## 2. Composição de Funções (`.`)

Nas manipulações de listas (`map`, `filter`), é muito comum encadear operações. O operador ponto `(.)` compõe funções da direita para a esquerda.

```haskell
filter ((>2000) . ano)
```
* **Leitura matemática:** $f(g(x))$. Primeiro aplica a função `ano` para extrair o inteiro. Depois, passa esse inteiro para a função `(>2000)`.

```haskell
-- Encadeamento longo:
filter ((>0) . length . filter (<18) . dependentes)
```
* **Ordem de execução:** 1. Extrai a lista de `dependentes`.
  2. Filtra os menores de 18 anos.
  3. Tira o tamanho (`length`) da lista resultante.
  4. Verifica se é maior que 0.

---

## 3. Ordenação Avançada (`Data.List` e `Data.Ord`)

Para ordenar tipos customizados, usamos `sortBy` no lugar do `sort` tradicional, fornecendo o critério de desempate.

* **`comparing`**: Retorna uma função que, dados dois valores, extrai uma propriedade de ambos e os compara.
  * *Ex:* `sortBy (comparing uf)` (Ordena pela UF).
* **`flip`**: Recebe uma função de dois argumentos e **inverte** a ordem deles. É o truque padrão em Haskell para transformar uma ordenação crescente em **decrescente**.
  * *Ex:* `sortBy (flip (comparing (length . vendas)))` (Ordena quem tem mais vendas primeiro).

---

## 4. Entrada/Saída e Lazy Evaluation

```haskell
h <- openFile "arquivo.txt" ReadMode
l <- hGetContents h
```
* **Lazy I/O:** A função `hGetContents` não joga o arquivo inteiro na memória (RAM) de uma vez. Ela cria uma "promessa". O arquivo só é efetivamente lido linha por linha conforme as funções `map` e `filter` exigem os dados.
* **`read`**: A função inversa do `show`. Ela pega uma `String` formatada exatamente como o tipo e a converte de volta para o objeto em memória.
* **`hClose`**: Fundamental para liberar o arquivo do sistema operacional, mas devido à preguiça do Haskell, deve ser chamado apenas após todos os dados do arquivo terem sido processados.