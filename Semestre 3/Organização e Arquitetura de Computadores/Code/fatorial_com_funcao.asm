            .data

            .align 0

str_oi:     .asciz "Digite um n° >= 0: "

            .asciz "é: "

str_res1:   .asciz "O fatorial de "
str_res2:   .asciz " é "
str_erro:   .asciz "Entrada inválida.\n"



            .text
            .align 2
            .globl main
main:       

loop_leitura:
            
            # Imprimir str_oi

            addi a7, zero, 4
            la a0, str_oi
            ecall

            # Ler inteiro
            addi a7, zero, 5
            ecall

            bge a0, zero, continua

            addi a7, zero, 4
            la a0, str_erro
            ecall

            j loop_leitura

continua:

        # Chamada da função fatorial
        # Parâmetro: a0; Retorno: a1

        add s0, a0, zero

        jal fatorial # Retorno estará em a1

        # String 1
        addi a7, zero, 4
        la a0, str_res1
        ecall

        # Valor digitado
        addi a7, zero, 1
        addi a0, s0, 0
        ecall

        # String 2
        addi a7, zero, 4
        la a0, str_res2
        ecall

        # Fatorial
        addi a7, zero, 1
        addi a0, a1, 0
        ecall

        # Ecall
        addi a7, zero, 10
        ecall

fatorial:

        # Parâmetro: a0; Retorno: a1

        add t0, zero, a0
        addi a1, zero, 1

loop:      

	beq t0, zero, sair
	
    mul a1, t0, a1

    addi t0, t0, -1
    
        j loop


sair:
        jr ra
