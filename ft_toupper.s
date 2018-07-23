section .text
    global ft_toupper

ft_toupper:
    cmp rdi, 'a' ;Check if between 'a' and 'z'. If not, return original value.
    jl end
    cmp rdi, 'z'
    jg end

    sub rdi, 32 ;Otherwise, subtract by 32 to convert to upper case.
end:
    mov rax, rdi
    ret