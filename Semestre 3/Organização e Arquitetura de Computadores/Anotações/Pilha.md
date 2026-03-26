# Pilha (Stack)

## Empilhar

1. "Reservar" espaço na pilha
    * 3 palavras $\implies$ $3\cdot 4$ bytes
    * `addi sp, sp, -12` | sp: stack pointer

2. Armazenar os valores na pilha
    * `sw ra, 0(sp)`  | word 1
    * `sw, s0, 4(sp)` | word 2
    * `sw, a0, 8(sp)` | word 3

## Desempilhar

1. Ler os conteúdos empilhados
    * `lw s0, 4(sp)`
    * `lw a0, 8(sp)`
    * `lw ra, 0(sp)`


2. Atualizar o stack pointer
    * `addi sp, sp, 12`

