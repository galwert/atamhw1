.global _start

.section .text
_start:
 
pushq %rbp 
movq %rsp, %rbp
movq $0, %rdx # rdx = last number array1
movq $0, %r10 # r10 = iterator for array1
movq $0, %r15 # r15 = iterator for array2
movq $0, %rax	# rax = counter for merged_arr		
movq $(array1), %rbx			# rbx = array1
movq $(array2), %rcx			# rcx = array2

movl $0, %r12d			# a register saving the last number added to the new array
movq $(mergedArray), %r14 # r14 = mergedArr 

Loop:
movl (%rbx, %r10, 4), %edx # edx = arr1[j]
movl (%rcx, %r15, 4), %r13d # r13 = arr2[k]
movl $0, %r11d
addl %r13d, %r11d
addl %edx, %r11d
cmpl $0, %r11d
je Exit
cmpl $0, %r13d
je L0

cmp %r13, %rdx
jge L0
# edx < r13d / write r13d
movl %r13d, %r12d # save last number
inc %r15
jmp Write
L0: # edx >= r13d / write edx
movl %edx, %r12d # save last number
inc %r10
Write:
cmpl %r12d, -4(%r14, %rax, 4) # compare previous element to current
je Loop
movl %r12d, (%r14, %rax, 4) # mergedArr[i] = r12
inc %rax # rax++
jmp Loop


Exit:
movl $0, (%r14, %rax, 4) # mergedArr[i+1] = 0


