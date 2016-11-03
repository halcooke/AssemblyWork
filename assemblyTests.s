    .data
	.align 2
	
	input1:  	.asciiz "\nEnter a number>"
    input2:	    .asciiz "\nEnter a second number>"
    message:    .asciiz "\nThe total is " 
	
	.text
	.globl main
	
	main:
	
	INPUT:
	    #First input
	    li $v0, 4           ;
	        la $a0,input1   ;
	    syscall             ;
	        li $v0, 5       ;
	    syscall             ;
	        move $t0, $v0   ;
	        
	    li $v0, 4           ;
	        la $a0,input2   ;
	    syscall             ;
	        li $v0, 5       ;
	    syscall             ;
	        move $t1, $v0   ;
	   
	    
	  
	   
	    jal PRINT
	    
	
	  
	
	
	
	
	#currently in $t0 and $t1
	#need to do a counter $t3
	#
	

	
	

	    
	    EUCLIDS: nop;
	    
    PRINT: 
        li $v0, 4
        la $a0, message
        syscall
        
    
        mult $t0, $t1
        
        mfhi $t3
        mflo $t4
        
        li $v0,1
         move $a0, $t4
         
        syscall
        
    EXIT:
        li $v0, 10
        syscall
	    