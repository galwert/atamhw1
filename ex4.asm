.global _start

.section .text
_start:


movq $root, %rax               # stroing the adrress of the root in register
cmpq $0, (%rax)
je Exit
movq (%rax), %rax
mov $(new_node), %rcx               # stroing the adrress of the new node in register
mov (%rcx), %rcx 

Iteration:
                # found the value of the node
movq (%rax), %rbx
cmpq %rbx, %rcx                 # comparing the value in the node to the new number
je Found
jl Go_Left
leaq 16(%rax), %rax
cmpq $0, (%rax)
je Exit
movq (%rax), %rax
jmp Iteration
Go_Left:
leaq 8(%rax), %rax
cmpq $0, (%rax)
je Exit
movq (%rax), %rax
jmp Iteration
Exit:
movq $(new_node), %rbx
movq %rbx, (%rax)
Found:
