# Funções Prefixadas e Infixadas em Haskell

Em Haskell, a forma como chamamos uma função dita se ela é **Prefix** (prefixada) ou **Infix** (infixada). O paradigma funcional possui regras muito elegantes para transitar entre esses dois mundos.

---

## 1. O Padrão da Linguagem
Por padrão, o Haskell divide as operações em duas categorias visuais:
* **Funções Alfanuméricas são Prefixadas:** Funções com nomes normais (como `mod`, `elem`, `take`) vêm *antes* dos argumentos. 
  * *Exemplo:* `mod 10 3`
* **Operadores Simbólicos são Infixados:** Funções criadas apenas com símbolos matemáticos (como `+`, `*`, `==`) vão *no meio* dos argumentos.
  * *Exemplo:* `10 + 3`

---

## 2. Invertendo os Papéis (A Magia do Haskell)
Muitas vezes, ler uma função no meio dos argumentos faz mais sentido para o cérebro humano. O Haskell permite inverter a natureza de qualquer função facilmente:

### Transformando Prefix em Infix (Uso de Crases)
Se você tem uma função alfanumérica e quer usá-la no meio de dois argumentos, basta envolvê-la com **crases** (`` ` ``).
* *Ao invés de:* `elem 5 [1, 2, 3, 4, 5]`
* *Fazemos:* ``5 `elem` [1, 2, 3, 4, 5]`` (Lê-se de forma natural: "5 é elemento da lista?")

### Transformando Infix em Prefix (Uso de Parênteses)
Se você quer passar um operador matemático como argumento para uma Função de Alta Ordem (como `map` ou `foldl`), ou simplesmente quer usá-lo no formato de função tradicional, basta envolvê-lo em **parênteses**.
* *Ao invés de:* `10 + 3`
* *Fazemos:* `(+) 10 3`

---

## 3. Criando Operadores Customizados
No Haskell, você pode inventar seus próprios operadores simbólicos. O compilador tratará qualquer sequência de símbolos válidos (como `<+>`, `|||`, `%%`) como uma função infixada.

```haskell
-- Declarando um operador de Adição Modular
(>%) :: Int -> Int -> Int
x >% y = (x + y) `mod` 1000000007
```

## 4. Fixity: Precedência e Associatividade
Quando criamos operadores, precisamos ensinar ao compilador a ordem de resolução matemática. Fazemos isso com as palavras-chave de **Fixity**:
* `infixl`: Associa à esquerda (ex: `-`, `/`). `10 - 5 - 2` vira `(10 - 5) - 2`.
* `infixr`: Associa à direita (ex: `^`, `$`). `2 ^ 3 ^ 2` vira `2 ^ (3 ^ 2)`.
* `infix`: Não tem associatividade (ex: `==`). Você não pode fazer `1 == 2 == 3` sem parênteses.

**A Precedência** vai de `0` (menor prioridade) a `9` (maior prioridade).
* O operador `*` tem precedência `7` (`infixl 7 *`).
* O operador `+` tem precedência `6` (`infixl 6 +`).
* O operador `$` tem precedência `0` (`infixr 0 $`). É por isso que ele é resolvido por último e substitui os parênteses!