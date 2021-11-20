# Computer Organizations Homework Module 6
# By: Rafat Khandaker
# Date: 10/10/2021

# Initialize Data Constants
.data
prompt: .asciiz "\nPlease enter the size of the large pool: "
prompt2: .asciiz "\nPlease enter number of balls pulled from the large pool: "
prompt3: .asciiz "\nPlease enter the size of small pool: "
prompt4: .asciiz "\nPlease enter number of balls pulled from the small pool: "

prompt5: .asciiz "\n Your chances are 1 in "

#  This Program will calculate the chances of winning the lottery 
  
# Enter Start MIPS COde
.text
# Main Program 
main:
	# Print Prompt To User to Enter Large Pool Size
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Store Input as Number
	li $v0, 5
	syscall
	
	# Move $V0 into Temporary Register
	move $t1, $v0
	
	
	# Print Prompt To User to Enter Number Of Balls From Large Pool
	li $v0, 4
	la $a0, prompt2
	syscall
	
	# Store Input as Number
	li $v0, 5
	syscall
	
	# Move $V0 into Temporary Register
	move $t2, $v0
	
		
	# This Loop will calculate n!/(n-r)!	
	move $t0, $t1
	sub $t6, $t1, $t2 
	addi $t6, $t6, 1 
	loop : 
		beq $t1, $t6, end  # Validate if t1 = t2 then end the loop
		sub $t1, $t1, 1 
		mul $t0, $t0, $t1  # Calculate The Square Of Current Iteration
		j loop
	end: 
	
	# This Logic below will calculate the top value n!/(n-3)! divided by r! Which equals:  n!/ r!(n-r)!
	move $a0, $t2
	jal factrl
	move $t1, $v0
	div $t0, $t0, $t1
	
	
	# Print Prompt To User to Enter Size  Of The Small Pool
	li $v0, 4
	la $a0, prompt3
	syscall
	
	# Store Input as Number
	li $v0, 5
	syscall
	
	# Move $V0 into Temporary Register
	move $t3, $v0
	
	
	# Print Prompt To User to Enter Number Of Balls From Small Pool
	li $v0, 4
	la $a0, prompt2
	syscall
	
	# Store Input as Number
	li $v0, 5
	syscall
	
	
	# Move $V0 into Temporary Register
	move $t4, $v0
	
	# This Loop will calculate n!/(n-r)!	
	move $t1, $t3
	sub $t6, $t3, $t4 
	addi $t6, $t6, 1 
	loop2 : 
		beq $t3, $t6, end2  # Validate if t1 = t2 then end the loop
		sub $t3, $t3, 1 
		mul $t1, $t1, $t3  # Calculate The Square Of Current Iteration
		j loop2
	end2: 
	
	# This Logic below will calculate the top value n!/(n-3)! divided by r! Which equals:  n!/ r!(n-r)!			
	move $a0, $t4
	jal factrl
	move $t3, $v0
	div $t1, $t1, $t3
	
	# This final multiplication will multiply the odds of the large pool * small pool 
	mul $t0, $t0, $t1
	
	# Print Prompt To Display Result
	li $v0, 4
	la $a0, prompt5
	syscall
	
	# Print calculated Result
	li $v0, 1
	move $a0, $t0
	syscall
	
	# Exit Program
	li $v0, 10
	syscall






# Given n, in register $a0 ; 
# calculate n!, store and return the result in register $v0 

factrl:		

sw $ra, 4($sp) # save the return address 
sw $a0, 0($sp) # save the current value of n 
addi $sp, $sp, -8 # move stack pointer 

slti $t7, $a0, 2 # save 1 iteration, n=0 or n =1; n!=1 
beq $t7, $zero, L1 # not less than 2 , calculate n(n - 1)! 
addi $v0, $zero, 1 # n=1; n!=1 
jr $ra # now multiply 

L1: 

addi $a0, $a0, -1 # n = n - 1 

jal factrl # now (n - 1)! 

addi $sp, $sp, 8 # reset the stack pointer 
lw $a0, 0($sp) # fetch saved (n - 1) 
lw $ra, 4($sp) # fetch return address 
mul $v0, $a0, $v0 # multiply (n)*(n - 1) 
jr $ra # return value n!