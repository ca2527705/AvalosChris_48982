/*inches to feet */

.global _start
_start:
	MOV r1, #108
	ldr r2, =0x155556
	mul r0,r2,r1
	lsr r0, #24
	mov r7, #1
	swi 0

