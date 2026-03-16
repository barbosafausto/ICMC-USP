# Reuso de Espaço - Abordagem Estática

## Operações

* Inserção de Registros
* Remoção de Registros - remoção lógica 
* Atualização de Registros

A remoção lógica atribui um valor para um campo ou usa um campo extra para sinalizar a remoção. Assim, a remoção é realizada após um tempo $\Delta t$. 
* Até atingir esse tempo, inserções são feitas no final do arquivo.
* Após esse tempo, compactamos o arquivo: deletamos e fazemos shift.


## Algoritmo: busca por RRN

Registro de cabeçalho: próximo RRN.

    Abrir o arquivo p/ leitura
    ler o valor de próximo RRN do registro de cabeçalho

    se RRN < próximo RRN
        então byteoffset <- RRN * tamReg
        posicionar a posição corrente em byte offset
        se o registro não está marcado como removido
            então ler o registro e exibir na saída padrão
            senão registro não encontrado
        
    senão registro não encontrado
    Fechar arquivo

A função de remover é análoga. 

Inserção também: lembrar de incrementar RRN.
    * Importante, se o topo da pilha não for -1, escrever por cima do topo da pilha.

# Reuso de Espaço - Abordagem Dinâmica

## Registros de Tamanho Fixo

1. lista encadeada de registros eliminados
    * lista de RRNs dos registros marcados
    * cabeça da lista no cabeçalho (topo)
    * inserção e reuso do espaço sempre no começo (topo) da lista

Podemos usar uma **pilha** para isso.
* A pilha guarda os RRNs

2. Inserção: no RRN do topo da pilha (desempilha)
3. Remoção: empilha novo RRN
    * O RRN do registro vai à cabeça da pilha, enquanto a cabeça da pilha vai ao registro.