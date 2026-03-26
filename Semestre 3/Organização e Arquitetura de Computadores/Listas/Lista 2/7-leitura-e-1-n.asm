                .data
                .align 0

str_int:        .asciz "Digite um número inteiro positivo: "
str_space:      .asciz " "
str_quebra:     .asciz "\n"


                .text
                .align 2
                .globl main
main:

                addi a7, zero, 4
                la a0, str_int
                ecall

                addi a7, zero, 5
                ecall

                mv s0, a0

                # Interador
                addi s1, zero, 1
                jal loop

                addi a7, zero, 4
                la a0, str_quebra
                ecall

                addi a7, zero, 10
                ecall

loop:

            addi a7, zero, 1
            mv a0, s1
            ecall

            addi a7, zero, 4
            la a0, str_space
            ecall
            
            addi s1, s1, 1

            ble s1, s0, loop

            jr ra
