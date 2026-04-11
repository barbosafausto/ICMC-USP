# Tipos das Instruções

> RV32I, 6 tipos.

* **opcode**: 7 bits
* **registradores**: 5 bits
* **f3**: 3 bits; **f7**: 7 bits
    * Agem na Unidade de Controle da ULA
* **imm**: 12 ou 20 bits


## R: Register

`<add> <rd>, <rs1>, <rs2>`

[f7 | rs2 | rs1 | f3 | rd | opcode]

Todas as instruções do tipo R possuem o opcode `0110011`: `33`


## I: Immediate

`lw <rd>, imm(<rs1>)`

[imm | rs1 | f3 | rd | opcode]

opcode: `0000011`: `3`


## S: Store

`sw <rs2>, imm(<rs1>)`

[imm | rs2 | rs1 | f3 | imm | opcode]

opcode: `01000111`: 4 7


## B: Branch

`beq <rs1>, <rs2>, imm`

[imm | rs2 | rs1 | f3 | imm | opcode]

A arquitetura soma `imm` ao endereço do `PC` para fazer o jump.

O `imm` tem 12 bits, nesta ordem: [12][10..5] ... [4..1][11]
* Branches pulam half-words em RISC-V, por isso o bit 0 é 0.



## U: Upper

`lui <rd>, imm`

[imm | rd | opcode]

## J: Jump

`jal <rd>, imm`

[ imm | rd | opcode]