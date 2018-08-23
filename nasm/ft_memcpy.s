section .text
    global ft_memcpy

ft_memcpy:
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
    ret ; end