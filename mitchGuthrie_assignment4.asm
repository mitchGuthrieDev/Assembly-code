#Mitch Guthrie 001215440
#Assignment 4


.data
	k:	.word 3
	a:	.word 0
	b:	.word 10
	c:	.word 5
	d:	.word 8
	e:	.word 7
	
.text

 	lw $s5, k  #k 
 	lw $s0, a  #a
 	lw $s1, b  #b
 	lw $s2, c  #c
 	lw $s3, d  #d
 	lw $s4, e  #e

	beq $s5, $zero, L0
	beq $s5, 1, L1
	beq $s5, 2, L2
	beq $s5, 3, L3
	j Else

Else:	move $s0, $zero
	j Exit
	
L0:	add $s0, $s1, $s2
	j Exit
	
L1:	add $s0, $s3, $s4
	j Exit
	
L2:	sub $s0, $s3, $s4
	j Exit

L3:	sub $s0, $s1, $s2
	j Exit
Exit:
	sw	$s0, a
	li $v0, 1			# Setup to call system for I/O
	lw $a0, a			# "load word" from RAM
	syscall
	