                .data
                .align 0

str_leitura:    .asciz "Digite um número inteiro: "

                .text
                .align 2
                .globl main
main:

                # Imprimindo a string
                addi a7, zero, 4
                la a0, str_leitura
                ecall

                # Pedindo o inteiro
                addi a7, zero, 5
                ecall
                

                # Serviço de impressão de inteiro
                addi a7, zero, 1

                # O inteiro já está guardado em a0,
                # então podemos simplesmente imprimi-lo
                ecall


                # Saída
                addi a7, zero, 10
                ecall




