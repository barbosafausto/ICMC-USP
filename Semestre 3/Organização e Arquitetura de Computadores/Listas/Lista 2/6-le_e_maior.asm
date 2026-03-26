            .data
            .align 0

str_int1:   .asciz "Digite um número inteiro: "
str_int2:   .asciz "Digite outro número inteiro: "

str_maior:  .asciz "O maior número é o "
str_quebra: .asciz "\n"
str_iguais: .asciz "Os números são iguais.\n"



            .text
            .align 2
            .globl main
main:

            addi a7, zero, 4
            la a0, str_int1
            ecall

            addi a7, zero, 5
            ecall
            mv s1, a0



            addi a7, zero, 4
            la a0, str_int2
            ecall

            addi a7, zero, 5
            ecall
            mv s2, a0

            bgt s1, s2 primeiro
            beq s1, s2, iguais
            blt s1, s2, segundo

primeiro:

            addi a7, zero, 4
            la a0, str_maior
            ecall

            addi a7, zero, 1
            mv a0, s1
            ecall

            addi a7, zero, 4
            la a0, str_quebra
            ecall
            
            j sair

segundo:

            addi a7, zero, 4
            la a0, str_maior
            ecall

            addi a7, zero, 1
            mv a0, s2
            ecall

            addi a7, zero, 4
            la a0, str_quebra
            ecall

            j sair

iguais:

            addi a7, zero, 4
            la a0, str_iguais
            ecall

sair:
            addi a7, zero, 10
            ecall

    




