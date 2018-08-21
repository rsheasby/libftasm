section .text
    global ft_isascii

ft_isascii:
    cmp rdi, 0 ; check if between 0 and 127. If not, result is false.
    jl false
    cmp rdi, 127
    jg false

true:
    mov rax, 1
    ret

false:
    mov rax, 0
    ret