            .data
            
            .align 0
str_src:    .asciz "Consegui!!!"

            .align 2
p_str_dst:  .word          # Ponteiro


            .text
            .align 2
            .globl main
main:

        la t0, str_src      # t0: endereço do byte 1 da str
        addi t3, zero, 0    # t3: contador

loop_tam:

    lb s0, 0(t0)

    addi t3, t3, 1
    addi t0, t0, 1

    bne s0, zero loop_tam

aloca:

    addi a7, zero, 9
    add  a0, zero, t3
    ecall


armazena:

    # Alocação de t3 bytes
    addi a7, zero, 9
    add  a0, zero, t3
    ecall
    
    # Endereço da nova string em p_str_dst
    la t1, p_str_dst
    sw a0, 0(t1)

    # Endereço da string original em t0
    la t0, str_src

    # Endereço da string final em t1
    la t1, p_str_dst
    lw t2, 0(t1)




loop_copy:        

    lb s0, 0(t0)
    sb s0, 0(t2)

    addi t0, t0, 1
    addi t2, t2, 1

    bne s0, zero, loop_copy


imprime:

    addi a7, zero, 4

    la t1, p_str_dst    # Carrega endereço da str
    lw a0, 0(t1)        # Carrega o endereço da str em a0

    ecall 

fim:

    addi a7, zero, 10
    ecall
    

