.data:
	base1: 		.asciiz "Enter base for first triangle: "
	height1:	.asciiz "Enter height for first triangle: "
	base2:		.asciiz "Enter base for second triangle: "
	height2:	.asciiz "Enter height for second triangle: "
	
	b1:		.word
	h1:		.word
	b2:		.word
	h2:		.word
	
	Output1: 	.asciiz "First Triangle is greater than second.\n"
	Output2: 	.asciiz "Second triangle is greater than First.\n"
	Area1: 		.asciiz "Area of first triangle = "
	Area2: 		.asciiz "Area of second triangle = "
	newline: 	.asciiz "\n"
	
.text:
main:
	# for base of triangle 1
	la	$a0, base1	      
	li 	$v0, 4
	Syscall 
	
	li	$v0, 5	
	la	$s0, b1	
	syscall
	
	move 	$s0, $v0
	
	# for height of triangle 1
	la	$a0, height1	      
	li 	$v0, 4
	Syscall 
	
	li	$v0, 5	
	la	$s1, h1	
	syscall
	
	move 	$s1, $v0
	
	# for base of triangle 2
	la	$a0, base2	      
	li 	$v0, 4
	Syscall 
	
	li	$v0, 5	
	la	$s2, b2	
	syscall
	
	move 	$s2, $v0
	
	# for height of triangle 2
	la	$a0, height2	      
	li 	$v0, 4
	Syscall 
	
	li	$v0, 5	
	la	$s3, h2	
	syscall
	
	move 	$s3, $v0

 	# laod memory
 	move	$a0, $s0
 	move	$a1, $s1
 	move	$a2, $s2
 	move	$a3, $s3
 	
 	jal Compare
 	
	li $v0, 10
 	syscall
 	
Compare:
	subi $sp, $sp, 4
	sw $ra, 0($sp)
	jal Area
	add $s0, $v0, $zero
	la $a0, Area1
	li $v0, 4
	syscall
	add $a0, $s0, $zero
	li $v0, 1
	syscall
	la $a0, newline
	li $v0, 4
	syscall
	la $a0, Area2
	li $v0, 4
	add $s1, $v0, $zero
	syscall
	add $a0, $a2, $zero
	add $a1, $a3, $zero
	jal Area
	add $a0, $v0, $zero
	li $v0, 1
	syscall
 	la $a0, newline
 	li $v0, 4
 	syscall
 	sub $s0, $s0, $s1
 	bltz $s0, LESS
 	j MORE
 	
 LESS:
 	li $v0, 4
	la $a0, Output2
	syscall
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
MORE:
	li $v0, 4
	la $a0, Output1
	syscall
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
Area:
	subi $sp, $sp, 8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	mul $s1, $a0, $a1
	srl $v0, $s1, 1
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra
 
 
 
