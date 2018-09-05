section .text
    global _ft_strdup

extern _malloc

_ft_strdup:
; Validate input
    cmp rdi, 0 ; ensure string pointer isn't null
    je fail    ;

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
    sub rsp, 8   ; pad stack to 16 bytes
    call _malloc ; allocate memory
    add rsp, 8   ; remove stack padding
    cmp rax, 0   ; ensure malloc didn't fail
    je fail      ;

; Copy string
    pop rcx      ; restore string length
    pop rsi      ; restore original string pointer
    mov rdi, rax ; dest string pointer
    push rdi     ; preserve dest string pointer
    rep movsb    ; copy string

end:
    pop rax ; return dest string
    ret     ; end

fail:
    mov rax, 0 ; return NULL
    ret        ; end
