section .text
    global ft_tolower

ft_tolower:
    cmp rdi, 'A' ; check if between 'A' and 'Z'. If not, return original value.
    jl end       ;
    cmp rdi, 'Z' ;
    jg end       ;

    add rdi, 32 ; otherwise, sum by 32 to convert to upper case.

end:
    mov rax, rdi ; return value
    ret          ; end