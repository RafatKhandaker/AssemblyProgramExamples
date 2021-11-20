# Computer Organizations Homework Module 5
# By: Rafat Khandaker
# Date: 10/03/2021

# Initialize Data Constants
.data
prompt: .asciiz "Please Enter an Integer Value Between 1 & 100: "
prompt2: .asciiz "\nYou Wrote: "
prompt3: .asciiz "\n The Result of Squares is: "


# Enter Start MIPS COde
.text
# Main Program 
main:
	# Print Prompt To User to Enter Integer Value
	li $v0, 4
	la $a0, prompt
	syscall
	
	# Store Input as Number
	li $v0, 5
	syscall
	
	# Move $V0 into Temporary Register
	move $t1, $v0
	
	# Print Prompt 2 to display entered value
	li $v0, 4
	la $a0, prompt2
	syscall
	
	# Display Number as entered value
	li $v0, 1
	move $a0, $t1
	syscall
	
	# Initialize Loop End Counter And Input Variable
	li $t0, 100
	li $t4, 0  # Store Result 
	
	loop: 
		bgt $t1, $t0, end  # Validate if t1 < t0 then end the loop
		
		mul $t2, $t1, $t1  # Calculate The Square Of Current Iteration
		add $t4, $t4, $t2 # Add the Square to Result
		
		addi $t1, $t1, 1  # Increment Loop  Start
		j loop
	end: 
	
	# Print the Result 
	li $v0, 4
	la $a0, prompt3
	syscall
	
	# Print calculated Result
	li $v0, 1
	move $a0, $t4
	syscall
	
	# Exit Program
	li $v0, 10
	syscall