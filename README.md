# Looping in Assembly Language

This repository contains examples of assembly language programs demonstrating the use of `for`, `while`, and `do-while` loops. The examples are written in x86-64 assembly and are intended to be run in a Linux environment.

## Files

- `for_loop.asm` - Example of a `for` loop in assembly.
- `while_loop.asm` - Example of a `while` loop in assembly.
- `do_while_loop.asm` - Example of a `do-while` loop in assembly.


## For Loop

## While Loop

## Do-While Loop



## Setup and Running on these programs

You can run these programs on Replit [here](https://replit.com/@AljonFernando/Assembly-x64?v=1)
You can also run these on online compiler by copy & pasting the code

## Assembly Loops Examples


### For Loop

[Replit](https://replit.com/@AljonFernando/Assembly-x64#for_loop.asm)

```asm
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

```


## While Loop

[Replit](https://replit.com/@AljonFernando/Assembly-x64#while_loop.asm)

```asm
section .data
    msg db 'While loop: ', 0Ah
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

while_loop:
    ; Loop condition
    mov al, [count]
    cmp al, 10
    jge end_while_loop

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
    jmp while_loop

end_while_loop:
    ; Exit program
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall             ; call kernel

```


## Do-While Loop

[Replit](https://replit.com/@AljonFernando/Assembly-x64#do-while_loop.asm)

```asm
section .data
    msg db 'Do-while loop: ', 0Ah
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

do_while_loop:
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

    ; Loop condition
    mov al, [count]
    cmp al, 10
    jl do_while_loop

    ; Exit program
    mov rax, 60         ; sys_exit
    xor rdi, rdi        ; exit code 0
    syscall             ; call kernel

```
