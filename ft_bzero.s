section .text
    global ft_bzero 

ft_bzero:
    cmp rsi, 0 ; ensure length is greater than 0
    jle end
    cmp rdi, 0 ; ensure pointer is not null
    je end
    mov rax, rdi ; array pointer
    mov rcx, rsi ; array length
l1:
    mov byte[rax], 0 ; zero out byte
    inc rax
    loop l1 ;loop while length is greater than 0
end:
    ret