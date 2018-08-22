section .text
    global ft_isalnum

ft_isalnum:
    cmp rdi, '0'  ; check if between '0' and '9'. If not, check for alpha.
    jl false      ;
    cmp rdi, '9'  ;
    jg ft_isalpha ;

    jmp true ;

ft_isalpha:
    cmp rdi, 'A' ; check if between 'A' and 'z'. If not, result is false.
    jl false     ;
    cmp rdi, 'z' ;
    jg false     ;

    cmp rdi, 'Z' ; otherwise, check if between 'z' and 'A'. If not , result is true.
    jle true     ;
    cmp rdi, 'a' ;
    jge true     ;

    jmp false ;

true:
    mov rax, 1 ; return true
    ret        ; end

false:
    mov rax, 0 ; return false
    ret        ; end