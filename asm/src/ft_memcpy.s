section .text
    global _ft_memcpy

_ft_memcpy:
    push rdi ; preserve original dst pointer

; Validate input
    cmp rdi, 0 ; ensure dest is not null
    je end     ;
    cmp rsi, 0 ; ensure src is not null
    je end     ;
    cmp rdx, 0 ; ensure len is not null
    je end     ;

; Copy memory
    mov rcx, rdx ; how many bytes to copy
    cld          ; move from left to right
    rep movsb    ; copy bytes

end:
    pop rax ; return dst pointer
    ret     ; end