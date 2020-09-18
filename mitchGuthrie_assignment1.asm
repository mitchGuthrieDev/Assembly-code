#Mitch Guthrie
#Homework 1

# C code:
#   a = 4*(b-c) + (d+e)/2


.data
	a:		.word	0	# a
	b:		.word	12	# b
	c:		.word   5	# c
	d:		.word	3	# d
	e:		.word	7	# e
	newline:	.byte	'\n'

.text
	lw	$s0, a			# load all data from RAM into registers
	lw	$s1, b
	lw	$s2, c
	lw	$s3, d
	lw	$s4, e

	sub	$t0, $s1, $s2		
	add	$t1, $s3, $s4		
	sll	$t2, $t0, 2		
	srl	$t3, $t1, 1		
	add	$s0, $t2, $t3		

	sw	$s0, a

	li $v0, 1			# Setup to call system for I/O
	lw $a0, a			# "load word" from RAM
	syscall				