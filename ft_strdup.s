section .text
    global ft_strdup

extern malloc

ft_strdup:
    push rdi
    mov al, 0
    mov rcx, 0
    not rcx
    cld
    repne scasb
    not rcx

    mov rdi, rcx
    push rcx
    call malloc
    pop rcx
    pop rsi
    mov rdi, rax
    rep movsb
    ret
    