# C code:
#   A[10] = h + A[8];

.data
	h:		.word	45
	A:		.space	48
	newline:	.byte	'\n'

.text
	lw	$s2, h		# load value of h
	la	$s3, A		# load address of array A base
	
				# for illustration, put something into the array
	li	$t0, 5		# load 5 into register
	sw	$t0, 32($s3)	# A[8] = 5 using $s3 as base register
	
	lw	$t0, 32($s3)	# retrieve the value of A[8] using $s3 as base register
	add	$s1, $s2, $t0	# h + A[8]
	
	sw	$s1, 40($s3)	# save A[10]
	
				# print A[10] it confirm
	li $v0, 1		# Setup to call system for I/O; 1 means print an integer (word)
	lw $a0, 40($s3)		# "load word" (integer) from RAM location
	syscall			# invoke system to perform terminal I/O
	
	li $v0, 4		# Setup to call system for I/O; 4 means print an ASCII character
	la $a0, newline		# print a newline so new output goes on next line of console
				#	note that we are loading the address of newline vs the value (word)
				#	when we printed g above
	syscall			# invoke system to perform terminal I/O
	
				# print A[8] for fun
	li $v0, 1		# Setup to call system for I/O; 1 means print an integer (word)
	lw $a0, 32($s3)		# "load word" (integer) from RAM location
	syscall			# invoke system to perform terminal I/O

