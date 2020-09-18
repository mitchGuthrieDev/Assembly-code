# C code 
# while (save[i] == k) 
#	i +=1;

.data
	save:		.word	1,1,1,1,5,6,7,8,9,10,11,12  # 12 integers
	i:	 	.word   0 
	k:		.word   1
	newline:	.byte   '\n'

.text
	lw $s3,i  	   	# Load i into $s3
	lw $s5,k  		# Load k into $s5
	la $s6, save            # Load memory address of save into $s6
	
Loop:   sll $t1,$s3,0          # $t1 = i * 4	
        add $t1,$t1,$s6         # Calcuate memory location for save[i]
        lw  $t0,0($t1)          # Load word from memory location for save[i]
        
	bne $t0,$s5,Exit   	# go to label Exit if save[i] ne k
	add $s3,$s3,1    	# $s3 = i + 1
	j Loop             	# Unconditional jump to Loop
Exit:                      	# Exit label
	sw $s3,i                # Store value o $s3 back into i
	
	li $v0,1           	# Load instruction to print and integer
	lw $a0,i           	# Load value of i to $a0
	syscall            	# System call to print i
	 
	li $v0,4
	la $a0, newline
	syscall
