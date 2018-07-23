section .text
    global ft_tolower

ft_tolower:
    cmp rdi, 'A' ;Check if between 'A' and 'Z'. If not, return original value.
    jl end
    cmp rdi, 'Z'
    jg end

    add rdi, 32 ;Otherwise, subtract by 32 to convert to upper case.
end:
    mov rax, rdi
    ret