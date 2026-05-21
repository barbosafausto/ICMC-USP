# Tipos Customizados

```Haskell
main:: IO()
main = do

    print d1
    print $
        map dia $
        filter ((>2000) . ano) $
        d

    -- Abre e lê o arquivo (mas tem lazy)
    h <- openFile "arquivo.txt" ReadMode
    l <- hGetContents h

    let vendedores = processaVendedores l
    print vendedores

    print $ length vendedores

    print $ 
        map nome $ vendedores

    print $ 
        filter ((=="SP") . uf) $ vendedores

    print $ 
        map nome $
        filter ((=="SP") . uf) $ vendedores

    print $ 
        sort $
        map nome $
        filter ((=="SP") . uf) $ vendedores
    
    print $
        map uf $
        sortBy (comparing uf) $
        vendedores
    
    print $
        map aniversario $
        sortBy (comparing (ano . aniversario)) $
        filter ((=="SP") . uf) $
        vendedores

    print $
        map aniversario $
        sortBy (comparing (ano . aniversario)) $
        vendedores

    print $
        sum $
        map sum $       -- map (sum . vendas)
        map vendas $
        vendedores
    
    print $
        map nome $ 
        take 3 $
        -- reverse $ (outra possibilidade)
        sortBy (comparing ((0-) . length . vendas)) $
        vendedores

    print $
        map nome $ 
        take 3 $
        sortBy (flip (comparing (length . vendas))) $
        vendedores

    -- comparing: retorna uma função que, dados dois valores, retorna a comparação deles

    -- flip: recebe uma função que ordena a e b, e inverte a e b

    print $
        map nome $
        filter ((>0) . length . (filter (<18)) . dependentes) $
        vendedores

    -- Fechar depois (lazy)
    hClose h
    

data Data = Data {
    ano :: Integer,
    mes :: Integer,
    dia :: Integer
}
    deriving (Show, Read)

d1 = Data {ano = 2026, mes = 5, dia = 21}

d4 = Data {ano = 1990}
d5 = Data {dia = 1, mes = 2}

d = [d1, d3, d4, d5]

type Idade = Integer
type Venda = Integer

data Vendedor = Vendedor {

    nome :: [Char],
    cpf :: [Char],
    uf :: [Char],
    aniversario :: Data,
    dependentes :: [Idade],
    vendas :: [Venda]
}
    deriving (Show, Read)

processaVendedores :: [Char] -> [Vendedor]
processaVendedores l = map read $ lines l 
-- `read`: converte uma string para um tipo (Vendedor)
-- `lines`: Converte a string em linhas

``` 

## Struct

Os campos da struct são **funções**.
* É possível criar `structs` com campos vazios, porém estes não poderão ser impressos.

## Leitura de Arquivos
