.text

.globl main

main:
	addi $a0, $zero, 8 
	addi $a1, $zero, 8
	jal greater 		#jump and call addition
	movz $a0, $v0, $zero 	#store return value to $S0
	
	addi $v0, $zero, 1		#print
	syscall 
	
	addi $v0, $zero, 10		#exit
	syscall 

greater:
	beq $a0, $a1, EQUAL 	#if arguments are equal exit
	slt $t0, $a0, $a1	#is less than
	beq $t0, $zero, FIRST	#$s1 is less go to FIRST
	move $v0, $a1		#Else $s2 is less store return value as $s2
	jr $ra			#return
	
FIRST: 
	move $v0, $a0
	jr $ra

EQUAL:	
	addi  $t0, $zero, -1 #if equal return -1
	move $v0, $t0
	jr $ra	
	
