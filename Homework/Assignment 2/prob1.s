/* second problem */

.global _start
_start:

	MOV R1, #110
	LDR R2, =0X517CC1
	MUL R0, R1, R2
	LSR R0, #24
	MOV R7, #1
	SWI 0
