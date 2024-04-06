.data
	showGroup: .asciiz "\nGroup: "
	student1: .asciiz "Javier M. Raut,"
	student2: .asciiz " Krystal Heart M. Bacalso"
	cheer: .asciiz "\nWe did it!!!"
	showRemainder: .asciiz "\nRemainder: "
	showSum: .asciiz "\nSum: "
	showDifference: .asciiz "\nDifference: "
	showProduct: .asciiz "\nProduct: "
	showQuotient: .asciiz "\nQuotient: "
	newLines: .asciiz "\n\n"
.text
	#Declare variables
	addi $t0, $zero, 30
	addi $t1, $zero, 4
	addi $t2, $zero, 5
	
	#Display Names
	li $v0, 4
	la $a0, showGroup
	syscall
	
	li $v0, 4
	la $a0, student1
	syscall
	
	li $v0, 4
	la $a0, student2
	syscall
	
	#Problem 1: Remainder and Quotient
	div $t0, $t1
	
	mflo $s0		#store quotient at s0
	mfhi $s1		#store remainder at s1
	
	li $v0, 4		#Block to Print Remainder
	la $a0, showRemainder
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4		#Block to print Quotient
	la $a0, showQuotient
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	#Problem 1: Sum
	add $s2, $s0, $t2	#Add s0 and t2 and store to s2
	
	li $v0, 4		#Block to Print Sum
	la $a0, showSum
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	#Problem 1: Difference
	sub $s3, $t0, $s2	#Subtract t0 and s2 and store to s3
	
	li $v0, 4		#Block to Print Difference
	la $a0, showDifference
	syscall
	
	li $v0, 1		
	move $a0, $s3
	syscall
	
	#Problem 1: Product
	mul $s4, $s3, $s1	#Multiply s3 and s1 and store to s4
		
	li $v0, 4		#Block to Print Product
	la $a0, showProduct
	syscall
	
	li $v0, 1
	move $a0, $s4
	syscall
	
	#New Linesss
	li $v0, 4
	la $a0, newLines
	syscall
	
	#Problem 2: Product
	mul $s5, $t1, $t2	#Multiply t1 and t2 and store to s5
	
	li $v0, 4		#Block to Print Prouct
	la $a0, showProduct
	syscall
	
	li $v0, 1
	move $a0, $s5
	syscall
	
	#Problem 2; Quotient
	div $s5, $t1		#Div s5 and t1
	
	mflo $s6		#Move quotient to s6
	
	li $v0, 4		#Block to print quotient
	la $a0, showQuotient
	syscall
	
	li $v0, 1
	move $a0, $s6
	syscall
	
	#Problem 2: Sum
	addi $s7, $t0, 90	#Add t0 with 90 and store to s7
	
	li $v0, 4		#Block to Print Sum
	la $a0, showSum
	syscall
	
	li $v0, 1
	move $a0, $s7
	syscall
	
	#Problem 2: Difference
	sub $s7, $s7, $t0	#Subtract s7 and t0 and store to s7
	
	li $v0, 4		#Block to show difference
	la $a0, showDifference
	syscall
	
	li $v0, 1
	move $a0, $s7
	syscall
	
	#New Linesss
	li $v0, 4
	la $a0, cheer
	syscall
