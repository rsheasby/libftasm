section .text
    global _ft_toupper

_ft_toupper:
    cmp rdi, 'a' ; check if between 'a' and 'z'. If not, return original value.
    jl end       ;
    cmp rdi, 'z' ;
    jg end       ;

    sub rdi, 32 ; otherwise, subtract by 32 to convert to upper case.

end:
    mov rax, rdi ; return value
    ret          ; end