# C code if (i==j) f=g+h else f=g-h

.data
	f:		.word 0
	g:      	.word 6
	h:      	.word 2
	i:	 	.word 10
	j:		.word 10
	newline:	.byte '\n'

.text
	lw $s1,g  	   	# Load g into $s1
	lw $s2,h  		# Load h into $s2
	lw $s3,i  		# Load i into $s3
	lw $s4,j  		# Load j into $s4
	
	bne $s3,$s4,Else   	# branch to Else label if i ne j
	add $s0,$s1,$s2    	# $s0 = g + h
	j Exit             	# Unconditional jump to Exit
Else: 	sub $s0,$s1,$s2    	# #s0 = g - h
Exit:                      	# Exit label
	sw $s0,f           	# Store $s0 into memory location f
	
	li $v0,1           	# Load instruction to print and integer
	lw $a0,f           	# Load value of f to $a0
	syscall            	# System call to print f
	 
	li $v0,4
	la $a0, newline
	syscall
