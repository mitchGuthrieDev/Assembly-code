#Mitch Guthrie 001215440
#In-Class Assignment #5

.data 
	displayMsg: 	.asciiz "Enter string: "
	displayMsgInt:	.asciiz "Enter integer: "
	message: 	.asciiz "UCA Assembly Class”
.align 2
	inString: 	.space 24
	maxNumChar: 	.word 24
.text 

Start:
#dialogue box
	la $a0,message
	addi $a1, $zero, 1
	addi $v0,$zero,55
	syscall

# Request a String:
	la $a0, displayMsg
	li $v0, 4
	syscall
	
# Read the Entered String
	la $a0, inString
	lw $a1, maxNumChar
	li $v0, 8
	syscall
	
# Request a String:
	la $a0, displayMsgInt
	li $v0, 4
	syscall
	
# Read the Entered Integer
	li $v0, 5
	syscall
	
# Save the int
	move $t2,$v0

#if == -1, jump to exit
	beq $t2, -1, Exit

#setting i = 0 for for loop
	li $t0,0

For_loop:
	slt $t1, $t0, $t2	#t1 = 1 if t0<t2
	beq $t1, $zero, Exit	#Branch to Exit if t1 = 0
	
	# Print
	la $a0, inString
	li $v0, 4
	syscall
	
	addi $t0,$t0,1		#increase i by 1
	j For_loop
Exit:
	li $v0,1
