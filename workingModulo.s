    .data
	.align 2
	
	input1:  	.asciiz "\nEnter a number>"
    input2:	    .asciiz "\nEnter a second number>"
    message:    .asciiz "\nThe modulo is " 
	
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
	   
	    li $t3, 0;
        li $t4, 0;	  
	   
	    jal LOOP
	    
	LOOP: 
	
	    mult $t3, $t1;
	    mflo $t4;
	    sub $t4, $t0, $t4;
	    
	    bltz $t4, MODULO
	    
	    addi $t3, $t3, 1;
	   
	    jal LOOP ;
	    
        
     
    
	
	    
	MODULO: 
	
	  
	  subi $t5, $t3, 1;
	  mult $t5, $t1;
	  mflo $t5;
	  sub $t5, $t0, $t5;
	
	#currently in $t0 and $t1
	#need to do a counter $t3
	#

	    
	EUCLIDS: nop;
	    
    PRINT: 
        li $v0, 4;
            la $a0, message;
        syscall;
        
        
        li $v0,1;
         move $a0, $t5;
        syscall;
        
    EXIT:
        li $v0, 10;
        syscall;
	    