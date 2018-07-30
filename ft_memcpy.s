section .text
    global ft_memcpy

ft_memcpy:
    mov rcx, rdx
    cld
    rep movsb
    ret