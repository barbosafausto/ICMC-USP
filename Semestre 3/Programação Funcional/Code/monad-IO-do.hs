main :: IO()
main = do
    
    -- Garanto que safeInv recebe "a" puro, ou imprimo Nothing
    print (safeInc 5 >>= safeInv)

    print $ encontra (>5) [3, 2, 7, 8, 4, -2, -4]

    print $ prodPosNeg [3, 4, -2, -5]

    -- Usando função lambda
    print $ map (\x -> x*x - x + 1) [4, 5, 2, 9]

    -- prodPosNeg com bind e lambda
    print $ prodPosNeg' [3, 5, 7, 2]
    print $ prodPosNeg' [3, 5, -7, 2]

    -- prodPosNeg com "do"
    print $ prodPosNeg' [3, 5, 7, 2]
    print $ prodPosNeg' [3, 5, -7, 2]

    -- Monad IO
    z <- f' 7
    print z
    

-- Retorna ivnerso de parâmetro não for 0
safeInv :: (Fractional a, Eq a) => a -> Maybe a
safeInv 0 = Nothing
safeInv x = Just (1/x)

-- Retorna próximo se x < 100
safeInc :: (Num a, Ord a) => a -> Maybe a
safeInc x
    | x >= 100 = Nothing
    | otherwise = Just (x + 1)

-- Encontra em uma lista algo que satisfaz uma função (a -> Bool)
encontra :: (a -> Bool) -> [a] -> Maybe a  
encontra _ [] = Nothing
encontra t (x:xs)
    | t x = Just x
    | otherwise = encontra t xs

-- Procura o primeiro negativo, depois o primeiro positivo da lista
-- Em seguida, imprime o produto
prodPosNeg :: (Num a, Ord a) => [a] -> Maybe a
prodPosNeg l = case encontra (<0) l of
    Nothing -> Nothing
    (Just x) -> case encontra (>0) l of   
        Nothing -> Nothing
        (Just y) -> Just (x * y)


-- Versão usando lambda e bind
prodPosNeg' :: (Num a, Ord a) => [a] -> Maybe a
prodPosNeg' l =
    encontra (<0) l >>= \x -> 
        encontra (>0) l >>= \y -> 
            Just (x * y)
        

-- Equivalente à versão acima
prodPosNeg'' :: (Num a, Ord a) => [a] -> Maybe a
prodPosNeg'' l = do
    x <- encontra (<0) l        -- encontra (<0) l retorna Maybe a; a atribução '<-' retorna a puro
    y <- encontra (>0) l
    Just (x * y)


f l = let n = length l in
    Just (n + 1)


f' :: Integer -> IO Integer
f' x = do
    print "Digite um numero"
    ly <- getLine
    let y = read ly
    return (x + y)
