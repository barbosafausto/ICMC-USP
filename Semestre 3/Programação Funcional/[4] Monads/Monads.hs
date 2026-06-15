-- ==========================================
-- 1. OPERADOR BIND CUSTOMIZADO E FUNÇÕES
-- ==========================================

-- Definimos o nosso próprio operador Bind
(.*) :: Maybe a -> (a -> Maybe a) -> Maybe a
Nothing .* _ = Nothing
(Just x) .* f = f x

-- Função que calcula o inverso (falha se for 0)
safeInv :: (Fractional a, Eq a) => a -> Maybe a
safeInv 0 = Nothing
safeInv x = Just (1/x)

-- Função que incrementa (falha se for >= 100)
safeInc :: (Num a, Ord a) => a -> Maybe a
safeInc x
    | x >= 100 = Nothing
    | otherwise = Just (x + 1)


-- ==========================================
-- 2. FUNÇÃO IO ISOLADA
-- ==========================================

-- Pede um número no terminal, soma com x, e devolve dentro do IO
funcaoIO :: Integer -> IO Integer
funcaoIO x = do
    putStrLn ("Digite um numero para somar com " ++ show x ++ ":")
    ly <- getLine
    let y = read ly
    return (x + y)


-- ==========================================
-- 3. FUNÇÃO MAIN UNIFICADA PARA TESTES
-- ==========================================

main :: IO()
main = do
    putStrLn "=== TESTE 1: BIND CUSTOMIZADO (.*) ==="
    -- 5 vira 6, inverso de 6 é 0.1666...
    print $ Just 5 .* safeInc .* safeInv  
    
    -- 100 falha no safeInc, então a cadeia inteira já retorna Nothing
    print $ Just 100 .* safeInc .* safeInv 

    putStrLn "\n=== TESTE 2: BIND NATIVO (>>=) ==="
    print (safeInc 5 >>= safeInv)
    print (safeInc 100 >>= safeInv)

    putStrLn "\n=== TESTE 3: FUNCOES LAMBDA ==="
    -- Aplicando um lambda diretamente no valor 5
    let resultadoLambda = (\x -> x*x - x + 1) 5
    putStrLn $ "Resultado do lambda para x=5: " ++ show resultadoLambda

    putStrLn "\n=== TESTE 4: MONAD LISTA ==="
    -- O bind pega cada elemento e gera duas possibilidades, depois achata tudo.
    let listaNaoDeterministica = [1, 2, 3] >>= (\x -> [x, x*10])
    putStrLn $ "Lista processada com Bind: " ++ show listaNaoDeterministica

    putStrLn "\n=== TESTE 5: MONAD IO ==="
    -- Testando o fluxo de IO do seu exemplo
    z <- funcaoIO 7
    putStrLn $ "O resultado da operacao IO foi: " ++ show z