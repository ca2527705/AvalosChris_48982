/*--printf-1.s*/
.data

/*first message */
.balign 4
message1:.asciz " This is the game of craps! Try to roll the same number twice\n before you roll a 7, or roll a 7 or eleven on your first roll to win instantly!\n If on your second roll, you roll a seven at anytime, then you lose automaticly!\n Enter 1 to begin and roll, enter any other number to exit at any time\n"

/*second message*/
.balign 4
message2:.asciz "Enter 1 to play, 2 to see your odds, and 3 to exit.\nEnter a number: "

.balign 4
message3:.asciz "First dice roll! Lets get started!\n "

.balign 4
message4:.asciz "Good-Bye!\n "

.balign 4
message5:.asciz "You win!\n "

.balign 4
message6:.asciz "You Lose!\n "


/*format parttern for scanf*/
.balign 4
scan_pattern:.asciz"%d"

/*Where scanf will store the number read*/
.balign 4
number_read:.word 0

.balign 4
return:.word 0

.text


.global main
main:
ldr r1, address_of_return	/*r1<-&address_of_return*/
str lr,[r1]	/**r1<-lr*/

ldr r0,address_of_message1	/*r0<-&message1*/
bl printf	/*call to printf*/

firstmessage:
ldr r0,address_of_message2
bl printf
ldr r0, address_of_scan_pattern /*r0<-scan_pattern*/
ldr r1, address_of_number_read /*r1<-&number_read*/
bl scanf	/*call to scanf*/
ldr r0,address_of_number_read
ldr r0,[r0]

cmp r0, #1
bne not_play
beq to_play

to_play:
ldr r0, address_of_message3
bl printf
bl start

cmp r0, #7
beq winner
bne lose

chances:

lose:
ldr r0,address_of_message6
bl firstmessage

winner:
ldr r0, address_of_message5
bl printf

not_play:
ldr r0, address_of_message4
bl printf
ldr lr, address_of_return	/*lr<-&address_of_return*/
ldr lr,[lr]	/*lr<-*lr*/
bx lr	/*return from main using lr*/

address_of_message1:.word message1
address_of_message2:.word message2
address_of_message3:.word message3
address_of_message4:.word message4
address_of_message5:.word message5
address_of_message6:.word message6
address_of_scan_pattern:.word scan_pattern
address_of_number_read:.word number_read
address_of_return:.word return

/*externa*/
.global printf
.global scanf
.global rand
.global ctime
