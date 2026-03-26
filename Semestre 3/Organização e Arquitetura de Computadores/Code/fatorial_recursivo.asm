            .data
            .align 0

str_input:  .asciz "Digite um número inteiro: "


            .text
            .align 2
            .globl main
main:

            # Texto
            addi a7, zero, 4
            la a0, str_input
            ecall

            # Leitura
            addi a7, zero, 5
            ecall

            jal fatorial

            # Impressão
            addi a7, zero, 1
            add a0, a1, zero
            ecall

            # Saída
            addi a7, zero, 10
            ecall

fatorial:


        # Necessário empilhar o ra para não perdê-lo
        # Empilhar a0 também
        addi sp, sp, -8
        sw ra, 0(sp)
        sw a0, 4(sp)

        # Caso base
        beq a0, zero, retorna1

        # Recursão
        addi a0, a0, -1
        jal fatorial

        # Recuperar ra para próxima recursão e o a0
        lw ra, 0(sp)
        lw a0, 4(sp)
        addi sp, sp, 8

        mul a1, a0, a1

        jr ra

retorna1:

        # Retorno
        addi a1, zero, 1

        # Desempilha
        lw ra, 0(sp)
        lw a0, 4(sp)
        addi sp, sp, 8

        jr ra




