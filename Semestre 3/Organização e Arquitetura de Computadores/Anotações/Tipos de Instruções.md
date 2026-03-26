# Tipos das Instruções

> RV32I, 6 tipos.

* opcode: 7 bits
* registradores: 5 bits
* f3: 3 bits 
* f7: 7 bits
* imm: 12 ou 20 bits

## R: Register

`add <rd>, <rs1>, <rs2>`

[f7 | rs2 | rs1 | f3 | rd | opcode]

## I: Immediate

`lw <rd>, imm(<rs1>)`

[imm | rs1 | f3 | rd | opcode]

## S: Store

`sw <rs2>, imm(<rs1>)`

[imm | rs2 | rs1 | f3 | imm | opcode]


## B: Branch

`beq <rs1>, <rs2>, imm`

[imm | rs2 | rs1 | f3 | imm | opcode]

## U: Upper

`lui <rd>, imm`

[imm | rd | opcode]

## J: Jump

`jal <rd>, imm`

[ imm | rd | opcode]