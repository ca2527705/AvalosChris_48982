/* -- randTest.s */
.data

message: .asciz "You rolled a %d\n"

message2:.asciz "Combined that gives you %d\n"

message3:.asciz "You Win!\n"

message4:.asciz "You Lose, sorry!\n"

message5:.asciz "Roll again!\n"

message6:.asciz "You need to roll a %d\n"

.text

.global start
start:
    push {r4,lr}                 /* Push lr onto the top of the stack */

    mov r0,#0                    /* Set time(0) */
    bl time                      /* Call time */
    bl srand                     /* Call srand */
  loop_rand:                     /* Create a 1 digit random number */
	bl rand                      /* Call rand */
	mov r1,r0,ASR #1             /* In case random return is negative */
	mov r2,#6                   /* Move 6 to r2 */
		                         /* We want rand()%6+1 so cal divMod with rand()%6 */
	bl divMod                    /* Call divMod function to get remainder */
	add r1,#1                   /* Remainder in r1 so add 6 giving between 1-6 -> 2 digits*/
	mov r5,r1
    ldr r0, address_of_message   /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
  loop_rand2:                     /* Create a 1 digit random number */
        bl rand                      /* Call rand */
        mov r1,r0,ASR #1             /* In case random return is negative */
        mov r2,#6                   /* Move 6 to r2 */
                                         /* We want rand()%6+1 so cal divMod with rand()%6 */
        bl divMod                    /* Call divMod function to get remainder */
        add r1,#1                   /* Remainder in r1 so add 6 giving between 1-6 -> 2 digits$*/
   	mov r6,r1
    ldr r0, address_of_message   /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */

	add r7,r6,r5
	add r1,r6,r5
	ldr r0, address_of_message2
        bl printf

	cmp r7, #7
	beq winner
	cmp r7, #11
	beq winner
	cmp r7, #2
	beq loser
	cmp r7, #12
	beq loser
	blt again

again:
ldr r0, address_of_message5
bl printf

        mov r1,r7
        ldr r0, address_of_message6
        bl printf
  loop_rand3:                     /* Create a 1 digit random number */
        bl rand                      /* Call rand */
        mov r1,r0,ASR #1             /* In case random return is negative */
        mov r2,#6                   /* Move 6 to r2 */
                                         /* We want rand()%6+1 so cal divMod with rand()%6 */
        bl divMod                    /* Call divMod function to get remainder */
        add r1,#1                   /* Remainder in r1 so add 6 giving between 1-6 -> 2 digits*/
        mov r5,r1
    ldr r0, address_of_message   /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */
  loop_rand4:                     /* Create a 1 digit random number */
        bl rand                      /* Call rand */
        mov r1,r0,ASR #1             /* In case random return is negative */
        mov r2,#6                   /* Move 6 to r2 */
                                         /* We want rand()%6+1 so cal divMod with rand()%6 */
        bl divMod                    /* Call divMod function to get remainder */
        add r1,#1                   /* Remainder in r1 so add 6 giving between 1-6 -> 2 digits$*/
        mov r6,r1
    ldr r0, address_of_message   /* Set &message2 as the first parameter of printf */
    bl printf                    /* Call printf */

        add r8,r6,r5
        add r1,r6,r5
        ldr r0, address_of_message2
        bl printf

	cmp r8, #7
	beq loser
	cmp r8, r7
	beq winner
	blt again
	bgt again

winner:
ldr r0, address_of_message3
bl printf

     pop {r4,lr}
     bx lr

loser:
ldr r0, address_of_message4
bl printf


    pop {r4,lr}                     /* Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */

address_of_message: .word message
address_of_message2: .word message2
address_of_message3: .word message3
address_of_message4: .word message4
address_of_message5: .word message5
address_of_message6: .word message6



/*External Functions*/
.global printf
.global time
.global srand
.global rand
