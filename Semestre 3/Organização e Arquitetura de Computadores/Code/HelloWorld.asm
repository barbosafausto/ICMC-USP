		.data

string: .asciz "Hello Word!"

		.text
		.globl main

main:   addi a7, zero, 4 
		#li a7, 4
		
		la a0, string
		
		ecall
		
		addi a7, zero, 10
		
		ecall
		