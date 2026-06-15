# Tópicos Avançados em Haskell: Monads, IO e Funções

## 1. Classes de Tipos (Typeclasses)
Uma *Typeclass* é como se fosse uma interface ou um contrato que define um conjunto de comportamentos (funções) que um tipo deve implementar. 
* Se um tipo pertence à classe `Eq`, ele garante que sabe comparar igualdade (`==`, `/=`).
* Se pertence à classe `Show`, garante que sabe se transformar em texto para ser impresso na tela.
* **Sintaxe:** Usamos `=>` para definir restrições de classe em uma assinatura. Exemplo: `soma :: (Num a) => a -> a -> a`.

---

## 2. Monad (Mônada)
Monads são estruturas que lidam com o **contexto** de valores (ex: `Maybe`, `IO`, `[]`, `Either`). Eles são o mecanismo matemático que viabiliza o uso da notação `do` no Haskell. É por isso que a função `main` é tratada como uma Monad (pois ela lida com o contexto de efeitos colaterais).

### O Problema da Composição de Contextos
Na matemática pura, a composição de funções funciona perfeitamente:
```haskell
f :: a -> a
g :: a -> a
(f . g) :: a -> a -- Válido!
```
No entanto, se as funções retornam um contexto (como `Maybe`), a composição direta quebra:
```haskell
f' :: a -> Maybe a
g' :: a -> Maybe a
-- (f' . g') é INVÁLIDO!
```
Isso falha porque `g'` devolve um `Maybe a` (uma caixa), mas `f'` espera receber um `a` puro (o valor fora da caixa). Para encadear essas funções, precisamos do operador **Bind**.

---

## 3. O Operador Bind (`>>=`) e o Operador Customizado (`.*`)

Para resolver o problema da caixa, o Haskell usa o operador Bind (`>>=`). Vamos entender como ele funciona criando a nossa própria versão dele, que chamaremos de `.*`.

### Criando o nosso "Bind" (`.*`)
O papel desse operador é olhar para o `Maybe`: se houver um erro (`Nothing`), ele repassa o erro para frente sem quebrar o programa. Se houver um valor (`Just x`), ele tira o `x` puro da caixa e entrega para a próxima função.

```haskell
(.*) :: Maybe a -> (a -> Maybe a) -> Maybe a
Nothing .* _ = Nothing
(Just x) .* f = f x
```

### Usando o Bind Nativo (`>>=`)
Na prática, usamos o `>>=` da própria linguagem. Ele aplica funções seguras em cascata:
```haskell
-- Garanto que safeInv recebe o "a" puro, ou o encadeamento inteiro aborta e retorna Nothing
print (safeInc 5 >>= safeInv)
```

---

## 4. O Mônada IO
O Monad `IO` funciona da seguinte forma: para que um resultado seja gerado, é necessária a execução de uma ação com o mundo externo (teclado, tela, arquivos). O `<-` é usado para extrair o valor puro de dentro do `IO`.

```haskell
f :: Integer -> IO Integer
f x = do
    putStr "Digite um número: "
    ly <- getLine
    let y = read ly
    return (x + y) -- Coloca o resultado de volta na caixa do IO
```

---

## 5. Funções Úteis

### Lambda (Funções Anônimas)
Funções que não precisam de nome, definidas na hora (inline) com uma barra invertida `\` (que lembra a letra grega $\lambda$).
* Exemplo: `(\x -> x*x - x + 1)`

### Either
Semelhante ao `Maybe` (que só diz se tem algo ou não), o `Either` é usado para tratamentos de erro mais ricos, pois ele diz *o que* deu errado. Ele possui dois construtores:
* `Left`: Usado por convenção para armazenar a mensagem de Erro.
* `Right`: Usado por convenção para armazenar o valor de Sucesso (o resultado "Certo").

### Monad Lista (`[]`)
A mônada lista representa computações **não-determinísticas**, ou seja, cenários onde uma única entrada pode produzir múltiplas saídas possíveis.
Ela utiliza o operador bind (`>>=`) para aplicar funções que retornam listas a cada elemento, concatenando (achatando) os resultados em uma lista plana. É a base das *List Comprehensions*.