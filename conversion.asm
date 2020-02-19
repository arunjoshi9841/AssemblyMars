.data

	dialog: 		.asciiz "Enter temperature in celcuis: "
	coninputTemp: 		.asciiz "You entered: "
	result: 		.asciiz "\n The temperature in fahrenheit is: "
	inputTemp:		.float 0.0
	f1:			.float 1.8
	f2:			.float 32.0

.text
.globl main

main:
	la	$a0, dialog	
	li 	$v0, 4		
	syscall 
	
	li	$v0, 6		
	syscall
	s.s	$f0, f		
	
	
	la	$a0, conf	
	li 	$v0, 4		
	syscall 
	
	l.s	$f12, f		
	l.s	$f11, f1	
	l.s	$f10, f2
	
	li	$v0, 2		
	syscall
	
	jal 	convert
	
	addi $v0, $zero, 10
	syscall
	
convert:
	mul.s	$f1, $f11,$f12
	add.s	$f1, $f1, $f10
	
	la	$a0, result	
	li 	$v0, 4		
	syscall 
	
	mov.s	$f12, $f1	
	li	$v0, 2		
	syscall
	
	
	jr	$ra

	
	
	
	
