section .text
    global ft_memset

ft_memset:
    mov ax, si
    mov rcx, rdx
    cld
    rep stosb
    ret