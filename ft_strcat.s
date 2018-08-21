section .text
    global ft_strcat

ft_strcat:
; Validate input
    cmp rdi, 0 ; ensure dest is not null
    je end
    cmp rsi, 0 ; ensure src is not null
    je end

; Move dest pointer to end of dest
    push rdi   ; preserve dest pointer
    push rsi   ; preserve src pointer
    cld
    mov rcx, 0 ; set rcx to max value
    not rcx
    mov al, 0  ; byte to search for
    repne scasb
    dec rdi    ; move dest pointer to point to null byte

; Get length of src
    xchg rdi, rsi ; swap src and dest pointers
    mov rcx, 0    ; set rcx to max value
    not rcx
    repne scasb
    not rcx       ; length of src including null byte

; Copy src to end of dest
    mov rdi, rsi  ; restore currect dest pointer
    pop rsi       ; restore original src pointer
    rep movsb     ; copy data
    pop rax       ; return initial dest pointer

end:
    ret
