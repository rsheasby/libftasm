section .text
    global ft_puts

ft_puts:
; Validate input
    mov rax, -1 ; if validation fails, return -1 (EOF)
    cmp rdi, 0 ; ensure string pointer isn't null
    je end

; Get length of string
    push rdi    ; preserve original pointer
    cld         ; move from left to right
    mov rcx, 0  ; set rcx to max value
    not rcx
    mov al, 0   ; byte to search for
    repne scasb ; scan for end
    not rcx
    dec rcx     ; length of string excluding null byte

; Print out string
    mov rax, 1   ; use "write" syscall
    mov rdi, 1   ; write to stdout
    pop rsi      ; restore original string pointer
    mov rdx, rcx ; length of string
    syscall      ; print out string

; Print newline
    mov rax, 1    ; use "write" syscall
    mov rsi, `\n` ; push newline to stack
    push rsi
    mov rdx, 1    ; write 1 byte
    mov rsi, rsp  ; pointer to byte on stack
    syscall       ; write out char
    add rsp, 8    ; move stack pointer back

end:
    ret        ; end
