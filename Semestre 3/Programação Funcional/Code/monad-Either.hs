main :: IO()
main = do
    print "HW"
    print $ f 5
    print $ f (-1)
    print $ f 0

    case h 5 of 
        Left f -> print f
        Right [] -> print "Nada"
        Right (x:xs) -> print x
    

h :: Int -> Either Float [Int]
h 0 = Left 3.14
h x = Right [-x, x]

-- safeDiv :: (Fractional a, Eq a) => a -> a -> Maybe a
-- safeDiv _ 0 = Nothing
-- safeDiv x y = Just (x/y)

safeDiv :: (Fractional a, Eq a) => a -> a -> Either String a
safeDiv _ 0 = Left "Div por zero"
safeDiv x y = Right (x/y)

-- safeInv :: (Fractional a, Eq a) => a -> Maybe a
-- safeInv 0 = Nothing
-- safeInv x = Just (1 / x)

safeInv :: (Fractional a, Eq a) => a -> Either String a
safeInv 0 = Left "Inv de zero"
safeInv x = Right (1 / x)

f x = do
    a <- safeInv x
    b <- safeDiv a (x + 1)
    let c = a + b
    safeInv (c + 1)

     -- Alternativa
    -- d <- safeInv(c + 1)
    -- return d
    
