section .text
    global ft_cat

extern malloc
extern free

ft_cat:
    push r12 ; save callee-saved registers
    push r13 ; ^

    mov r13, rdi ; save file descriptor

    mov rdi, 256 ; allocate buffer of 256 bytes
    call malloc  ; ^
    mov r12, rax ; put buffer pointer in r12

l1:
    mov rdi, r13 ; get fd
    mov rsi, r12 ; get buffer
    mov rdx, 256 ; read up to 256 bytes
    mov rax, 0   ; use "read" syscall
    syscall

    mov rdi, 1   ; write to stdout
    mov rsi, r12 ; get buffer
    mov rdx, rax ; get length read
    mov rax, 1   ; use "write" syscall
    syscall

    cmp rax, 256 ; check if 256 bytes written
    je l1        ; if so, jump back

    mov rdi, r12 ; free buffer
    call free    ; ^

    pop r13 ; restore callee-saved registers
    pop r12 ; ^

    ret ;end
