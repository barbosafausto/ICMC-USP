# Disciplina: Programação Funcional
**Professor:** Adenilson da Silva Simão
**Linguagem:** Haskell

---

## 1. Introdução à Programação Funcional

Uma **linguagem funcional** é aquela onde as funções na programação se comportam como funções no sentido estrito e matemático. Isso significa que, para uma mesma entrada, a função sempre retornará a mesma saída, sem causar "efeitos colaterais" (como alterar variáveis globais ou imprimir na tela de forma descontrolada).

### O Poder do Paralelismo
Uma das maiores vantagens da Programação Funcional é a facilidade de implementar **paralelismo**. Como não existem variáveis mutáveis (os dados não mudam de valor depois de criados), não há "condição de corrida" (*race conditions*). Nesse contexto, podemos executar diferentes instruções de um mesmo código simultaneamente em diferentes *cores* da CPU com total segurança, pois uma função não corre o risco de alterar um dado que outra função está lendo.

---

## 2. Haskell: Conceitos Fundamentais

### 2.1. Currying e Avaliação Parcial (Tipos e Funções)

> **Regra de Ouro:** Em Haskell, toda função recebe **apenas um único parâmetro**. 

Quando criamos uma função que parece receber dois parâmetros, na verdade ocorre um processo chamado **Currying**. A função recebe o primeiro parâmetro e retorna *uma nova função* que espera o segundo parâmetro, que então retorna o resultado.

```haskell
-- Exemplo de Tipos
x = 10
-- :t x  =>  Num a => a

-- "HW"
-- :t "HW" => String (que é uma lista de caracteres: [Char])

-- Função com 1 argumento
inc x = x + 1
-- :t inc => Num a => a -> a
-- Lê-se: recebe um número 'a' e retorna um número 'a'

-- Função com 2 argumentos (Currying na prática)
plus x y = x + y
-- :t plus => Num a => a -> a -> a
-- Lê-se: recebe um 'a', retorna uma função (a -> a). Essa nova função recebe outro 'a' e devolve o 'a' final.
```

### 2.2. Listas (Vetores)

Em Haskell, usamos Listas Encadeadas para agrupar elementos. Todos os elementos de uma lista devem ser do mesmo tipo.

```Haskell
nums = [1, 2, 3]
-- :t nums => Num a => [a]

nomes = ["Um", "Dois"]
-- :t nomes => [String]
```
Podemos criar listas de funções usando avaliação parcial:

```Haskell
g = map plus nums 
-- g será uma lista de funções, onde cada função soma um número da lista 'nums'
-- :t g => Num a => [a -> a] 
-- :t head g => Num a => a -> a (a primeira função da lista, que seria o equivalente a (plus 1))
```

## 3. Funções de Alta Ordem (Higher-Order Functions)
Funções de Alta Ordem são funções que recebem outras funções como parâmetro ou retornam funções.

###  3.1. Map
O map recebe uma função e uma lista, e aplica essa função a todos os elementos da lista, retornando uma lista nova com os resultados.

```Haskell
map head nomes
-- Retorna: "UD" (Pois uma String em Haskell é uma lista de caracteres [Char], então o resultado é ['U', 'D'])
-- :t map => (a -> b) -> [a] -> [b]
```

### 3.2. Filter
O filter recebe uma função condicional (que retorna um Booleano) e uma lista. Ele testa cada elemento e retorna uma nova lista apenas com os elementos que passaram no teste (True).

```Haskell
filter (>2) nums
-- Retorna: [3]
-- :t filter => (a -> Bool) -> [a] -> [a]
```

## 4. List Comprehension (Compreensão de Listas)
É uma sintaxe baseada na notação matemática de conjuntos para criar listas poderosas de forma concisa. Ela combina mapeamento e filtragem de forma nativa.

**Sintaxe geral**: `[ Expressão | Gerador, Condições ]`

```Haskell
[2*x | x <- nums, x > 0]
-- Lê-se: "A lista de (2 vezes x), tal que 'x' é retirado da lista 'nums', e 'x' é maior que 0."
-- Retorna: [2, 4, 6]
```