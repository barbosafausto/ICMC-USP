-- Arquivo Executável 

-- Aqui está o código para você rodar no seu terminal. Coloquei tudo dentro do `main` usando `print` para que você possa ver a saída das funções de forma idêntica ao que você via no GHCi (modo interativo).

-- ==========================================
-- DISCIPLINA: Programação Funcional
-- SCRIPT DE TESTE: Introdução e Conceitos
-- ==========================================

-- 1. Definição de funções puras
inc :: Num a => a -> a
inc x = x + 1

plus :: Num a => a -> a -> a
plus x y = x + y

main :: IO ()
main = do
    putStrLn "=== 1. Testando Tipos e Funcoes ==="
    let x = 10
    putStrLn $ "Valor de x: " ++ show x
    putStrLn $ "inc 10: " ++ show (inc 10)
    putStrLn $ "plus 10 5: " ++ show (plus 10 5)
    
    putStrLn "\n=== 2. Listas e Listas de Funcoes ==="
    let nums = [1, 2, 3]
    let nomes = ["Um", "Dois"]
    
    putStrLn $ "Lista nums: " ++ show nums
    putStrLn $ "Lista nomes: " ++ show nomes
    
    -- Criando uma lista de funções (Avaliação parcial)
    -- g é uma lista onde o 1º elemento é (plus 1), o 2º é (plus 2), etc.
    let g = map plus nums 
    
    -- Pegando a primeira função da lista (plus 1) e aplicando ao número 10
    let primeiraFuncao = head g
    putStrLn $ "(head g) aplicado ao valor 10: " ++ show (primeiraFuncao 10)
    
    putStrLn "\n=== 3. Map ==="
    -- head pega o primeiro elemento de uma lista. 
    -- Como String é lista de Char, 'head' pega a primeira letra.
    let iniciais = map head nomes 
    putStrLn $ "map head nomes: " ++ show iniciais
    
    putStrLn "\n=== 4. Filter ==="
    let filtrados = filter (>2) nums
    putStrLn $ "filter (>2) nums: " ++ show filtrados
    
    putStrLn "\n=== 5. List Comprehension ==="
    let comp = [2 * n | n <- nums, n > 0]
    putStrLn $ "[2*n | n <- nums, n > 0]: " ++ show comp