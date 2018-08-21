section .text
    global ft_isdigit

ft_isdigit:
    cmp rdi, '0' ; check if between '0' and '9'. If not, result is false.
    jl false
    cmp rdi,'9'
    jg false

true:
    mov rax, 1
    ret

false:
    mov rax, 0
    ret