.data

.balign 4
message1:.asciz"Insert your hours:"

.balign 4
message3:.asciz"Insert your pay:"

.balign 4
message2:.asciz"%d the number %d\n"

.balign 4
scan_pattern:.asciz"%d"

.balign 4
number_read:.word 0

.balign 4
number_read2:.word 0

.balign 4
return:.word 0

.balign 4
return2:.word 0

.text

pay_check:
	ldr r3, address_of_return2
	str lr,[r3]

	mul r0,r0,r1

	ldr lr,address_of_return2
	ldr lr,[lr]
	bx lr
address_of_return2:.word return2


.global main
main:

	ldr r1, address_of_return
	str lr, [r1]

	ldr r0, address_of_message1
	bl printf

	ldr r0, address_of_scan_pattern
	ldr r1, address_of_number_read
	bl scanf
	
	ldr r0, address_of_message3
	bl printf

	ldr r0, address_of_scan_pattern
	ldr r2, address_of_number_read2
	bl scanf

	ldr r0,address_of_number_read
	ldr r1,address_of_number_read2
	ldr r0,[r0]
	ldr r1,[r1]
	bl pay_check


	mov r2,r0
	ldr r1,address_of_number_read
	ldr r1,[r1]
	ldr r0,address_of_message2 
	bl printf

	ldr lr, address_of_return
	ldr lr,[lr]
	bx lr 
address_of_message1:.word message1
address_of_message2:.word message2
address_of_message3:.word message3
address_of_scan_pattern:.word scan_pattern
address_of_number_read:.word number_read
address_of_number_read2:.word number_read2
address_of_return:.word return

/*external*/
.global printf
.global scanf
