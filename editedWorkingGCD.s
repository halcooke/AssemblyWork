    .data
	.align 2
	
	input1:  	.asciiz "\nEnter a number>"
    input2:	    .asciiz "\nEnter a second number>"
    message:    .asciiz "\nThe GCD is " 
	
	.text
	.globl main
	
	main:
	    
	GCD: 
        
        li $v0, 4           ;
	        la $a0,input1   ;
	    syscall             ;
	        li $v0, 5       ;
	    syscall             ;
	       move $a1, $v0    ;
	        
	    li $v0, 4           ;
	        la $a0,input2   ;
	    syscall             ;
	        li $v0, 5       ;
	    syscall             ;
	        move $a2, $v0   ;	
	
	
	    beq $a2, $zero, EXIT;
	    
		jal REC

	   
	    
	 EXIT:
	 
	
	 
	  li $v0, 4 ;
 	    la $a0, message ;
	  syscall ;
	  
	  li $v0, 1;
	     move $a0, $a1;
      syscall;
      li $v0, 10
        syscall;
	     
	
	#modulo puts the result in $t5 we are given $t0 and $t1
	#will put final result in $v0
	# gonna have to use $a0 and $a1 for arguaments i guess
	
	REC:
	  
	  
	  #  addi	$sp,$sp,-12	; 
	  # sw	$ra,0($sp)	; # push ra onto stack
	    li $t3, 0;
	    li $t4, 0;
	    li $t5, 0;
	    #gonna have to save $a2 here then take it out again
	    
	    #saves current a1
	    addi $sp, $sp, -4;
	    sw $a2,0($sp);
	    
	    jal LOOP 
	    
	    #loads previous a2 into a1
	    lw $a1, 0($sp);
	    addi $sp, $sp, 4;
	    
	    #say this returns just the modulo of $a0 and $a1
	    j GCD;


	LOOP: 
	
	    mult $t3, $a2;
	    mflo $t4;
	    sub $t4, $a1, $t4;
	    
	    bltz $t4, MODULO
	    
	    addi $t3, $t3, 1;
	   
	    j LOOP ;
        
     
	MODULO: 
	
	  li $t5, 0;
	  subi $t5, $t3, 1;
	  mult $t5, $a2;
	  mflo $t5;
	  sub $a2, $a1, $t5;
      jr $ra
    	   
    	   
    	    
    PRINT: 
        li $v0, 4;
            la $a0, message;
        syscall;
        
        
        li $v0,1;
         move $a0, $t5;
        syscall;
        
