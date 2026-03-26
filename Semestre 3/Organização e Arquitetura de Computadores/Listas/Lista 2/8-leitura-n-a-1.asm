                .data
                .align 0

str_input:      .asciz "Digite um inteiro positivo: "
str_espaco:     .asciz " "
str_quebra:     .asciz "\n"


                .align 2
                .text
                .globl main
main:

                addi a7, zero, 4
                la a0, str_input
                ecall

                addi a7, zero, 5
                ecall

                mv s0, a0 # Lembrete de parada

                addi a0, zero, 1
                jal imprime_recursivo

                # Quebra
                addi a7, zero, 4
                la a0, str_quebra
                ecall

                # Sai
                addi a7, zero, 10
                ecall


imprime_recursivo:        # Parâmetro: a0; Retorno: a1


                # Empilha
                addi sp, sp, -8
                sw ra, 0(sp)
                sw a0, 4(sp)

                # Base
                beq a0, s0, retorna_n

                # Recursão
                addi a0, a0, 1
                jal imprime_recursivo

                # Carrega a0 salvo e o imprime
                lw a0, 4(sp)
                addi a7, zero, 1
                ecall

                # Imprime um espaço
                addi a7, zero, 4
                la a0, str_espaco
                ecall

                # Carrega ra salvo
                lw ra, 0(sp)

                # Desempilha
                addi sp, sp 8

                # Retorna
                jr ra


retorna_n:

            addi a1, a0, 0

            addi a7, zero, 1
            addi a0, a1, 0
            ecall

            addi a7, zero, 4
            la a0, str_espaco
            ecall

            lw ra, 0(sp)
            addi sp, sp, 8

            jr ra


                