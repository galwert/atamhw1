.global _start

.section .text
_start:
movq $0, %r12
movl (num), %eax	# moving the third parameter to the stack
cmpl $0, %eax
jl L0					# checking if the number is positve or negitive
movq $(source), %rbx		# #moving the addresses to the register
movq $(destination),  %rcx
jmp L1
L0:
movq $(source), %rcx		# moving the addresses to the register
movq $(destination), %rbx			# we got negetive thrid paramater, so we switch the src and dest and mult the number by -1
imul $-1, %eax
L1:
#subl num, %rsp      # allocate num bytes on stack
L5:
cmpq %r12, %rax # check i < num
je L4 
movb (%rbx, %r12), %dl
movb %dl, (%rsp, %r12)
inc %r12
jmp L5
L4:
movq $0, %r12
L2:
cmpq %r12, %rax
je L3
movb (%rsp, %r12), %dl
movb %dl, (%rcx, %r12)
inc %r12
jmp L2						            # continuing to loop
L3:

