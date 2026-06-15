import System.IO
import Data.List (sort, sortBy)
import Data.Ord (comparing)

-- ==========================================
-- 1. DECLARAÇÃO DE TIPOS
-- ==========================================

data Data = Data {
    ano :: Integer,
    mes :: Integer,
    dia :: Integer
} deriving (Show, Read)

type Idade = Integer
type Venda = Integer

data Vendedor = Vendedor {
    nome :: [Char],
    cpf :: [Char],
    uf :: [Char],
    aniversario :: Data,
    dependentes :: [Idade],
    vendas :: [Venda]
} deriving (Show, Read)

-- ==========================================
-- 2. FUNÇÕES AUXILIARES
-- ==========================================

processaVendedores :: [Char] -> [Vendedor]
processaVendedores l = map read $ lines l 
-- `read`: converte uma string para o tipo Vendedor (exige que a string esteja no formato exato)
-- `lines`: quebra o blocão de texto em uma lista de strings (uma por linha)

-- Função auxiliar que cria um arquivo falso apenas para o teste rodar
criaArquivoMock :: IO ()
criaArquivoMock = do
    let v1 = Vendedor "Carlos" "111" "SP" (Data 1985 5 12) [10, 15] [100, 200, 50]
    let v2 = Vendedor "Ana" "222" "RJ" (Data 1992 8 21) [5] [500, 100]
    let v3 = Vendedor "Beatriz" "333" "SP" (Data 1980 1 10) [20, 22] [300, 300, 300, 300]
    let v4 = Vendedor "Zeca" "444" "MG" (Data 1995 12 5) [] [10, 20]
    let conteudo = unlines [show v1, show v2, show v3, show v4]
    writeFile "arquivo.txt" conteudo

-- ==========================================
-- 3. FUNÇÃO PRINCIPAL (MAIN)
-- ==========================================

main :: IO ()
main = do
    putStrLn "=== CRIANDO ARQUIVO MOCK ==="
    criaArquivoMock
    
    putStrLn "\n=== TESTES COM O TIPO 'DATA' ==="
    let d1 = Data {ano = 2026, mes = 5, dia = 21}
    let d2 = Data {ano = 2010, mes = 1, dia = 10}
    let d = [d1, d2]
    
    print d1
    putStrLn "\nDias das Datas com ano > 2000:"
    print $ map dia $ filter ((>2000) . ano) $ d

    -- Nota sobre instanciação parcial: 
    -- d4 = Data {ano = 1990}
    -- Se tentarmos imprimir 'd4' inteiro ou acessar 'dia d4', o programa crasha!

    putStrLn "\n=== LEITURA DE ARQUIVO E MANIPULACAO ==="
    -- Abre e lê o arquivo (avaliação preguiçosa / lazy IO)
    h <- openFile "arquivo.txt" ReadMode
    l <- hGetContents h

    let vendedores = processaVendedores l
    
    putStrLn "\nTodos os Vendedores:"
    print vendedores

    putStrLn "\nQuantidade de Vendedores:"
    print $ length vendedores

    putStrLn "\nNome de todos os vendedores:"
    print $ map nome vendedores

    putStrLn "\nObjetos Vendedor apenas de SP:"
    print $ filter ((=="SP") . uf) vendedores

    putStrLn "\nNomes dos vendedores de SP:"
    print $ map nome $ filter ((=="SP") . uf) vendedores

    putStrLn "\nNomes dos vendedores de SP (Em ordem alfabetica):"
    print $ sort $ map nome $ filter ((=="SP") . uf) vendedores
    
    putStrLn "\nEstados (UFs) ordenados agrupados (ordenando a lista baseada na UF):"
    print $ map uf $ sortBy (comparing uf) vendedores
    
    putStrLn "\nDatas de aniversario ordenadas pelo ANO (apenas de vendedores de SP):"
    print $ map aniversario $ sortBy (comparing (ano . aniversario)) $ filter ((=="SP") . uf) vendedores

    putStrLn "\nSoma total de TODAS as vendas da empresa:"
    print $ sum $ map sum $ map vendas vendedores
    
    putStrLn "\nTop 3 Vendedores com MAIOR QUANTIDADE de vendas (decrescente usando ((0-) . length)):"
    print $ map nome $ take 3 $ sortBy (comparing ((0-) . length . vendas)) vendedores

    putStrLn "\nTop 3 Vendedores com MAIOR QUANTIDADE de vendas (decrescente usando flip):"
    print $ map nome $ take 3 $ sortBy (flip (comparing (length . vendas))) vendedores

    putStrLn "\nVendedores que possuem filhos menores de 18 anos:"
    print $ map nome $ filter ((>0) . length . filter (<18) . dependentes) vendedores

    -- Fechar o arquivo (sempre por último devido ao Lazy IO)
    hClose h