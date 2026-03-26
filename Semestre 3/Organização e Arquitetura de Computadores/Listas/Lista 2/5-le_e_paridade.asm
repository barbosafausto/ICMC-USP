            .data
            .align 0

str_int:    .asciz "Digite um número inteiro: "
str_par:    .asciz "O número é par.\n"
str_impar:  .asciz "O número é ímpar.\n"


            .text
            .align 2
            .globl main
main:

            addi a7, zero, 4
            la a0, str_int
            ecall

            addi a7, zero, 5
            ecall

            # Remainder / Módulo Aritmético
            addi t1, zero, 2
            rem t0, a0, t1

            beq t0, zero, par # Se o remainder é 0, é par
            bne t0, zero, impar # Senão, é ímpar

par:
            addi a7, zero, 4
            la a0, str_par
            ecall

            j sair
impar:
            addi a7, zero, 4
            la a0, str_impar
            ecall

sair:

            addi a7, zero, 10
            ecall