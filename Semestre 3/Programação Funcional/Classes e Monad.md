# Classes de Tipos

Em falta.


# Monad (Mônada)

* Maybe, IO, []...

Monad trata o contexto de valores. Ele é o que viabiliza o uso do `do`. Por isso, o `main` é tratado como Monad.

```haskell
f :: a -> a
g :: a -> a

(f . g) :: a -> a
```

## IO

O mônada `IO` funciona da seguinte forma: para dar um resultado, é necessária uma ação.

```Haskell
main :: IO()
main = do
    z <- f 7
    print z

f :: Integer -> IO Integer
f x = do
    print "Digite um número: "
    ly <- getLine
    let y = read ly
    return (x + y)
```

## Exemplo

Só pode-se compôr funções se o retorno de uma for o parâmetro da outra.

Isso não é possível:
```haskell
f' :: a -> Maybe a
g' :: a -> Maybe a

-- (f' . g') é inválido
```

Pois `g'` retorna `Maybe a` enquanto `f'` recebe `a`.
* É necessário usar `Just` na função para retornar `Maybe` aquele valor.

# Funções Úteis

## Operador `.*`

Vamos definir um operador que recebe um `Maybe a`, uma função que espera um `a` <u>puro</u> e retorna um `Maybe a` e retorna `Maybe a`.

A função desse operador é assegurar que não haja erro se uma função que recebe `a` puro receber um valor diferente de `a`, como o `Nothing`. Isso acontece porque o operador só direciona a entrada para a função se ela for um `a` puro.

```Haskell
(.*) :: Maybe a -> (a -> Maybe a) -> Maybe a
Nothing .* _ = Nothing
(Just x) .* f = f x
```

## Bind >>= (.* original)

```Haskell
main :: IO()
main = do
    
    -- Garanto que safeInv recebe "a" puro, ou imprimo Nothing
    print (safeInc 5 >>= safeInv)

-- Retorna ivnerso de parâmetro não for 0
safeInv :: (Fractional a, Eq a) => a -> Maybe a
safeInv 0 = Nothing
safeInv x = Just (1/x)

-- Retorna próximo se x < 100
safeInc :: (Num a, Ord a) => a -> Maybe a
safeInc x
    | x >= 100 = Nothing
    | otherwise = Just (x + 1)
```


## Lambda

Abaixo, definimos uma função `lambda` que, dado um `x`, retorna `x*x - x + 1`.

```haskell
(\x -> x*x - x + 1)
```

## Either

* Left
* Right

## Monad Lista

A mônada lista ([]) em Haskell representa computações não-determinísticas, onde uma única entrada pode produzir múltiplas saídas possíveis.

Ela utiliza o operador bind (>>=) para aplicar funções que retornam listas a cada elemento, concatenando os resultados em uma lista plana, agindo como um "contexto" de possibilidades.

