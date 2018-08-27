section .text
    global ft_memset

ft_memset:
; Validate input
    push rdi   ; preserve original memory pointer
    cmp rdi, 0 ; ensure string pointer isn't null
    je end     ;

    mov ax, si   ; character to write
    mov rcx, rdx ; length of memory to write
    cld          ; move from left to right
    rep stosb    ; write bytes

end:
    pop rax ; restore original memory pointer
    ret     ; end