section .text
    global ft_isalpha

ft_isalpha:
    cmp rdi, 'A' ;Check if between 'A' and 'z'. If not, result is false.
    jl false
    cmp rdi,'z'
    jg false

    cmp rdi,'Z' ; Otherwise, check if between 'z' and 'A'. If not , result is true.
    jle true
    cmp rdi,'a'
    jge true

    jmp false
true:
    mov rax, 1
    ret
false:
    mov rax, 0
    ret