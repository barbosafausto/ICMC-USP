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
* Branches pulam half-words em RISC-V, por isso o bit 0 é 0
    * a Unidade Geradora de Valor Imediato multiplica o `imm` por 2 para obter o jump em bytes.
* O bit 12 do immediate (31 da instrução) é de <u>sinal</u>.

```mips

PC ->   beq s1, s0, desvia 
        addi s1, s1, 1      (+2 meias palavras)
                            
desvia: ...                 (+2 meias palavras)
```

Isso equivale a:
`beq s1, s0, 4`. Pula 4 meias palavras (8 bytes).



## U: Upper

`lui <rd>, imm`

[imm | rd | opcode]

Carrega um `imm` de um endereço de memória para os 20 bits mais significativos de um registrador (upper immediate).

`lui s0, 0x01234`

## J: Jump

`jal <rd>, imm`

[ imm | rd | opcode]

Immediate: 20 bits [20][10..1][11][19..12]

`jal s0, -4`


## Etapas das Instruções

1. IF: Instruction Fetch
2. ID: Instruction Decode
3. EX: Execution (ULA)
4. MEM: Memory Access
5. WB: Write Back

### Instruções e seus Números de Etapas

* Tipo R: IF, ID, EX, WB
* Tipo I: IF, ID, EX, MEM, WB (5 ciclos em multiciclo)
* Tipo S: IF, ID, EX, MEM
* TIPO B: IF, ID, EX, MEM (não acessa a memória)


# Implementações

## Monociclo

Todas as instruções são executadas em um ciclo de clock.

## Multiciclo

As instruções são quebradas em etapas, e cada etapa é executada em um ciclo de clock.

## Pipeline

As instruções são quebradas em etapas, e etapas de múltiplas instruções são executadas no mesmo ciclo de clock.

As instruções são sobrepostas e realizadas <u>paralelamente</u>.