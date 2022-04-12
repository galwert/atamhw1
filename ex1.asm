.global _start

.section .text
_start:

pushq %rbp 
movq %rsp, %rbp
movq (num), %r10		##moving the number to the register
movl $0, CountBits				##initialize counter
movq $0x40, %r11		##counter for loop
LOOP:
cmpq $0, %r11			##loop ended if true
je EXIT
subq $1, %r11			##i-1
sarq $1, %r10			##shift to right by 1
jnc BIT_IS_ZERO
addl $1, CountBits					## we found 1
BIT_IS_ZERO:
jmp LOOP						##continuing to loop
EXIT:
popq %rbp

