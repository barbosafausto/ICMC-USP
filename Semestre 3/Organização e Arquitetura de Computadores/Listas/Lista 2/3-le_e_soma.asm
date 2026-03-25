                .data
                .align 0

str1:           .asciz "Digite um inteiro: "
str2:           .asciz "Digite outro inteiro: "

str_soma:       .asciz "A soma dos números é: "

                .text
                .align 2
                .globl main
main:

                # Texto 1
                addi a7, zero, 4
                la a0, str1
                ecall

                # Leitura 1
                addi a7, zero, 5
                ecall

                # Salvo o primeiro inteiro em s0
                mv s0, a0


                # Texto 2
                addi a7, zero, 4
                la a0, str2
                ecall

                # Leitura 2
                addi a7, zero, 5
                ecall

                # Salvo o segundo inteiro em s1
                mv s1, a0

                # Texto da soma
                addi a7, zero, 4
                la a0, str_soma
                ecall

                # A soma ficará em a0
                add a0, s0, s1

                # Impressão da soma
                addi a7, zero, 1
                ecall


