            .data

            .align 0

str_le:     .asciz "Digite um número inteiro: "
str_dobro:  .asciz "O dobro é: "
str_triplo: .asciz "O triplo é: "
str_quebra: .asciz "\n"


            .text
            .align 2
            .globl main
main:

            # Inteiro
            addi a7, zero, 4
            la a0, str_le
            ecall

            addi a7, zero, 5
            ecall

            # Contas
            addi t0, zero, 2
            mul s2, a0, t0

            addi t0, zero, 3
            mul s3, a0, t0


            # Resultados
            addi a7, zero, 4
            la a0, str_dobro
            ecall

            addi a7, zero, 1
            addi a0, s2, 0
            ecall

            addi a7, zero, 4
            la a0, str_quebra
            ecall



            addi a7, zero, 4
            la a0, str_triplo
            ecall

            addi a7, zero, 1
            addi a0, s3, 0
            ecall

            addi a7, zero, 4
            la a0, str_quebra
            ecall


            # Saída
            addi a7, zero, 10
            ecall
