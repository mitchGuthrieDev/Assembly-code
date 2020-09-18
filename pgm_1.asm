# C code:
#   f = (g + h) - (i + j); 


.data
	f:	.word	0 	# RAM storage location for "f"
	g:	.word	10
	h:	.word	20
	i:	.word	1
	j:	.word	4

.text
	lw	$s0, f		# load all the data from RAM into registers
	lw	$s1, g
	lw	$s2, h
	lw	$s3, i
	lw	$s4, j
	
	add	$t0, $s1, $s2	# g + h
	add	$t1, $s3, $s4	# i + j
	sub	$s0, $t0, $t1	# (g + h) - (i +j)
	
	sw	$s0, f 		# save result back into f
	
	li $v0, 1		# Setup to call system for I/O; 1 means print an integer (word)
	lw $a0, f		# "load word" (integer) from RAM location
	syscall			# invoke system to perform terminal I/O
	
