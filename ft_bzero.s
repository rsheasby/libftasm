section .text
    global ft_bzero 

ft_bzero:
; Validate input
    cmp rsi, 0 ; ensure length is greater than 0
    jle end
    cmp rdi, 0 ; ensure pointer is not null
    je end

; Zero the array
    mov rax, rdi ; array pointer
    mov rcx, rsi ; array length
    mov al, 0    ; byte to store
    rep stosb
end:
    ret
