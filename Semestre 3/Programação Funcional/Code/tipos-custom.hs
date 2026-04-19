import GHC.Base (RuntimeRep)
main :: IO()
main = do
    print "HW"
    print $ case f (C 50) of
        Bom -> "Ok"
        MaisOuMenos -> "+/-"
        Ruim -> "Bad"

    print $ f (F 70)

    print $ filter (==Bom) $ map f [C 60, F 100, F 40, C 30, C 10]
    print [C 60, F 100, C 45, F 10]

    print $ F 50 == C 10

-- "Nada" e "Apenas" são construtores
data Talvez a = Nada | Apenas a         
data Temperatura = C Float | F Float
    deriving (Show)
data Clima = Bom | MaisOuMenos | Ruim
    deriving (Show, Eq, Ord, Read) 

-- Colocando o Clima na classe Show
-- instance Show Clima where 
--     show Bom = "Vamos para o Parque"
--     show MaisOuMenos = "Talvez um churrasquinho"
--     show Ruim = "Netflix com certeza"

-- instance Eq Clima where
--     Bom == Bom = True
--     Bom == _ = False
--     _ == Bom = False
--     _ == _ = True

-- instance Show Temperatura where
--     show (C c) = show c ++ "C"
--     show (F f) = show f ++ "F"

instance Eq Temperatura where
   (C c1) == (C c2) = c1 == c2
   (F f1) == (F f2) = f1 == f2
   (C c1) == (F f1) = (5/9)*(f1 - 32) == c1
   (F f1) == (C c1) = (5/9)*(f1 - 32) == c1

f :: Temperatura -> Clima
f (C c) 
    | c > 35 = Ruim
    | c > 20 = MaisOuMenos
    | otherwise = Bom

f (F f) 
    | f > 80 = Ruim
    | f > 50 = MaisOuMenos
    | otherwise = Bom