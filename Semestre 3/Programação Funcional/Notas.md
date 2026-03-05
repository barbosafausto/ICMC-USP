# Disciplina

Prof. Adenilson da Silva Simão

Vamos usar a linguagem <u>Haskell</u>.


## Introdução

> Linguagem funcional é uma linguagem onde as funções realmente são funções no sentido matemático.

Uma grande vantagem da Programação Funcional é o <u>paralelismo</u>. Nesse contexto, podemos executar diferentes instruções de um mesmo código simultaneamente em diferentes *cores* da CPU.

## Haskell

### Tipos e funções

> Haskell trabalha com um único parâmetro. Assim, cada parâmetro retorna uma função, que retorna uma função, que ..., que retorna um número.

```haskell
-- Input
x = 10
:t x
:t "HW"

inc x = x + 1
inc 10
inc 10
:t inc

plus x y = x + y
plus 10 5
:t plus

-- Output
-- x :: Num a => a
-- "HW" :: String

-- 11
-- 11
-- inc :: Num a => a -> a

-- 15
-- plus :: Num a => a -> a -> a
```

### Vetores

```Haskell
-- Input
nums = [1, 2, 3]
:t

nomes = ["Um", "Dois"]
:t

g = map plus nums -- g será um vetor de funções
:t

:t head g

-- Output
-- nums :: Num a => [a]
-- nomes :: [String]
-- g :: Num a => [a -> a] 
-- head g :: Num a => a -> a (veja que é uma função)
```

### Map

O `map` recebe uma função que leva cada elemento de uma lista em outra lista.

```haskell
-- Input

map head nomes
:t map

-- Output
-- "UD"
-- map :: (a -> b) -> ([a] -> [b])
```

### Filter

O `filter` recebe uma função que leva cada elemento de uma lista a ele mesmo dada uma condição.

```haskell
-- Input
filter (>2) nums
:t filter

-- Output
-- [3]
-- filter :: (a -> Bool) -> [a] -> [a]
```

> Map e Filter são usados em *List Comprehension*.
```Haskell
-- Input
[2*x | x <- nums, x > 0]

-- Output
[2, 4, 6]
```