.text
.globl main

main:
	addi 	$a0, $zero, 10 #assign base
	addi 	$a1, $zero, 8 #assign power
	
	jal 	power
	move 	$a0, $v0	#store returned value to $a0
	
	addi 	$v0, $zero, 1	#print
	syscall 
	
	addi 	$v0, $zero, 10	#exit
	syscall  
power:

	subi 	$sp, $sp, 8	#make room of 8 bytes 2 words on stack
	sw	$ra, 0($sp)	#save  power()'s current return address on stack
	sw	$s0, 4($sp)	#save power()'s current argument n on stack
	addi	$v0, $zero, 1	#base case returns value of $a0 
	bgtz	$a1, recursive	#if greater than zero go to recursive case
	j base
recursive:
	move	$s0, $a1	#save incoming value of n into $s0
	subi	$a1, $a1, 1	#n-1
	jal 	power
	mul 	$v0, $v0, $a0	#multiply the base number with return value 
base:	
	lw	$ra, 0($sp)	#restore into $ra the address of caller
	lw	$s0, 4($sp)	#restore into save register $s0
	addi 	$sp, $sp, 8	#free up 8 bits of stack memory
	jr	$ra		#return