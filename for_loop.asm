section .data
    msg db 'For loop: ', 0Ah
    msg_len equ $-msg
    digit db '0', 0Ah

section .bss
    count resb 1

section .text
    global _start

_start:
    ; Print message
    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, msg        ; message to write
    mov rdx, msg_len    ; message length
    syscall             ; call kernel

    ; Initialize loop counter
    mov byte [count], 0

for_loop:
    ; Loop condition
    mov al, [count]
    cmp al, 10
    jge end_for_loop

    ; Body of the loop: Print the current counter
    movzx rax, byte [count]
    add rax, '0'        ; convert to ASCII
    mov [digit], al

    mov rax, 1          ; sys_write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, digit      ; digit to write
    mov rdx, 2          ; digit length (including newline)
    syscall             ; call kernel

    ; Increment loop counter
    inc byte [count]
    jmp for_loop

end_for_loop:
    ; Exit program
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall             ; call kernel
