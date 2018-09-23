section .text
    global _ft_puts
    default rel

_ft_puts:
; Validate input
    cmp rdi, 0  ; ensure string pointer isn't null
    je null     ;

; Get length of string
    push rdi    ; preserve original pointer
    cld         ; move from left to right
    mov rcx, 0  ; set rcx to max value
    not rcx     ;
    mov al, 0   ; byte to search for
    repne scasb ; scan for end
    not rcx     ;
    dec rcx     ; length of string excluding null byte

; Print out string
    mov rax, 0x2000004 ; use "write" syscall with unix offset
    mov rdi, 1         ; write to stdout
    pop rsi            ; restore original string pointer
    mov rdx, rcx       ; length of string
    push rdx           ;
    syscall            ; print out string
    pop rdx            ;
    cmp rax, rdx       ; ensure the entire string printed correctly
    jne fail           ;

; Print newline
    mov rax, 0x2000004 ; use "write" syscall with unix offset
    mov rsi, `\n`      ; push newline to stack
    push rsi           ;
    mov rdx, 1         ; write 1 byte
    mov rsi, rsp       ; pointer to byte on stack
    mov rdi, 1         ; write to stdout
    push rdx           ;
    syscall            ; write out char
    add rsp, 8         ; move stack pointer back
    pop rdx            ;
    cmp rax, rdx       ; ensure the entire string printed correctly
    jne fail           ;

end:
    mov rax, 1 ; return 1 on success
    ret        ; end

fail:
    mov rax, -1 ; return -1 on error
    ret         ; end

null:
    mov rax, 0x2000004  ; use "write" syscall with unix offset
    mov rdi, 1          ; write to stdout
    lea rsi, [null_str] ; pointer to string message
    mov rdx, 7          ; length of string
    syscall             ; print out string
    jmp fail            ; return -1

section .data

null_str: db '(null)', 0xA ; string to write on receiving a null pointer