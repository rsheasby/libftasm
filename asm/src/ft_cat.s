section .text
    global _ft_cat

extern _malloc
extern _free

_ft_cat:
; Validate input
    cmp edi, -1 ; ensure fd is not -1
    je end      ;

; Allocate memory
    push r12   ; save callee-saved registers
    push r13   ;
    sub rsp, 8 ; pad stack to 16 bytes

    mov r13, rdi ; preserve file descriptor
    mov rdi, 256 ; how many bytes to allocate
    call _malloc ; allocate memory
    mov r12, rax ; put buffer pointer in r12

l1:
; Read from file to buffer
    mov rdi, r13       ; get fd
    mov rsi, r12       ; get buffer
    mov rdx, 256       ; read up to 256 bytes
    mov rax, 0x2000003 ; use "read" syscall
    syscall            ; read string

; Write from buffer to stdout
    mov rdi, 1         ; write to stdout
    mov rsi, r12       ; get buffer
    mov rdx, rax       ; get length read
    mov rax, 0x2000004 ; use "write" syscall
    syscall            ; write string

; Loop
    cmp rax, 0 ; check file is still open
    jne l1     ; if so, jump back

; Write newline
    mov byte [r12], `\n` ; put newline in buffer
    mov rdi, 1           ; write to stdout
    mov rsi, r12         ; get buffer
    mov rdx, 1           ; write one char
    mov rax, 0x2000004   ; use "write" syscall
    syscall              ; write string

; Cleanup
    mov rdi, r12 ; get buffer pointer
    call _free   ; free buffer

    add rsp, 8   ; remove padding from stack
    pop r13      ; restore callee-saved registers
    pop r12      ;

end:
    ret ;end
