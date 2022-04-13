.global _start

.section .text
_start:
movq $head, %rax
cmpq $0, (%rax)
je Exit
movq (%rax), %rax
movq $(dst), %rcx               # stroing the adrress of the new node in register
movq (%rcx), %rcx 
movq $(src), %rbx               # stroing the adrress of the new node in register
movq (%rbx), %rbx 
cmpq %rcx, %rbx 
je Exit
movq $0, %r9
movq $0, %r10


Iteration:
cmpq $0, %rax
je Finished
movq (%rax), %rdx
cmpq %rdx, %rbx
je Found_Src
cmpq %rdx, %rcx
je Found_Dst
movq %rax, %r8
leaq 8(%rax), %rax
movq (%rax), %rax
jmp Iteration

Found_Src:
cmpq $0, %r9
jne Exit
movq %r8, %r9
cmpq $0, %r8
jne src_not_head
movq $-1, %r9

src_not_head:
movq %rax, %r8
leaq 8(%rax), %rax
movq (%rax), %rax
jmp Iteration

Found_Dst:
cmpq $0, %r10
jne Exit
movq %r8, %r10
cmpq $0, %r8
jne dst_not_head
movq $-1, %r10

dst_not_head:
movq %rax, %r8
leaq 8(%rax), %rax
movq (%rax), %rax
jmp Iteration

Finished:
cmpq $-1, %r9
je src_is_head
cmpq $-1, %r10
je dst_is_head
cmpq $0, %r9
je Exit
cmpq $0, %r10
je Exit

leaq 8(%r10), %r10
leaq 8(%r9), %r9

second_switch:
movq (%r10), %r12
movq (%r9), %r13
leaq 8(%r13), %r13
leaq 8(%r12), %r12
movq (%r10), %rax
movq (%r9), %rbx
movq %rax, (%r9)
movq %rbx, (%r10)

movq (%r12), %rax
movq (%r13), %rbx
movq %rax, (%r13)
movq %rbx, (%r12)

jmp Exit
src_is_head:
movq $(head), %r12
movq (%r12), %r12
movq (%r12), %r12
cmpq %r12, %rbx
jne Exit

leaq 8(%r10), %r10
movq $(head), %r9
jmp second_switch

dst_is_head:
movq $(head), %r12
movq (%r12), %r12
movq (%r12), %r12
cmpq %r12, %rcx
jne Exit

leaq 8(%r9), %r9
movq $(head), %r10
jmp second_switch
Exit:
