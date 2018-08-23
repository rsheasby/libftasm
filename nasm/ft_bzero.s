section .text
    global ft_bzero 

ft_bzero:
; Validate input
    cmp rsi, 0 ; ensure length is not 0
    je end     ;
    cmp rdi, 0 ; ensure pointer is not null
    je end     ;

; Zero the array
    cld          ; go from left to right
    mov rax, rdi ; array pointer
    mov rcx, rsi ; array length
    mov al, 0    ; byte to store
    rep stosb    ; zero the array

end:
    ret ; end
