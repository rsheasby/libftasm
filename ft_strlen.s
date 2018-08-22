section .text
    global ft_strlen

ft_strlen:
; Validate input
    mov rax, -1 ; return -1 if string is invalid.
    cmp rdi, 0  ; ensure string pointer isn't null
    je end

; Get length of string
    mov al, 0    ; byte to search for
    mov rcx, 0   ; set rcx to max value
    not rcx
    cld          ; move from left to right
    repne scasb  ; scan for end
    not rcx
    dec rcx      ; length of string excluding null byte
    mov rax, rcx ; move length into return value

end:
    ret