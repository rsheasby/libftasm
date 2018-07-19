section .text
    global ft_bzero 

ft_bzero:
    cmp rsi, 0 ;if array length 0 or less, end
    jle end
    cmp rdi, 0 ;if null pointer, end
    je end
    mov rax, rdi ;move array pointer to rax
    mov rcx, rsi ;move array length to rcx
l1:
    mov byte[rax], 0 ;zero out byte
    inc rax
    loop l1 ;loop while length is greater than 0
end:
    ret