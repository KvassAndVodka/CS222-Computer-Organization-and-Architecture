.data
	showValue1: .asciiz "\nEnter your 1st value: "
	showValue2: .asciiz "Enter your 2nd value: "
	showSum: .asciiz "Sum of input value: "
	showDifference: .asciiz "\nDifference of new value: "
	showProduct: .asciiz "\nMultiplication of new value x input value: "
	showQuotient: .asciiz "\nDivision of New Value / New Value: "
	showPrevVal: .asciiz "\nPreview Input Value: "

.text
main:
	#Input Value 1
	li $v0, 4
	la $a0, showValue1
	syscall
	
	li $v0, 5
	syscall
	
	move $s0, $v0		#Store Value1 to s0
	
	#Input Value 2
	li $v0, 4
	la $a0, showValue2
	syscall
	
	li $v0, 5			
	syscall
	
	move $s1, $v0		#Store Value2 to s1

	jal findSum		
	jal printS0

	jal findDifference	
	jal printS1
	
	jal findProduct
	jal printS1
	
	jal findQuotient
	jal printS0

	jal prevValue1
	jal printS0
	
	jal prevValue2
	jal printS1
	
	#exit program
	li $v0, 10
	syscall

findSum:
	addi $sp, $sp -4	#Allocate space for stack pointer
	sw $s0, 0($sp)		#Store word s0 to sp 0
	sw $s1, 4($sp)		#Store word s1 to sp 4
	
	add $s0, $s0, $s1	#Calculate sum
	
	li $v0, 4
	la $a0, showSum
	syscall

	jr $ra

findDifference:
	sub $s1, $s0, $s1	#Calculate difference
	
	li $v0, 4
	la $a0, showDifference
	syscall
	
	jr $ra

findProduct:
	mul $s1, $s0, $s1	#Calculate Product
	
	li $v0, 4
	la $a0, showProduct
	syscall
	
	jr $ra

findQuotient:
	div $s0, $s1, $s0	#Calculate quotient
	
	li $v0, 4		
	la $a0, showQuotient
	syscall
	
	jr $ra
	
prevValue1: 
	lw $s0, 0($sp)		#Load original value of s0
	
	li $v0, 4
	la $a0, showPrevVal
	syscall
	
	jr $ra
	
prevValue2:
	lw $s1, 4($sp)		#Load original value of s1
	
	li $v0, 4
	la $a0, showPrevVal
	syscall
	
	jr $ra
	
printS0:
	li $v0, 1
	move $a0, $s0
	syscall
	
	jr $ra

printS1:
	li $v0, 1
	move $a0, $s1
	syscall
	
	jr $ra
