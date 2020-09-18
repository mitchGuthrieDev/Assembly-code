#Mitch Guthrie 001215440 - HW 4
.data
	A: 		.word 110, 160, 20, 70, 60, 140,150, 80, 90,100, 10, 30, 40,120,130,50
	size: 		.word 16 # length of array A
	shiftAmount: 	.word 4 # use to divide and multiply by 16
	min: 		.word 0
	max: 		.word 0
	sum: 		.word 0
	average: 	.word 0
	largestInt: 	.word 2147483647 # use this for min procedure"
	maxMessage:	.asciiz "\nThe maximum is: "
	minMessage:	.asciiz "\nThe minimum is: "
	avgMessage:	.asciiz "\nThe average is: "
	sumMessage:	.asciiz "\nThe sum is: "
	
.text
	jal findMMA

findMMA:
	li $t3,0 #sets sum to 0
	li $t5,0 #sets max to 0
	la $t4, ($t1) #sets min to last num of array
	li $s6,0 #sets avg to 0
	li $t0,0 #clears index to 0
	li $s2,0 #clears count to 0
while:
	beq $t2,16,avg
	lw $t1, A($t0)
	addu $t3,$t3,$t1 #calcs sum
	bgt $t1,$t4,chkmax #checks for min
	move $t4,$t1 #changes min
	chkmax:
		blt $s1,$t5,avg #checks for max
		move $t5,$s1 #changes max
	
		addi $t0,$t0,4 #increments address
		addi $t2,$t2,1 #increments count
	
	j while
	avg:
		div $t6,$s3,$t2 #calcs average
	
	li $v0,4 #service number
	la $a0,maxMessage
	syscall #prints message
	
	li $v0,4
	move $a0, $t5
	syscall
	
	li $v0,4
	la $a0,minMessage
	syscall
	
	li $v0,4
	move $a0,$t4
	syscall
	
	li $v0,4
	la $a0, avgMessage
	syscall
	
	li $v0,4
	move $a0,$t6
	syscall
	
	li $v0,10
	syscall
	
	
	
	
	
	
	
	
	
		
