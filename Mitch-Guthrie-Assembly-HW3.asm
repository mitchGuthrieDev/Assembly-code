#Mitch Guthrie 001215440
#Homework Assignment 3
.data
	A: 	.word 1,2,3,4,5,6,7,8,9,10 # 10 integers
	B: 	.word 1,1,1,1,5,5,5,8,8,8 # 10 integers
	C: 	.word -1,-1,-1,-1,-1,-1,-1,-1,-1,-1 # 10 integers
	count: 	.word 0
	
.text
	li $t1, 10	#size of the array
	la $s0, A	#load A into $s1
	la $s1, B	#load B into $s2
	la $s2, C	#load C into $s3
	li $s3, 0	#location of index into A
	li $t5, 0	#Count for times A will be stored into C
	li $t0, 0	#index for outer loop
	
loopOuter:
	bge $t0,$t1,exitOuter
	
	# Contnts of for loop here
	li $t2,0	#calc the correct positoni in array
	sll $t2,$t0,2	#to move up 1 in the index, it has to jump a word length which is 4 (ssl 2)
	add $t2,$t2,$s0
	
	lw $s3,($t2)	#load the value in A[index] into $s3
	
	li $t3, 0	#index of inner loop
	innerLoop:
		bge $t3,$t1,exitInner	#When $t3 == $t1 (10) break loop
		
		#Contents of for loop here
		sll $t4,$t3,2
		add $t4,$t4,$s1
		
		lw $s4,($t4)		#store current value of B array in $s4
		beq $s4, $s3,breakC	#if B == A break to count
		addi $t3,$t3,1		#increment loop
		j innerLoop
		
	breakC:
		#increment the number of times you found A in B
		addi $t5,$t5,1
		
		#move the value of A to C
		li $t6,0		#calc C position
		sll $t6,$t0,2		#move up 1
		add $t6,$t6,$s2		
		sw $s3,($t6)
		
	exitInner:
	#End of for loop here
	addi $t0,$t0,1
	j loopOuter

exitOuter:
	#print the number of time A was found in B
	sw $t5,count
	li $v0,1
	lw $a0,count
	syscall

