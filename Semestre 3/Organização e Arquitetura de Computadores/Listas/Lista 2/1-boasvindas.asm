            .data

            .align 0
str_ola:    .asciz "Bem-vindo!\n"


            .text
            .align 2
            .globl main
main:

            # ------ Impressão da string

            # Colocando o serviço de impressão de string em a7
            addi a7, zero, 4
            
            # Carregando o endereço da string em a0
            la a0, str_ola

            # Imprimindo
            ecall



            # ------- Saída do sistema

            addi a7, zero, 10
            ecall



