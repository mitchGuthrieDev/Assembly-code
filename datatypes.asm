.data
	myMessage:	.asciiz "Hello World\n"  # demonstrate a string
	myInt:		.word 4100	         # demonstrate an integer
	myInt2:		.word 32                 
	myArray:	.space 40	         # allocate space for 10 words (integers)
	myChar:		.byte 'z'                # allocate space for 1 byte
	newline:	.byte '\n'               # allocate space for 1 byte
	myHalf:         .half 1,2,3              # allocate space for half words (16 bits instead of 32)
	myFloat:        .float 1.3               # allocate space for float
	myDouble:        .double 3.14             # allocate space for a double
	
.text

	li $v0,4		# "load immediate" -  4 identifies  specific syscall to output ASCII text to string
	la $a0, myMessage	# "load address" of message into standard first argument register for syscall
	syscall
	
	li $v0,4		
	la $a0, myChar	

	li $v0,4		
	la $a0, newline
	
	syscall
	li $v0,1		# 1 means print an integer (word)
	lw $a0, myInt		# "load word" (vs address)
	syscall
	