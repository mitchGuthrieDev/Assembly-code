#Mitch Guthrie, ID: 001215440
#Assignment HW 2

#C Code: for(i=0; i < 10; i++) printf ("I like pizza!\n")

.data
	myMessage:	.asciiz "Hello World\n"
.text
	li $t0,0		#load value of 0 into $t0 (i)
	
For_loop:
	slti $t1, $t0, 10
	beq $t1, $zero, Exit
	
	li $v0,4
	la $a0, myMessage
	syscall
	
	addi $t0,$t0,1
	j For_loop
Exit:
	li $v0,1
