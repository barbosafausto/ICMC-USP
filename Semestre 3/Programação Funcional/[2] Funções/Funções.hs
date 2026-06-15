-- Define a precedência e associatividade do nosso operador customizado
-- Queremos que ele tenha a mesma prioridade da soma normal (nível 6) e avalie da esquerda para a direita.
infixl 6 >%

-- Criando um operador customizado: Adição Modular (Mod 10^9 + 7)
-- Os parênteses na assinatura indicam que estamos definindo um operador Infix.
(>%) :: Int -> Int -> Int
a >% b = (a + b) `mod` 1000000007

-- Função normal para cálculo de pitágoras (espera ser chamada como Prefix)
pitagoras :: Float -> Float -> Float
pitagoras cateto1 cateto2 = sqrt (cateto1^2 + cateto2^2)


main :: IO ()
main = do
    putStrLn "=== 1. PREFIX PARA INFIX (CRASES) ==="
    let restoNormal = mod 10 3
    let restoInfix = 10 `mod` 3
    putStrLn $ "mod 10 3 = " ++ show restoNormal
    putStrLn $ "10 `mod` 3 = " ++ show restoInfix

    -- Usando nossa função pitagoras de forma elegante
    putStrLn $ "Hipotenusa (3 e 4): " ++ show (3 `pitagoras` 4)

    putStrLn "\n=== 2. INFIX PARA PREFIX (PARENTESES) ==="
    let somaInfix = 10 + 5
    let somaPrefix = (+) 10 5
    putStrLn $ "10 + 5 = " ++ show somaInfix
    putStrLn $ "(+) 10 5 = " ++ show somaPrefix

    -- O poder real de transformar Infix em Prefix: Passar para Funções de Alta Ordem
    let multiplicados = map (* 2) [1, 2, 3, 4] 
    let somaLista = foldl (+) 0 [1, 2, 3, 4]
    putStrLn $ "Dobrando lista com (* 2): " ++ show multiplicados
    putStrLn $ "Somando lista com (+): " ++ show somaLista

    putStrLn "\n=== 3. OPERADOR CUSTOMIZADO ==="
    let numeroGigante = 1000000000 >% 15
    putStrLn $ "1000000000 >% 15 = " ++ show numeroGigante