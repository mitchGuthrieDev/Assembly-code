#	if( x==y || i==j){
#  	 	x++;
#   		i++;
# 	}
#	else {
#  		 x=0;
#   		i=0;
#	}
#	Assume x,y, i,j are in $s0,$s1, $s2, $s3
#	sample values for x,y,i,j
.data 
	newline:	.byte '\n'
.text	

 li $s0, 10 #x
 li $s1, 10 #y
 li $s2, 40 #i
 li $s3, 30 #j
 
  beq $s0,$s1, IFBLOCK

COND2:
  beq $s2,$s3, IFBLOCK
  j ELSE
IFBLOCK:
  addi $s0, $s0,1
  addi $s2, $s2,1
  j ENDIF
ELSE:
  li $s0, 0
  li $s2, 0
ENDIF:
   
     move $a0,$s0
   li $v0,1
   syscall
   
   la $a0,newline
   li $v0,4
   syscall
   
   move $a0,$s2
   li $v0,1
   syscall
   





