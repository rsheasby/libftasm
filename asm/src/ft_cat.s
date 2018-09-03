section .text
    global _ft_cat

extern malloc
extern free

_ft_cat:
; Validate input
    cmp rdi, -1 ; ensure fd is not -1
    je end      ;

; Allocate memory
    push r12 ; save callee-saved registers
    push r13 ;

    mov r13, rdi ; preserve file descriptor
    mov rdi, 256 ; how many bytes to allocate
    call malloc  ; allocate memory
    mov r12, rax ; put buffer pointer in r12

l1:
; Read from file to buffer
    mov rdi, r13 ; get fd
    mov rsi, r12 ; get buffer
    mov rdx, 256 ; read up to 256 bytes
    mov rax, 0   ; use "read" syscall
    syscall      ; read string

; Write from buffer to stdout
    mov rdi, 1   ; write to stdout
    mov rsi, r12 ; get buffer
    mov rdx, rax ; get length read
    mov rax, 1   ; use "write" syscall
    syscall      ; write string

; Loop
    cmp rax, 256 ; check if 256 bytes written
    je l1        ; if so, jump back

; Cleanup
    mov rdi, r12 ; get buffer pointer
    call free    ; free buffer
    pop r13      ; restore callee-saved registers
    pop r12      ;

end:
    ret ;end
