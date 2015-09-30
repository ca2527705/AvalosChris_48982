/*problem 5 */

.global _start

_start:
	ldr r1, =0x2A40
	ldr r2, =0x324924
	mul r0, r2, r1
	lsr r0, #20
	mov r7, #1
	swi 0
