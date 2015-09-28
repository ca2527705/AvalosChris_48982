/* problem 3 */

.global _start
_start:
	mov r1, #113
	ldr r2, =0x517CC1
	mul r0, r2, r1
	lsr r0, #24
	mov r7, #1
	swi 0

