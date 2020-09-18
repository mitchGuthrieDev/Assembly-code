#Mitch Guthrie, ID: 001215440
#Assignment HW 2

#C Code: for(i=0; i < 10; i++) printf ("I like pizza!\n")

.data
	myMessage:	.asciiz "I like pizza\n"
.text
	li $t0,0		#load value of 0 into $t0 (i)
	
For_loop:
	slt $t1, $t0, 10	#t1 = 1 if t0<10
	beq $t1, $zero, Exit	#Branch to Exit if t1 = 0
	
	li $v0,4		# "load immediate" -  4 identifies  specific syscall to output ASCII text to string
	la $a0, myMessage	# "load address" of message into standard first argument register for syscall
	syscall			#prints
	
	addi $t0,$t0,1		#increase i by 1
	j For_loop
Exit:
	li $v0,1
