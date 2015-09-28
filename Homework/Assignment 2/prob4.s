/* problem 4 */
.global _start
_start:
	mov r1, #36
	ldr r2, =0x517CC1
	mul r0, r1, r2
	lsr r0, #24
	mov r7, #1
	swi 0

