		.data
	
		.align	0					# alinhamento na memória para byte: pode ser qualquer lugar, pois vamos ler uma string
str1:	.asciz	"Hello World++!"
str2:	.asciz 	"Hello World--!"

		.text
		
		.align 2 					# alinhamento para 32 bits (2² = 4 bytes)
		.globl main
main:	
	
		addi a7, zero, 5			# li a7, 5 (destino, origem, valor imediato)
		
		ecall						# a7 -> a0 (ecall imprime valor de a0)
		
		add s0, a0, zero			# a0 -> s0
		blt s0, zero, print_neg	    		# branch if less than
		
		# imprimir string 
		addi a7, zero, 4			# código para imprimir string
		la a0, str1		
		ecall						# faz o que tá em a7 usando o valor de a0
		j the_end
	
print_neg: 
	
		addi a7, zero, 4			# coloca código de impressão de string no a7
		
		#imprime
		la a0, str2
		ecall					

the_end:

		addi a7, zero, 1			# coloca código de impressão de inteiro em a7
		add a0, zero, s0			# coloca o inteiro salvo em a0
		ecall					# imprime

		li a7, 10				# coloca código de saída em a7
		ecall					# sai
	