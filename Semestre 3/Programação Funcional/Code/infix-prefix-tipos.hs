main :: IO()
main = do
    print "HW"
    print $ (+) 5 7
    print $ 8 `f12` 5
    print $ 13 `mod` 5

    print $ pertence 3 [4, 6, 2, 6, 3]
    print $ pertence "Ades" ["Jose", "Carlos"]

    print $ f 2.3
    print $ f 2

    print $ fat 100

    print $ modulo $ -5

    print $ encontra (<0) [3, 4, 2, 5, 6, -8, -3]
    print $ encontra (>100) [3, 4, 2, 5, 6, -8]

encontra :: (a -> Bool) -> [a] -> Maybe a
encontra t [] = Nothing
encontra t (x:xs)
    | t x = Just x
    | otherwise = encontra t xs

-- f12 é prefix, + é infix
f12 x y = x + y

-- Funções: ou letras e números, ou símbolos
-- Se o operador está entre parênteses, ele se torna prefix

-- Eq é uma classe de tipos: os tipos que eu posso fazer comparação
pertence :: (Eq a) => a -> [a] -> Bool
e `pertence` [] = False
e `pertence` (x:xs)
    | e == x = True
    | otherwise = e `pertence` xs


-- Num é uma classe de tipo; Float e Int são instâncias da classe
f :: (Num a) => a -> a
f x = x + 1

-- Integer tem limite maior que Int, é da classe Integral (que compõe todos os inteiros)
fat :: (Integral a) => a -> a
fat 0 = 1
fat n = n * fat (n-1)


modulo :: (Num a, Ord a) => a -> a
modulo x
    | x > 0 = x
    | otherwise = -x

qs :: (Ord a) => [a] -> [a]
qs [a] = [a]


-- Classe Show: tudo aquilo que pode ser transformado numa string
-- Classe Read: poder ser lido
-- Classe Enum: enumerável (dado um valor, sabemos o seu sucessor)
    -- Permite usar a função succ (successor)
-- Classe Bounded: todos os tipos que têm limites
