.data

promptWelcome: .asciiz "-----------------------------------------\n-                                       -\n-                                       -\n-           Guess The Number            -\n-                                       -\n-      Press Enter To Continue...       -\n-----------------------------------------\n"
promptDificulty: .asciiz  "-----------------------------------------\n-                                       -\n-            Choose Difficulty          -\n-              1. easy                  -\n-              2. medium                -\n-              3. hard                  -\n-----------------------------------------\n"		       

promptContinue: .asciiz "Press Enter To Continue... "
promptAskUser1: .asciiz "Guess The 1st Number:\n"
promptAskUser2: .asciiz "Guess The 2nd Number:\n"
promptAskUser3: .asciiz "Guess The 3rd Number:\n"
promptAskUser4: .asciiz "Guess The 4th Number:\n"
promptAskUser5: .asciiz "Guess The 5th Number:\n"
promptAskUser6: .asciiz "Guess The 6th Number:\n"


promptEasy: .asciiz "-----------------------------------------\n-                                       -\n-                                       -\n-            Guess 2 Number             -\n-                                       -\n-      Press Enter To Continue...       -\n-----------------------------------------\n"
promptMedium: .asciiz "-----------------------------------------\n-                                       -\n-                                       -\n-            Guess 4 Number             -\n-                                       -\n-      Press Enter To Continue...       -\n-----------------------------------------\n"
promptHard: .asciiz "-----------------------------------------\n-                                       -\n-                                       -\n-            Guess 6 Number             -\n-                                       -\n-      Press Enter To Continue...       -\n-----------------------------------------\n"


promptCorrect0: .asciiz "0 numbers are in the right spot\n"
promptCorrect1: .asciiz "1 number is in the right spot\n"
promptCorrect2: .asciiz "2 numbers are in the right spot\n"
promptCorrect3: .asciiz "3 numbers are in the right spot\n"
promptCorrect4: .asciiz "4 number are in the right spot\n"
promptCorrect5: .asciiz "5 number are in the right spot\n"

endgame: .asciiz "-----------------------------------------\n-                                       -\n-                                       -\n-                 WINNER!!!             -\n-                                       -\n-      Press Enter To Continue...       -\n-----------------------------------------\n"
attempts1: .asciiz "-----------------------------------------\n-                                       -\n-                                       -\n-        Total Attempts:  "
attempts2: .asciiz "              -\n-                                       -\n-      Press Enter To Continue...       -\n-----------------------------------------\n"

bigspace: .asciiz "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

.text

main:
    li $t0, 0
    li $t9, 0

Welcome:

    la $a0, promptWelcome
    li $v0, 4
    syscall
    
    li $v0, 8
    syscall
    
    la $a0, bigspace
    li $v0, 4
    syscall
    
    la $a0, promptDificulty
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    beq $t1, 1, easy
    beq $t1, 2, medium
    beq $t1, 3, hard


easy:
   	
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound
	
    syscall
    move $s0, $a0
    
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound

    syscall
    move $s1, $a0
   
    
    j easygame
    
easygame:
    
    la $a0, bigspace
    li $v0, 4
    syscall
    
    la $a0, promptEasy
    li $v0, 4
    syscall
    
    li $v0, 8
    syscall
    
    la $a0, bigspace
    li $v0, 4
    syscall
    
   easygame_ret:
   
    addi $t9, $t9, 1
    
    
    la $a0, promptAskUser1
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    la $a0, promptAskUser2
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $t2, $v0
    
    j numbercheckingeasy

numbercheckingeasy:
    beq $s0, $t1, echeck1
    echeck1_ret:
    beq $s1, $t2, echeck2
    echeck2_ret:

    beq $t0, 2, winner
    la $a0, bigspace
    li $v0, 4
    syscall
    
    beq $t0, 0, echecking0
    echecking0_ret:
    beq $t0, 1, echecking1
    echecking1_ret:

    
    li $t0, 0
    j easygame_ret
    
echeck1:
     addi $t0, $t0, 1
     j echeck1_ret  
    
echeck2:
     addi $t0, $t0, 1
     j echeck2_ret  
   
    
echecking0:
    la $a0, promptCorrect0
    li $v0, 4
    syscall
    j echecking0_ret
echecking1:
    la $a0, promptCorrect1
    li $v0, 4
    syscall
    j echecking1_ret
    
    
    
    
medium:
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound

    syscall
    move $s0, $a0
    
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound

    syscall
    move $s1, $a0
    
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound
  
    syscall
    move $s2, $a0
    
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound
   
    syscall
    move $s3, $a0
    
    
    j mediumgame

mediumgame:

    la $a0, bigspace
    li $v0, 4
    syscall
    
    la $a0, promptMedium
    li $v0, 4
    syscall
    
    li $v0, 8
    syscall
    la $a0, bigspace
    li $v0, 4
    syscall
   mediumgame_ret:
    addi $t9, $t9, 1

    
    la $a0, promptAskUser1
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    la $a0, promptAskUser2
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $t2, $v0
    la $a0, promptAskUser3
    li $v0, 4
    syscall
     
    li $v0, 5
    syscall
    move $t3, $v0
    
    la $a0, promptAskUser4
    li $v0, 4
    syscall
     
    li $v0, 5
    syscall
    move $t4, $v0
    
    
    j numbercheckingmedium
       

numbercheckingmedium: 
    beq $s0, $t1, mcheck1
    mcheck1_ret:
    beq $s1, $t2, mcheck2
    mcheck2_ret:
    beq $s2, $t3, mcheck3
    mcheck3_ret:
    beq $s3, $t4, mcheck4
    mcheck4_ret:

    
    beq $t0, 4, winner
    
    la $a0, bigspace
    li $v0, 4
    syscall
    
    beq $t0, 0, mchecking0
    mchecking0_ret:
    beq $t0, 1, mchecking1
    mchecking1_ret:
    beq $t0, 2, mchecking2
    mchecking2_ret:
    beq $t0, 3, mchecking3
    mchecking3_ret:

    
    li $t0, 0
    j mediumgame_ret
    
mcheck1:
     addi $t0, $t0, 1
     j mcheck1_ret  
    
mcheck2:
     addi $t0, $t0, 1
     j mcheck2_ret  

mcheck3:
     addi $t0, $t0, 1
     j mcheck3_ret  
     
mcheck4:
     addi $t0, $t0, 1
     j mcheck4_ret     
    
mchecking0:
    la $a0, promptCorrect0
    li $v0, 4
    syscall
   
    j mchecking0_ret
mchecking1:
    la $a0, promptCorrect1
    li $v0, 4
    syscall
   
    j mchecking1_ret
mchecking2:
    la $a0, promptCorrect2
    li $v0, 4
    syscall
  
    j mchecking2_ret
mchecking3:
    la $a0, promptCorrect3
    li $v0, 4
    syscall
    
    j mchecking3_ret

    

hard:
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound

    syscall
    move $s0, $a0
    
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound

    syscall
    move $s1, $a0
    
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound
  
    syscall
    move $s2, $a0
    
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound
   
    syscall
    move $s3, $a0
    
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound
  
    syscall
    move $s4, $a0
    
    li $a1, 9  #Here you set $a1 to the max bound.
    li $v0, 42  #generates the random number.
    syscall
    add $a0, $a0, 0  #Here you add the lowest bound
   
    syscall
    move $s5, $a0
    
    j hardgame

hardgame:
    la $a0, bigspace
    li $v0, 4
    syscall
    
    la $a0, promptHard
    li $v0, 4
    syscall
    
    li $v0, 8
    syscall
    
    la $a0, bigspace
    li $v0, 4
    syscall
    
   hardgame_ret:
    addi $t9, $t9, 1
    
    la $a0, promptAskUser1
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    la $a0, promptAskUser2
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $t2, $v0
    la $a0, promptAskUser3
    li $v0, 4
    syscall
     
    li $v0, 5
    syscall
    move $t3, $v0
    
    la $a0, promptAskUser4
    li $v0, 4
    syscall
     
    li $v0, 5
    syscall
    move $t4, $v0
    
    la $a0, promptAskUser5
    li $v0, 4
    syscall
     
    li $v0, 5
    syscall
    move $t5, $v0
    
    la $a0, promptAskUser6
    li $v0, 4
    syscall
     
    li $v0, 5
    syscall
    move $t6, $v0
    
    
    j numbercheckinghard
       

numbercheckinghard: 
    beq $s0, $t1, hcheck1
    hcheck1_ret:
    beq $s1, $t2, hcheck2
    hcheck2_ret:
    beq $s2, $t3, hcheck3
    hcheck3_ret:
    beq $s3, $t4, hcheck4
    hcheck4_ret:
    beq $s4, $t5, hcheck5
    hcheck5_ret:
    beq $s5, $t6, hcheck6
    hcheck6_ret:

    
    beq $t0, 6, winner
    
    la $a0, bigspace
    li $v0, 4
    syscall
    
    beq $t0, 0, hchecking0
    hchecking0_ret:
    beq $t0, 1, hchecking1
    hchecking1_ret:
    beq $t0, 2, hchecking2
    hchecking2_ret:
    beq $t0, 3, hchecking3
    hchecking3_ret:
    beq $t0, 4, hchecking4
    hchecking4_ret:
    beq $t0, 5, hchecking5
    hchecking5_ret:

    
    
    li $t0, 0
    j hardgame_ret
    
hcheck1:
     addi $t0, $t0, 1
     j hcheck1_ret  
    
hcheck2:
     addi $t0, $t0, 1
     j hcheck2_ret  

hcheck3:
     addi $t0, $t0, 1
    j hcheck3_ret  
hcheck4:
     addi $t0, $t0, 1
     j hcheck4_ret
hcheck5:
     addi $t0, $t0, 1
     j hcheck5_ret  
hcheck6:
     addi $t0, $t0, 1
     j hcheck6_ret
      
    
hchecking0:
    la $a0, promptCorrect0
    li $v0, 4
    syscall
  
    j hchecking0_ret
hchecking1:
    la $a0, promptCorrect1
    li $v0, 4
    syscall
    
    j hchecking1_ret
hchecking2:
    la $a0, promptCorrect2
    li $v0, 4
    syscall
    
    j hchecking2_ret
hchecking3:
    la $a0, promptCorrect3
    li $v0, 4
    syscall
    
    j hchecking3_ret
hchecking4:
    la $a0, promptCorrect4
    li $v0, 4
    syscall
    
    j hchecking4_ret
hchecking5:
    la $a0, promptCorrect5
    li $v0, 4
    syscall
    
    j hchecking5_ret

	
	
winner:
    la $a0, bigspace
    
    la $a0, endgame
    li $v0, 4
    syscall
    
    li $v0, 8
    syscall
    
    la $a0, bigspace
    
    la $a0, attempts1
    li $v0, 4
    syscall
    
    move $a0, $t9
    li $v0, 1
    syscall
    
    la $a0, attempts2
    li $v0, 4
    syscall
    
    li $v0, 10
    syscall
   
