# Procedimento e Função

## Função

### jal / jr

> jal = jump and link

#### Sintaxe

> jal \<reg>, label

1. Desvia para a label; e
2. Faz \<reg> = PC + 4.

### jr

> jr = jump register

#### Sintaxe

`jr <reg>` -> `jr ra`

1. Faz PC = \<reg> (volta ao endereço de chamada)




### Retorno da Função