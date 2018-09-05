section .text
    global _ft_strdup

extern _malloc

_ft_strdup:
; Validate input
    cmp rdi, 0 ; ensure string pointer isn't null
    je end     ;

; Get length of string
    push rdi    ; preserve original string pointer
    cld         ; move from left to right
    mov rcx, 0  ; set rcx to max value
    not rcx     ;
    mov al, 0   ; byte to search for
    repne scasb ; scan for end
    not rcx     ; length of string including null byte

; Allocate new memory
    mov rdi, rcx ; how many bytes to allocate
    push rcx     ; preserve string length
    call _malloc  ; allocate memory

; Copy string
    pop rcx      ; restore string length
    pop rsi      ; restore original string pointer
    mov rdi, rax ; dest string pointer
    rep movsb    ; copy string

end:
    ret ; end
