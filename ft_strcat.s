section .text
    global ft_strcat

ft_strcat: ;set values for write syscall
    mov rsi, rdi ;buffer pointer
    mov rdx, 0 ;string length
    mov rdi, 1 ;file descriptor
    mov rax, 1 ;use sys_write
strlen: ;count length of string.
    cmp byte [rsi + rdx], 0 ;check if byte null
    je strlen_end ;if it is, end
    inc rdx ;otherwise, increment counter
    jmp strlen ;and loop
strlen_end:
    syscall ;ask kernel to write out string
    ret ;end
