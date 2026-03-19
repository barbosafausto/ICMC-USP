		.data
		.align 0

str_src:	.asciz "Teste"
str_dst: 	.space 6  	# Reserva de 6 bytes na memória stack


		.text
		.align 2	#  Alinha à palavra (2² = 4)
		.globl main
main:
		# Precisamos de 2 registradores, um para a base de cada string
		# t0: string source; t1: string destino
		
		# Carregamento 
		la t0, str_src
		la t1, str_dst
		
loop_copy:	lb s0, 0(t0) 	# carrega em s0 o que está em t0 (posição inicial)
		sb s0, 0(t1)	# armazena o que está em s0 em t1 (posição inicial)
		
		addi t0, t0, 1  # sobe 1 byte
		addi t1, t1, 1 	# idem
		
		bne s0, zero, loop_copy # branch (same loop_) se diferente de 0

	
		addi a7, zero, 4
		la a0, str_dst
		ecall		
			
		addi a7, zero, 10
		ecall
		
		
		
		